import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';

class _CookieManager extends CookieManager {
  _CookieManager(super.cookieJar);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    cookieJar.loadForRequest(options.uri).then((cookies) {
      var cookie =
          CookieManager.getCookies(cookies..add(Cookie('collegecode', 'xmu')));
      if (cookie.isNotEmpty) {
        options.headers[HttpHeaders.cookieHeader] = cookie;
      }
      handler.next(options);
    }).catchError((e, stackTrace) {
      var err = DioException(
        requestOptions: options,
        error: e,
        stackTrace: stackTrace,
      );
      handler.reject(err, true);
    });
  }
}

/// A spider for Barracuda Campus student portal.
class BCStudent {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://www.barracudacampus.com/stud/index.php',
    connectTimeout: const Duration(milliseconds: 5000),
    receiveTimeout: const Duration(milliseconds: 5000),
    contentType: 'application/x-www-form-urlencoded',
  ))
    ..interceptors.add(_CookieManager(CookieJar()));

  /// Login credential.
  String? _username, _password;

  /// Store login credential.
  void setCredential(String username, String password) {
    _username = username;
    _password = password;
  }

  /// Login with username and password.
  Future<void> login() async {
    try {
      await _dio.post(
        '/student/login',
        data: {
          'matrixno': Uri.encodeComponent(_username!),
          'pass': Uri.encodeComponent(_password!),
          'campus': 'xmu',
          'submit': 'Login',
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode != 302) rethrow;
      final location = e.response?.headers['Location'];
      if (location?.first.contains('/student/login') ?? false) {
        throw 'Login Failed';
      }
      return;
    }
  }

  Future<List<PaymentRecord>> get payments async {
    final resp = await _dio.post('/student/payment');

    final doc = parse(resp.data);
    if (doc.querySelector('title')?.text == 'Term of Services') throw 'TOS';

    final details =
        doc.querySelector('table.list')?.querySelectorAll('tr') ?? [];
    if (details.isNotEmpty) {
      details
        ..removeAt(0) // Remove header.
        ..removeLast(); // Remove summary.
    }

    return details
        .map((record) => PaymentRecord(
              date: DateFormat('d-M-y').parse(record.children.first.text),
              item: record.children[1].text,
              amount: double.parse(record.children[2].text.replaceAll(',', '')),
              paid: double.tryParse(record.children[3].text
                      .replaceAll(RegExp(r'[(),]'), '')) ??
                  0,
            ))
        .toList();
  }
}

class PaymentRecord {
  final DateTime date;
  final String item;
  final double amount;
  final double paid;

  PaymentRecord({
    required this.date,
    required this.item,
    required this.amount,
    required this.paid,
  });
}
