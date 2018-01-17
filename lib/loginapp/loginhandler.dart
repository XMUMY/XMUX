import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/initapp/init.dart';

class LoginHandler {
  static Future<Map<String, dynamic>> loginAuth(
      String id, String password) async {
    var response = await http.post(BackendApiConfig.address + "/login", body: {
      "id": id,
      "cpass": password,
    });
    if (response.statusCode >= 300) {
      return {"error": response.reasonPhrase};
    }
    Map resJson = JSON.decode(response.body);
    if (resJson.containsKey("error")) {
      String error = resJson["error"];
      return {"error": error};
    }

    globalPersonalInfoState.id = id;
    globalPersonalInfoState.password = password;
    globalCalendarState.classesData = resJson["timetable"];
    globalCalendarState.examsData = resJson["exam"];
    globalCalendarState.assignmentData = resJson["assignment"];

    _save(
        JSON.encode({
          "campusId": globalPersonalInfoState.id,
          "password": globalPersonalInfoState.password,
        }),
        "login.dat");
    _save(response.body, "loginData.json");
    return {"success": true};
  }

  static Future<Map<String, dynamic>> ePaymentAuth(
      String id, String password) async {
    var response = await http.post(BackendApiConfig.address + "/bill", body: {
      "id": id,
      "pass": password,
    });
    if (response.statusCode >= 300) {
      return {"error": response.reasonPhrase};
    }
    Map resJson = JSON.decode(response.body);
    if (resJson.containsKey("error")) {
      String error = resJson["error"];
      return {"error": error};
    }

    globalPersonalInfoState.ePaymentPassword = password;
    globalCalendarState.paymentData = resJson;

    _save(
        JSON.encode({
          "campusId": globalPersonalInfoState.id,
          "password": globalPersonalInfoState.password,
          "ePaymentPassword": globalPersonalInfoState.ePaymentPassword,
        }),
        "login.dat");
    return {"success": true};
  }

  static Future<Map<String, dynamic>> firebaseLogin() async {
    try {
      if (await FirebaseAuth.instance.currentUser() == null)
        firebaseUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: globalPersonalInfoState.id + "@xmu.edu.my",
            password: globalPersonalInfoState.password);
      else
        firebaseUser = await FirebaseAuth.instance.currentUser();
    } catch (e) {
      return {"error": e.toString()};
    }

    globalPersonalInfoState.fullName = firebaseUser.displayName;
    globalPersonalInfoState.avatarURL = firebaseUser.photoUrl;

    return {"success": true};
  }

  static Future<Null> _save(String fileText, String fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$dir/$fileName')).writeAsString(fileText);
  }
}
