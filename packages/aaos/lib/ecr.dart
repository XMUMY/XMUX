import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:html/dom.dart' show Text;
import 'package:html/parser.dart';

import 'model.dart';

const _acUrl = 'https://ac.xmu.edu.my';

class ElectiveCourseRegistration {
  final _dio = Dio(BaseOptions(baseUrl: _acUrl))
    ..interceptors.add(CookieManager(CookieJar()));

  final String _uid, _password;

  /// Future for login procedure.
  Future<void>? _loginFuture;

  ElectiveCourseRegistration(this._uid, this._password);

  /// Ensure login successfully.
  Future<void> ensureSignedIn() async {
    _loginFuture ??= login();
    await _loginFuture;
  }

  /// Login with given credential.
  /// Throws [Exception] if failed.
  Future<void> login() async {
    try {
      await _dio.post('/index.php?c=Login&a=login',
          options: Options(contentType: 'application/x-www-form-urlencoded'),
          data: {
            'username': _uid,
            'password': _password,
            'user_lb': 'Student'
          });
    } on DioException catch (e) {
      if (e.response?.statusCode == 302) return;
    }
    throw Exception('Login failed');
  }

  /// Get list for registration available.
  Future<List<ElectiveSession>> get sessions async {
    final resp = await _dio.post('/student/index.php?c=Xk&a=index');
    final table = parse(resp.data).querySelector('#data_table');

    if (table == null) return [];

    final heads = table.querySelectorAll('th').map((e) => e.text).toList();
    final courseList = table
        .querySelectorAll('tbody tr')
        .map((line) => line.children.map((cell) {
              // Get link from Entry button.
              if (cell.text.replaceAll(RegExp('\n| '), '').isEmpty) {
                return RegExp("'(.*?)'")
                    .firstMatch(cell.children.first.attributes['onclick']!)
                    ?.group(0)
                    ?.replaceAll("'", '');
              }

              final text = cell.text.trim();

              // Get link from View's href.
              if (text == 'View') {
                return cell.children.first.attributes['href'];
              }

              return text;
            }).toList())
        .map((e) => Map.fromIterables(heads, e))
        .map(ElectiveSession.fromJson)
        .toList();

    return courseList;
  }

  /// Get registered courses.
  Future<List<CourseRegistered>?> getRegistered(String entry) async {
    if (!entry.startsWith('/student/index.php?c=Xk&')) {
      return null;
    }

    final resp = await _dio.get(entry);
    final table = parse(resp.data).querySelector('#data_table');

    if (table == null) return [];

    final heads =
        table.querySelectorAll('thead th').map((e) => e.text).toList();
    final courseList = table
        .querySelectorAll('tbody tr')
        .where((line) => line.children.length == heads.length)
        .map(
          (line) => line.children.map(
            (cell) => cell.nodes.length < 3
                // Normal cell.
                ? cell.text.trim()
                // Multiline cell, keep \n
                : cell.nodes
                    .whereType<Text>()
                    .map((node) => node.text.trim())
                    .join('\n'),
          ),
        )
        .map((e) => Map.fromIterables(heads, e))
        .map(CourseRegistered.fromJson)
        .toList();

    return courseList;
  }

  ElectiveCourseRegistrationForm? getForm(String entry) =>
      entry.startsWith('/student/index.php?c=Xk&')
          ? ElectiveCourseRegistrationForm(_dio, entry)
          : null;
}

class ElectiveCourseRegistrationForm {
  final Dio _dio;
  final String entry;

  String? currentState;
  ElectiveSessionFormData? data;

  /// For course listener.
  Timer? _timer;

  ElectiveCourseRegistrationForm(this._dio, this.entry);

  /// Refresh [data].
  ///
  /// Will parse without request if `html != null`.
  Future<void> refresh([String? html]) async {
    if (html == null) {
      final resp = await _dio.get(entry);
      html = resp.data;
    }
    final doc = parse(html);

    currentState =
        doc.querySelector('input[name="__VIEWSTATE"]')?.attributes['value'];

    final generalInfoTable = doc.querySelector('#content table');
    if (generalInfoTable == null) return;
    final infoHead = generalInfoTable.querySelectorAll('th').map((e) => e.text);
    final infoMap = Map.fromIterables(
      infoHead,
      generalInfoTable.querySelectorAll('.odd td').map((e) => e.text.trim()),
    );

    final selectedTable = doc.querySelector('#data_table2');
    if (selectedTable == null) return;
    final selectedHead =
        selectedTable.querySelectorAll('th').map((e) => e.text);
    final selectedCourses = selectedTable
        .querySelectorAll('tbody tr')
        .map((row) => row.children.map((cell) {
              // Button.
              if (cell.children.isNotEmpty &&
                  cell.text.replaceAll(RegExp('\n| '), '').isEmpty) {
                return RegExp(",'(.*?)'")
                    .firstMatch(cell.children.first.attributes['onclick']!)
                    ?.group(0)
                    ?.replaceAll(RegExp("'|,"), '');
              }

              // Multiline cell, keep \n
              if (cell.nodes.length >= 3) {
                return cell.nodes
                    .whereType<Text>()
                    .map((node) => node.text.trim())
                    .join('\n');
              }

              // Normal cell.
              return cell.text.trim();
            }))
        .map((row) =>
            row.length == 1 ? null : Map.fromIterables(selectedHead, row))
        .toList()
      ..removeWhere((c) => c == null);

    var unselectedTable = doc.querySelector('#data_table');
    if (unselectedTable == null) return;
    var unselectedHead = unselectedTable
        .querySelectorAll('#data_table>thead>tr>th')
        .map((e) => e.text);
    var unselectedCourses = unselectedTable
        .querySelectorAll('#data_table>tbody>tr:not([style="display: none"])')
        .map((row) => row.children.map((cell) {
              if (cell.text.replaceAll(RegExp('\n| '), '').isEmpty) {
                return RegExp(",'(.*?)'")
                    .firstMatch(cell.children.first.attributes['onclick']!)
                    ?.group(0)
                    ?.replaceAll(RegExp("'|,"), '');
              }

              return cell.text.trim();
            }))
        .map((row) => Map.fromIterables(unselectedHead, row))
        .toList();

    data = ElectiveSessionFormData.fromJson({
      'formGeneralInfo': infoMap,
      'coursesSelected': selectedCourses,
      'coursesList': unselectedCourses
    });
  }

  /// Add course of given ID.
  Future<void> add(String id) async {
    var resp = await _dio.post(
      entry,
      options: Options(contentType: 'application/x-www-form-urlencoded'),
      data: {
        '__EVENTTARGET': '\$Add',
        '__EVENTARGUMENT': '\$$id',
        '__VIEWSTATE': currentState
      },
    );
    await refresh(resp.data);
  }

  /// Drop course of given ID.
  Future<void> drop(String id) async {
    var resp = await _dio.post(
      entry,
      options: Options(contentType: 'application/x-www-form-urlencoded'),
      data: {
        '__EVENTTARGET': '\$Del',
        '__EVENTARGUMENT': '\$$id',
        '__VIEWSTATE': currentState
      },
    );
    await refresh(resp.data);
  }

  /// Whether listener is listening.
  bool get isListening => _timer?.isActive ?? false;

  /// Add course listener. Add automatically when available.
  Future<void> listen(CourseUnselected course) async {
    _timer?.cancel();
    final completer = Completer<void>();
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) async {
        try {
          await refresh();
          final target = data?.coursesList.firstWhere(
            (e) => e.name == course.name,
          );
          if (target != null && target.canSelect == true) {
            await add(target.option);
            _timer?.cancel();
            completer.complete();
          }
        } catch (e) {
          _timer?.cancel();
          completer.completeError(e);
          rethrow;
        }
      },
    );
    return completer.future;
  }

  /// Cancel course listener.
  void cancel() => _timer?.cancel();
}
