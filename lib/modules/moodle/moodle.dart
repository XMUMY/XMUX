library moodle;

import 'package:dio/dio.dart';

import 'models/assignment.dart';

class MoodleApi {
  /// HTTP client for API calls.
  final Dio _dio;

  /// Moodle token.
  String _token;

  MoodleApi(String baseUrl)
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 6000,
          receiveTimeout: 10000,
          contentType: 'application/x-www-form-urlencoded',
        ));

  /// Authenticate with given credential and get web service token.
  Future<void> login(String username, String password) async {
    var resp = await _dio.post<Map<String, dynamic>>('/login/token.php', data: {
      'username': username,
      'password': password,
      'service': 'moodle_mobile_app',
    });

    _token = resp.data['token'];
  }

  /// Invoke Moodle web service API.
  Future<Map<String, dynamic>> _invoke(String function) async {
    var resp = await _dio
        .post<Map<String, dynamic>>('/webservice/rest/server.php', data: {
      'moodlewsrestformat': 'json',
      'wstoken': _token,
      'wsfunction': function,
    });

    return resp.data;
  }

  /// Get assignments.
  Future<List<Course>> get assignments async {
    var resp = await _invoke('mod_assign_get_assignments');

    return List<Map<String, dynamic>>.from(resp['courses'])
        .map((c) => Course.fromJson(c))
        .where((c) => c.assignments.isNotEmpty)
        .toList();
  }
}
