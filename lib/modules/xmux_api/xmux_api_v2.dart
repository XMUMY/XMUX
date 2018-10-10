library xmux.api_v2;

import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:xmux/modules/backend_handler/backend_handler.dart';

/// The general response of XMUX API V2 from server.
class XMUXApiResponse {
  /// Status of API call including *success* and *error*.
  ///
  /// **Attention:**
  /// This status *only* only represent the status of server-side processing.
  final String status;

  /// The time of this request being processed.
  final DateTime timestamp;

  /// Response data.
  final dynamic data;

  /// The description of error. Only available when status is error.
  String error;

  /// Moodle token. Only available when moodle token refreshed.
  String moodleKey;

  XMUXApiResponse(this.status, this.timestamp, this.data,
      {this.error, this.moodleKey});
}

class XMUXApi {
  BackendHandler handler;
  static XMUXApi instance;

  @protected
  List<String> addresses;

  factory XMUXApi(List<String> addresses) {
    if (instance == null) instance = XMUXApi._(addresses);
    instance.handler = BackendHandler(addresses);
    return instance;
  }

  XMUXApi._(this.addresses);

  Future<XMUXApiResponse> call(
      {@required String api, @required Map body}) async {
    var res = await handler.post(api, body);
    var resJson = jsonDecode(res.body);
    return XMUXApiResponse(
        resJson["status"],
        DateTime.fromMillisecondsSinceEpoch(resJson["timeStamp"]),
        resJson["data"],
        error: resJson["error"] ?? null,
        moodleKey: resJson["moodleKey"] ?? null);
  }
}
