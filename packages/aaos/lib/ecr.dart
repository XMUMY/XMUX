import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
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
    } on DioError catch (e) {
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

              final text = cell.text.replaceAll(RegExp(r'^\s+|\s+$|\n'), '');

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
    if (!entry.startsWith('/ac.xmu.edu.my/student/index.php?c=Xk&')) {
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
        .map((line) => line.children
            .map((cell) => cell.text.replaceAll(RegExp(r'^\s+|\s+$'), ''))
            .toList())
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

//   String currentState;
//   ElectiveCourseFormData data;

//   /// For course listener.
//   Timer _timer;

  ElectiveCourseRegistrationForm(this._dio, this.entry);

//   /// Add course listener. Add automatically when available.
//   void listen(CourseUnselected course, VoidCallback onRegistered) {
//     _timer = Timer.periodic(Duration(seconds: 2), (_) async {
//       try {
//         await refresh();
//         var courseUnderListen =
//             data.coursesList.firstWhere((e) => e.name == course.name);
//         if (courseUnderListen.canSelect) {
//           await add(courseUnderListen.option);
//           onRegistered();
//         }
//       } catch (e) {
//         // If error, cancel directly.
//         onRegistered();
//         rethrow;
//       }
//     });
//   }

//   /// Cancel course listener.
//   void cancelListener() => _timer.cancel();

//   /// Whether listener is listening.
//   bool get isListening => _timer?.isActive ?? false;

//   /// Refresh `data`.
//   ///
//   /// Will parse without request if `html != null`.
//   Future<Null> refresh({String html}) async {
//     if (html == null) {
//       var res = await _dio.get('$entry');
//       html = res.data;
//     }
//     var doc = parse(html);

//     currentState =
//         doc.querySelector('input[name="__VIEWSTATE"]').attributes['value'];

//     var generalInfoTable = doc.querySelector('#content table');
//     var infoHead = generalInfoTable.querySelectorAll('th').map((e) => e.text);
//     var infoMap = Map.fromIterables(infoHead,
//         generalInfoTable.querySelectorAll('.odd td').map((e) => e.text));

//     var selectedTable = doc.querySelector('#data_table2');
//     var selectedHead = selectedTable.querySelectorAll('th').map((e) => e.text);
//     var selectedCourses = selectedTable
//         .querySelectorAll('tbody tr')
//         .map((row) => row.children.map((e) {
//               if (e.text.replaceAll(RegExp('\n| '), '').isEmpty &&
//                   e.children.isNotEmpty)
//                 return RegExp(",'(.*?)'")
//                     .firstMatch(e.children.first.attributes['onclick'])
//                     .group(0)
//                     .replaceAll(RegExp("'|,"), '');
//               return e.text.replaceAll(RegExp(r'^\s+|\s+$|\n'), '');
//             }))
//         .map((row) =>
//             row.length != 1 ? Map.fromIterables(selectedHead, row) : null)
//         .toList();

//     var unselectedTable = doc.querySelector('#data_table');
//     var unselectedHead = unselectedTable
//         .querySelectorAll('#data_table>thead>tr>th')
//         .map((e) => e.text);
//     var unselectedCourses = unselectedTable
//         .querySelectorAll('#data_table>tbody>tr:not([style="display: none"])')
//         .map((row) => row.children.map((e) {
//               if (e.text.replaceAll(RegExp('\n| '), '').isEmpty)
//                 return RegExp(",'(.*?)'")
//                     .firstMatch(e.children.first.attributes['onclick'])
//                     .group(0)
//                     .replaceAll(RegExp("'|,"), '');
//               return e.text.replaceAll(RegExp(r'^\s+|\s+$|\n'), '');
//             }))
//         .map((row) => Map.fromIterables(unselectedHead, row))
//         .toList();

//     selectedCourses.removeWhere((c) => c == null);
//     data = ElectiveCourseFormData.fromJson({
//       'formGeneralInfo': infoMap,
//       'coursesSelected': selectedCourses,
//       'coursesList': unselectedCourses
//     });
//   }

//   /// Add course of given ID.
//   Future<Null> add(String id) async {
//     var res = await _dio.post(
//       '$entry',
//       options: Options(contentType: 'application/x-www-form-urlencoded'),
//       data: {
//         '__EVENTTARGET': '\$Add',
//         '__EVENTARGUMENT': '\$$id',
//         '__VIEWSTATE': currentState
//       },
//     );
//     await refresh(html: res.data);
//   }

//   /// Cancel course of given ID.
//   Future<Null> cancel(String id) async {
//     var res = await _dio.post(
//       '$entry',
//       options: Options(contentType: 'application/x-www-form-urlencoded'),
//       data: {
//         '__EVENTTARGET': '\$Del',
//         '__EVENTARGUMENT': '\$$id',
//         '__VIEWSTATE': currentState
//       },
//     );
//     await refresh(html: res.data);
//   }
}
