library xmux.api_v2;

import 'package:meta/meta.dart';
import 'package:xmux/modules/backend_handler/backend_handler.dart';

enum XMUXApiResponseStatus { success, error }

class XMUXApi {
  BackendHandler handler = BackendHandler.instance;
  static XMUXApi instance;

  @protected
  List<String> addresses;

  factory XMUXApi(List<String> addresses) {
    if (instance == null) instance = XMUXApi._(addresses);
    return instance;
  }

  XMUXApi._(this.addresses);
}

class XMUXApiResponse {
  final String status;
  final DateTime timeStamp;
  final dynamic data;

  XMUXApiResponse(this.status, this.timeStamp, this.data);
}
