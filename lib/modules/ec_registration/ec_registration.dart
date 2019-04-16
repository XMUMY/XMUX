import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import 'models.dart';

export 'models.dart';

class ElectiveCourseRegistration {
  final _dio = Dio()..interceptors.add(CookieManager(CookieJar()));
  final String _uid, _password;

  ElectiveCourseRegistration(this._uid, this._password);

  /// Ensure login successfully with given credential.
  /// Throws `Exception` if failed.
  Future<Null> ensureLogin() async {
    try {
      await _dio.post('http://ac.xmu.edu.my/index.php?c=Login&a=login',
          options: Options(
            contentType: ContentType.parse('application/x-www-form-urlencoded'),
          ),
          data: {
            'username': _uid,
            'password': _password,
            'user_lb': 'Student'
          });
    } on DioError catch (e) {
      if (e.response.statusCode == 302) return;
    }
    throw Exception('Login failed.');
  }

  /// Get list for registration available.
  Future<List<ElectiveCourse>> getList() async {
    var res =
        await _dio.post('http://ac.xmu.edu.my/student/index.php?c=Xk&a=index');
    var table = parse(res.data).querySelector('#data_table');

    var heads = table.querySelectorAll('th').map((e) => e.text).toList();
    var courseList = table
        .querySelectorAll('tbody tr')
        .map((c) => c.children.map((e) {
              if (e.text.replaceAll(RegExp('\n| '), '').isEmpty)
                return RegExp("'(.*?)'")
                    .firstMatch(e.children.first.attributes['onclick'])
                    .group(0)
                    .replaceAll("'", '');
              return e.text.replaceAll(RegExp(r'^\s+|\s+$|\n'), '');
            }).toList())
        .map((e) => Map.fromIterables(heads, e))
        .map(ElectiveCourse.fromJson)
        .toList();

    return courseList;
  }
}
