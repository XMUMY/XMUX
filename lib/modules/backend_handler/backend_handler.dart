library backend_handler;

import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

part "http_handler.dart";

class BackendHandler {
  final List<String> _addresses;

  BackendHandler(this._addresses);

  Future<http.Response> get(String api) async => await Future
      .any(_addresses.map((address) => HttpHandler.get(address, api)).toList());

  Future<http.Response> post(String api, Map<String, dynamic> body) async =>
      await Future.any(_addresses
          .map((address) => HttpHandler.post(address, api, body))
          .toList());
}
