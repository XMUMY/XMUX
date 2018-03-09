import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xmux/config.dart';

Future<http.Response> backendApiHandler(
        {@required context, @required String api, @required Map body}) async =>
    await http.post(
      BackendApiConfig.address,
      headers: {
        "Accept-Language": Localizations.localeOf(context).languageCode +
            "-" +
            Localizations.localeOf(context).countryCode +
            "," +
            Localizations.localeOf(context).languageCode +
            "zh;q=0.9"
      },
      body: body,
    );
