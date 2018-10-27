library xmux.api_v2;

import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import 'models/models_v2.dart';

export 'models/models_v2.dart';

/// The authentication method for XMUX API.
class XMUXApiAuth {
  final String campusID;
  final String campusIDPassword;
  final String ePaymentPassword;

  /// Moodle key is only used for speeding up moodle fetching.
  final String moodleKey;

  XMUXApiAuth(
      {this.campusID,
      this.campusIDPassword,
      this.ePaymentPassword,
      this.moodleKey});
}

/// The general exception for XMUX API.
class XMUXApiException implements Exception {
  /// The error from server.
  final String message;

  XMUXApiException(this.message);

  String toString() => "XMUXApiV2/Exception: $message";
}

/// The general response of XMUX API V2 from server.
class XMUXApiResponse<dataType> {
  /// Status of API call including *success* and *error*.
  ///
  /// **Attention:**
  /// This status *only* only represent the status of server-side processing.
  final String status;

  /// The time of this request being processed.
  final DateTime timestamp;

  /// Response data.
  final dataType data;

  /// Moodle token. Only available when moodle token refreshed.
  String moodleKey;

  XMUXApiResponse(this.status, this.timestamp, this.data, {this.moodleKey});
}

/// XMUX API V2
class XMUXApi {
  /// Back-end API addresses.
  List<String> _addresses;

  /// The API address currently used.
  String currentAddress;

  /// Connectivity instance.
  final _connectivity = Connectivity();

  /// Last connection status.
  ConnectivityResult _lastConnectivityResult;

  /// Dio instance for http requests.
  final dio = Dio();

  /// Future of selectServer function for listening selecting status.
  static Future<Null> selectingServer;

  /// Instance to make the object unique.
  static XMUXApi _instance;

  factory XMUXApi(List<String> addresses) {
    if (_instance == null) _instance = XMUXApi._(addresses);
    return _instance;
  }

  XMUXApi._(this._addresses) {
    currentAddress = _addresses[0];
    selectingServer = selectServer();

    // Dio options.
    dio.options.baseUrl = _addresses[0] + '/v2';
    dio.options.connectTimeout = 1000;
    configure();

    // Listen and reselect server when connectivity change.
    _connectivity.onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none &&
          result != _lastConnectivityResult &&
          _lastConnectivityResult != null) selectingServer = selectServer();
      _lastConnectivityResult = result;
    });
  }

  /// Configure XMUX API V2.
  void configure({String jwt}) {
    // Add system language to header.
    dio.options.headers.addAll({
      'Accept-Language':
          '${Platform.localeName.replaceAll('_', '-')},${Platform.localeName.substring(0, 2)};q=0.9',
    });

    // Add JWT token if exist.
    if (jwt != null)
      dio.options.headers.addAll({'Authorization': 'Bearer $jwt'});
    else
      dio.options.headers.remove('Authorization');
  }

  XMUXApiResponse<ResponseType> _generateResponse<JsonType, ResponseType>(
      Response<Map<String, dynamic>> response,
      ResponseType fromJson(JsonType json)) {
    // If status is error, throw an Exception contains error message.
    if (response.data['status'] == 'error')
      throw XMUXApiException(response.data['error']);
    // Construct response from json.
    return XMUXApiResponse<ResponseType>(
        response.data['status'],
        DateTime.fromMillisecondsSinceEpoch(response.data['timestamp']),
        fromJson(response.data['data']),
        moodleKey: response.data['moodleKey']);
  }

  Future<Null> selectServer() async {
    print('XMUXApiV2/ServerSelector: Selecting...');

    // Select the fastest server in 5 second.
    // When timeout or error, it will return the last address.
    var selected = await Future.any(_addresses.map((String address) async {
      var res = await dio.get(address + '/test');
      if (res.statusCode == 200) return address;
    }).toList())
        .timeout(Duration(seconds: 3), onTimeout: () => currentAddress)
        .catchError((e) => currentAddress);

    currentAddress = selected;
    dio.options.baseUrl = selected + '/v2';
    print('XMUXApiV2/ServerSelector: Selected: $currentAddress');
  }

  Future<XMUXApiResponse<AcData>> ac(XMUXApiAuth auth) async {
    var response = await dio.post<Map<String, dynamic>>('/ac',
        data: {'id': auth.campusID, 'pass': auth.campusIDPassword});
    return _generateResponse<Map<String, dynamic>, AcData>(
        response, AcData.fromJson);
  }

  Future<XMUXApiResponse<AcData>> acCourses(XMUXApiAuth auth) async {
    var response = await dio.post<Map<String, dynamic>>('/ac/courses',
        data: {'id': auth.campusID, 'pass': auth.campusIDPassword});
    return _generateResponse<List, AcData>(
        response, (courses) => AcData.fromJson({'courses': courses}));
  }

  Future<XMUXApiResponse<List<BillingRecord>>> bill(XMUXApiAuth auth) async {
    var response = await dio.post<Map<String, dynamic>>('/bill',
        data: {'id': auth.campusID, 'pass': auth.ePaymentPassword});
    return _generateResponse<List, List<BillingRecord>>(
        response, (b) => b.map((b) => BillingRecord.fromJson(b)).toList());
  }

  Future<XMUXApiResponse<Null>> login(XMUXApiAuth auth) async {
    var response = await dio.post<Map<String, dynamic>>('/login',
        data: {'id': auth.campusID, 'pass': auth.campusIDPassword});
    return _generateResponse(response, (_) {});
  }

  Future<XMUXApiResponse<MoodleData>> moodle(XMUXApiAuth auth) async {
    var response = await dio.post<Map<String, dynamic>>('/moodle', data: {
      'id': auth.campusID,
      'pass': auth.campusIDPassword,
      'moodleKey': auth.moodleKey
    });
    return _generateResponse<Map<String, dynamic>, MoodleData>(
        response, MoodleData.fromJson);
  }
}
