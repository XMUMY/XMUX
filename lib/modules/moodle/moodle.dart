import 'package:dio/dio.dart';

import 'models/assignment.dart';
import 'models/notification.dart';
import 'models/upcoming_event.dart';

class MoodleApi {
  /// HTTP client for API calls.
  final Dio _dio;

  /// Login credential.
  String _username, _password;

  /// Moodle token.
  String _token;

  /// User ID on Moodle.
  int _userId;

  MoodleApi(String baseUrl)
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 6000,
          receiveTimeout: 10000,
          contentType: 'application/x-www-form-urlencoded',
        ));

  /// Store login credential.
  void withCredential(String username, String password) {
    _username = username;
    _password = password;
  }

  /// Authenticate with credential and get web service token && user ID.
  Future<void> login() async {
    var loginResp =
        await _dio.post<Map<String, dynamic>>('/login/token.php', data: {
      'username': _username,
      'password': _password,
      'service': 'moodle_mobile_app',
    });
    _token = loginResp.data['token'];

    var siteInfoResp = await _invoke('core_webservice_get_site_info');
    _userId = siteInfoResp['userid'];
  }

  /// Reset web service token and credential.
  void signOut() => _userId = _token = _username = _password = null;

  /// Append moodle token to url if available.
  String withToken(String url) {
    if (_token == null) return url;
    var uri = Uri.parse(url);
    return uri.replace(queryParameters: {
      ...uri.queryParameters,
      'token': _token,
    }).toString();
  }

  void _ensureSignedIn() async {
    if (_token == null) await login();
  }

  void _ensureUserId() async {
    if (_userId == null) await login();
  }

  /// Invoke Moodle web service API.
  Future<Map<String, dynamic>> _invoke(
    String function, {
    Map<String, dynamic> params,
  }) async {
    await _ensureSignedIn();
    var resp = await _dio
        .post<Map<String, dynamic>>('/webservice/rest/server.php', data: {
      'moodlewsrestformat': 'json',
      'wstoken': _token,
      'wsfunction': function,
      if (params != null) ...params,
    });

    return resp.data;
  }

  /// Get assignments.
  Future<List<AssignmentCourse>> get assignments async {
    var resp = await _invoke('mod_assign_get_assignments');

    return List<Map<String, dynamic>>.from(resp['courses'])
        .map((c) => AssignmentCourse.fromJson(c))
        .where((c) => c.assignments.isNotEmpty)
        .toList();
  }

  /// Get popup notifications.
  Future<List<Notification>> getPopupNotifications({int offset = 0}) async {
    await _ensureUserId();
    var resp = await _invoke('message_popup_get_popup_notifications', params: {
      'useridto': _userId,
      'newestfirst': 1,
      'offset': offset,
      'limit': 10,
    });

    return List<Map<String, dynamic>>.from(resp['notifications'])
        .map((c) => Notification.fromJson(c))
        .toList();
  }

  /// Get upcoming events.
  Future<List<UpcomingEvent>> get upcomingEvents async {
    var resp = await _invoke('core_calendar_get_calendar_upcoming_view');

    return List<Map<String, dynamic>>.from(resp['events'])
        .map((e) => UpcomingEvent.fromJson(e))
        .toList();
  }
}
