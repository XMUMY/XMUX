library backend_handler;

import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part "http_handler.dart";

class BackendHandler {
  @protected
  static BackendHandler instance;

  static String currentApiAddress;
  final List<String> _addresses;

  final _connectivity = Connectivity();
  ConnectivityResult _lastConnectivityResult;
  // Future of selectBackend function for listening selecting status.
  static Future<Null> selectingBackend;

  factory BackendHandler(List<String> addresses) {
    if (instance == null) instance = BackendHandler._(addresses);
    return instance;
  }

  BackendHandler._(this._addresses) {
    currentApiAddress = _addresses[0];
    selectingBackend = selectBackend();

    // Listen when connectivity change.
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result != ConnectivityResult.none &&
          result != _lastConnectivityResult &&
          _lastConnectivityResult != null) selectingBackend = selectBackend();
      _lastConnectivityResult = result;
    });
  }

  Future<Null> selectBackend() async {
    print("BackendHandler/backendSelector: Selecting backend.");

    // Select the fastest server in 5 second.
    // When timeout or error, it will return the last address.
    var selected = await Future.any(_addresses.map((String address) async {
      var res = await _HttpHandler.get(address, "/test");
      if (res.statusCode == 200) return address;
    }).toList())
        .timeout(Duration(seconds: 5), onTimeout: () => currentApiAddress)
        .catchError((e) => currentApiAddress);

    if (selected.isNotEmpty) currentApiAddress = selected;
    print("BackendHandler/backendSelector: Selected: $selected");
  }

  Future<http.Response> get(String api) async =>
      await _HttpHandler.get(currentApiAddress, api);

  Future<http.Response> post(String api, Map<String, String> body) async =>
      await _HttpHandler.post(currentApiAddress, api, body);
}
