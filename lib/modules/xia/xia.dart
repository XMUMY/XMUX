library xia;

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:googleapis/dialogflow/v2.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/globals.dart';

part 'dialogflow.dart';
part 'xia_ui.dart';

class XiA {
  final Dialogflow _dialogflow;

  static XiA _instance;

  factory XiA(Client client) {
    if (_instance == null) _instance = XiA._(client);
    return _instance;
  }

  XiA._(Client client) : this._dialogflow = Dialogflow(client);

  /// Init XiA instance from GCP credentials.
  static Future<XiA> init(String credentials) async {
    final _credentials = ServiceAccountCredentials.fromJson(
        String.fromCharCodes(base64Decode(credentials)));
    const _SCOPES = const [DialogflowApi.CloudPlatformScope];
    return XiA(await clientViaServiceAccount(_credentials, _SCOPES));
  }

  /// Get widget of XiA.
  Widget get page => XiAPage(this);
}
