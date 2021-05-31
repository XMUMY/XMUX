library emgs;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

export 'model.dart';

/// Parse nationality to EMGS country code.
/// Return [null] if unsupported.
String? getCountryCode(String nationality) {
  switch (nationality) {
    case 'Chinese':
      return 'CHN';
    default:
      return null;
  }
}

/// Get application status from EMGS API.
Future<EmgsApplicationResult> getApplicationStatus(
  String passport,
  String nationality,
) async {
  final resp = await http.post(
    Uri.parse(
      'http://mobileapp.emgs.com.my/api_v2/web/app.php/applicationstatus/$nationality/$passport',
    ),
  );
  return EmgsApplicationResult.fromJson(jsonDecode(resp.body));
}
