import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:html/parser.dart';

import 'models.dart';

export 'models.dart';

const _loginUrl =
    'https://www.barracudacampus.com/stud/index.php/student/login';
const _paymentUrl =
    'https://www.barracudacampus.com/stud/index.php/student/payment';

class _EPaymentCookieManager extends CookieManager {
  _EPaymentCookieManager(CookieJar cookieJar) : super(cookieJar);

  @override
  Future onRequest(RequestOptions options) async {
    var cookies = cookieJar.loadForRequest(options.uri)
      ..removeWhere((cookie) => cookie.expires != null
          ? cookie.expires.isBefore(DateTime.now())
          : false)
      ..add(Cookie('collegecode', 'xmu'));
    var cookie = CookieManager.getCookies(cookies);
    if (cookie.isNotEmpty) options.headers[HttpHeaders.cookieHeader] = cookie;
  }
}

/// A spider for Barracuda Campus e-payment system.
class EPaymentApi {
  final Dio _dio = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/x-www-form-urlencoded',
  ))
    ..interceptors.add(_EPaymentCookieManager(CookieJar()));

  /// Login credential.
  String _username, _password;

  /// Store login credential.
  void withCredential(String username, String password) {
    _username = username;
    _password = password;
  }

  /// Login with username and password.
  Future<void> login() async {
    try {
      await _dio.post(
        _loginUrl,
        data: {
          'matrixno': Uri.encodeComponent(_username),
          'pass': Uri.encodeComponent(_password),
          'campus': 'xmu',
          'submit': 'Login',
        },
      );
    } on DioError catch (e) {
      if (e.response?.statusCode != 302) rethrow;
      var location = e.response.headers['Location'];
      if (location?.first?.contains('/student/login') ?? false) {
        throw 'Login Failed';
      }
      return;
    }
  }

  Future<List<PaymentRecord>> get payment async {
    var resp = await _dio.post(_paymentUrl);

    var doc = parse(resp.data);
    if (doc.querySelector('title').text == 'Term of Services')
      throw 'TOS Error';

    var list = doc.querySelector('table.list');
    var details = list.querySelectorAll('tr')
      ..removeAt(0) // Remove header.
      ..removeLast(); // Remove summary.

    var records = <PaymentRecord>[];
    for (var record in details)
      records.add(PaymentRecord(
        date: DateFormat('d-M-y').parse(record.children.first.text),
        item: record.children[1].text,
        amount: double.parse(record.children[2].text.replaceAll(',', '')),
        paid: double.tryParse(
                record.children[3].text.replaceAll(RegExp(r'[(),]'), '')) ??
            0,
      ));
    return records;
  }
}
