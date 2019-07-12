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
  Future<AttendResult> attend(
      String uid, String cid, String ip, List<int> signature) async {
    var uri = Uri.parse('$address/attend.php');

    var req = http.MultipartRequest('POST', uri);
    req.fields['uid'] = uid.toUpperCase();
    req.fields['cid'] = cid.toUpperCase();
    req.fields['ip'] = ip;
    req.files.add(http.MultipartFile.fromBytes('signature', signature));

    var resStream = await req.send();
    var res = await resStream.stream.bytesToString();
    Map<String, dynamic> json = jsonDecode(res);

    return AttendResult.fromJson(json);
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
    var uri = Uri.parse('$address/history.php').replace(queryParameters: {
      'uid': uid,
      if (cid != null) 'cid': cid,
    });
    var res = await http.get(uri);
    List json = jsonDecode(res.body);

    return json.map((e) => AttendanceRecord.fromJson(e)).toList();
  }
}
