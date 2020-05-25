library moodle;

import 'package:dio/dio.dart';
import 'package:xmux/modules/moodle/models/upcoming_event.dart';

import 'models/assignment.dart';
import 'models/notification.dart';

export 'models/assignment.dart';
export 'models/notification.dart';

class MoodleApi {
  /// HTTP client for API calls.
  final Dio _dio;

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

  String get token => _token;

  /// Authenticate with given credential and get web service token.
  Future<void> login(String username, String password) async {
    var resp = await _dio.post<Map<String, dynamic>>('/login/token.php', data: {
      'username': username,
      'password': password,
      'service': 'moodle_mobile_app',
    });

    _token = resp.data['token'];
  }

  /// Reset web service token.
  void signOut() => _token = _userId = null;

  /// Append moodle token to url if available.
  String withToken(String url) {
    if (token == null) return url;
    var uri = Uri.parse(url);
    return uri.replace(queryParameters: {
      ...uri.queryParameters,
      'token': _token,
    }).toString();
  }

  /// Invoke Moodle web service API.
  Future<Map<String, dynamic>> _invoke(
    String function, {
    Map<String, dynamic> params,
  }) async {
    var resp = await _dio
        .post<Map<String, dynamic>>('/webservice/rest/server.php', data: {
      'moodlewsrestformat': 'json',
      'wstoken': _token,
      'wsfunction': function,
      if (params != null) ...params,
    });

    return resp.data;
  }

  /// Get site info for current user.
  Future<void> get siteInfo async {
    var resp = await _invoke('core_webservice_get_site_info');
    _userId = resp['userid'];
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
    if (_userId == null) await siteInfo;
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
