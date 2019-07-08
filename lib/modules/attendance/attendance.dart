import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

export 'model.dart';

class AttendanceApi {
  static AttendanceApi _instance;

  /// The base URL for attendance API.
  /// e.g. https://example.com
  String address;

  factory AttendanceApi(String address) {
    if (_instance == null) _instance = AttendanceApi._(address);
    return _instance;
  }

  AttendanceApi._(this.address);

  /// Sign in a class.
  Future<Null> attend(String uid, String cid, String ip) async {
    // TODO: Handle attendance.
  }

  /// Get attendance record status by ID.
  Future<AttendanceRecord> getRecord(String id) async {
    var uri = Uri.parse('$address/attendance.php')
      ..replace(queryParameters: {'id': id});
    var res = await http.get(uri);
    return AttendanceRecord.fromJson(jsonDecode(res.body));
  }

  /// Get attendance history.
  Future<List<AttendanceRecord>> getHistory(String uid, {String cid}) async {
    var uri = Uri.parse('$address/history.php')
      ..replace(queryParameters: {
        'uid': uid,
        if (cid != null) 'cid': cid,
      });
    var res = await http.get(uri);
    List json = jsonDecode(res.body);

    return json.map((e) => AttendanceRecord.fromJson(e)).toList();
  }
}
