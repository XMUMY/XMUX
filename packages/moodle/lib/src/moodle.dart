import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import 'model/assignment.dart';
import 'model/notification.dart';
import 'model/upcoming_event.dart';

part 'moodle.g.dart';

class MoodleException implements Exception {}

@JsonSerializable(createToJson: false)
class MoodleApiError extends MoodleException {
  @JsonKey(name: 'errorcode')
  final String errorCode;
  final String error;

  MoodleApiError({required this.errorCode, required this.error});

  factory MoodleApiError.fromJson(Map<String, dynamic> json) =>
      _$MoodleApiErrorFromJson(json);

  @override
  String toString() => error;
}

@JsonSerializable(createToJson: false)
class MoodleApiException extends MoodleException {
  @JsonKey(name: 'errorcode')
  final String errorCode;
  final String exception;
  final String message;

  MoodleApiException({
    required this.errorCode,
    required this.exception,
    required this.message,
  });

  factory MoodleApiException.fromJson(Map<String, dynamic> json) =>
      _$MoodleApiExceptionFromJson(json);

  @override
  String toString() => message;
}

class MoodleApi {
  /// HTTP client for API calls.
  final Dio _dio;

  /// Login credential.
  String? _username, _password;

  /// Moodle token.
  String? _token;

  /// User ID on Moodle.
  int? _userId;

  MoodleApi(String baseUrl)
      : _dio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(milliseconds: 6000),
          receiveTimeout: const Duration(milliseconds: 10000),
          contentType: 'application/x-www-form-urlencoded',
        ));

  /// Store login credential.
  void setCredential(String username, String password) {
    _username = username;
    _password = password;
  }

  /// Append moodle token to url if available.
  String withToken(String url) {
    if (_token == null) return url;
    final uri = Uri.parse(url);
    return uri.replace(queryParameters: {
      ...uri.queryParameters,
      'token': _token,
    }).toString();
  }

  Map<String, dynamic> _checkResponse(Response<Map<String, dynamic>> resp) {
    final data = resp.data;

    if (data == null) {
      throw MoodleApiError(
        errorCode: resp.statusCode.toString(),
        error: resp.statusMessage.toString(),
      );
    }

    if (data.containsKey('error')) {
      throw MoodleApiError.fromJson(data);
    }

    if (data.containsKey('exception')) {
      throw MoodleApiException.fromJson(data);
    }

    return data;
  }

  /// Authenticate with credential and get web service token && user ID.
  Future<void> login() async {
    final resp = await _dio.post<Map<String, dynamic>>(
      '/login/token.php',
      data: {
        'username': _username,
        'password': _password,
        'service': 'moodle_mobile_app',
      },
    );

    final data = _checkResponse(resp);
    _token = data['token'];
  }

  /// Reset web service token and credential.
  void signOut() => _userId = _token = _username = _password = null;

  Future<void> _ensureSignedIn() async {
    if (_token == null) await login();
  }

  /// Invoke Moodle web service API.
  Future<Map<String, dynamic>> _invoke(
    String function, {
    Map<String, dynamic>? params,
  }) async {
    await _ensureSignedIn();
    var resp = await _dio.post<Map<String, dynamic>>(
      '/webservice/rest/server.php',
      data: {
        'moodlewsrestformat': 'json',
        'wstoken': _token,
        'wsfunction': function,
        if (params != null) ...params,
      },
    );

    return _checkResponse(resp);
  }

  Future<int> get userId async {
    if (_userId == null) {
      var resp = await _invoke('core_webservice_get_site_info');
      _userId = resp['userid'];
    }
    return _userId!;
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
    var resp = await _invoke('message_popup_get_popup_notifications', params: {
      'useridto': await userId,
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
