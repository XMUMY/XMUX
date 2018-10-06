library xmux_api_v2;

import 'package:flutter/foundation.dart';

enum XMUXApiResponseStatusV2 { success, error }

class XMUXApiV2 {
  @protected
  static XMUXApiV2 instance;

  @protected
  List<String> addresses;

  factory XMUXApiV2(List<String> addresses) {
    if (instance == null) instance = XMUXApiV2._(addresses);
    return instance;
  }

  XMUXApiV2._(this.addresses);
}

class XMUXApiResponseV2 {
  final String status;
  final DateTime timeStamp;

  XMUXApiResponseV2(this.status, this.timeStamp);
}
