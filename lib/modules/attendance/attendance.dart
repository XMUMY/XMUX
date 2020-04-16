import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

export 'model.dart';

class AttendanceApi {
  static AttendanceApi _instance;

  // If api is available.
  bool available = false;

  /// The base URL for attendance API.
  /// e.g. https://example.com
  String _address;

  /// Campus ID.
  String _uid;

  /// Campus ID password.
  String _password;

  factory AttendanceApi({String address, String uid, String password}) {
    if (_instance == null) {
      if (address != null)
        _instance = AttendanceApi._(address);
      else
        throw Exception('address not found');
    }

    if (uid != null) _instance._uid = uid;
    if (password != null) _instance._password = password;
    return _instance;
  }

  AttendanceApi._(this._address) {
    // Check availability.
    Connectivity().onConnectivityChanged.listen((event) async {
      switch (event) {
        case ConnectivityResult.none:
          available = false;
          break;
        default:
          try {
            await http.get(_address).timeout(Duration(seconds: 5));
            available = true;
          } catch (e) {
            available = false;
          }
          break;
      }
    });
  }

  /// Sign in a class.
  Future<AttendResult> attend(
      String cid, String ip, List<int> signature) async {
    var uri = Uri.parse('$_address/attend.php');

    var req = http.MultipartRequest('POST', uri);
    req.fields['uid'] = _uid.toUpperCase();
    req.fields['cid'] = cid.toUpperCase();
    req.fields['ip'] = ip;
    req.files.add(http.MultipartFile.fromBytes('signature', signature));

    // Apply basic authorization.
    req.headers['Authorization'] =
        'Basic ${base64Encode(utf8.encode("$_uid:$_password"))}';

    var resStream = await req.send();
    var res = await resStream.stream.bytesToString();
    Map<String, dynamic> json = jsonDecode(res);

    return AttendResult.fromJson(json);
  }

  /// Get attendance record status by ID.
  Future<AttendanceRecord> getRecord(String id) async {
    var uri = Uri.parse('$_address/attendance.php')
      ..replace(queryParameters: {'id': id});
    var res = await http.get(uri);
    return AttendanceRecord.fromJson(jsonDecode(res.body));
  }

  /// Get attendance history.
  Future<List<AttendanceRecord>> getHistory({String cid}) async {
    var uri = Uri.parse('$_address/history.php').replace(queryParameters: {
      'uid': _uid,
      if (cid != null) 'cid': cid,
    });
    var res = await http.get(uri);
    List json = jsonDecode(res.body);

    return json.map((e) => AttendanceRecord.fromJson(e)).toList();
  }
}
