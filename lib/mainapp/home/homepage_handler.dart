import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/actions.dart';

class HomePageHandler {
  static Future<String> updateNews({BuildContext context}) async {
    // Get news from backend.
    var response = await backend.get("/v2/homepage/homepage.json");

    // Check error.
    if (response.statusCode >= 400) return response.reasonPhrase;

    var resMap = jsonDecode(response.body);

    // Check error.
    if (resMap["status"] == "error") return resMap["error"];

    // Update news.
    if ((resMap["news"] as List).isNotEmpty)
      mainAppStore.dispatch(UpdateNewsAction(resMap["news"]));

    return "success";
  }

  static Future<String> updateAnnouncements({BuildContext context}) async {
    // Get news from backend.
    var response = await backend.post("/v2/homepage/announcements", {
      "id": mainAppStore.state.personalInfoState.uid,
    });

    // Check error.
    if (response.statusCode >= 400) return response.reasonPhrase;

    var resMap = jsonDecode(response.body);

    // Check error.
    if (resMap["status"] == "error") return resMap["error"];

    // Update news.
    if ((resMap["announcements"] as List).isNotEmpty)
      mainAppStore.dispatch(UpdateAnnouncementAction(resMap["announcements"]));

    return "success";
  }
}
