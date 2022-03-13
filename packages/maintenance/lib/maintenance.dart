import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';

import 'model.dart';

part 'cookie_manager.dart';

const _maintenanceUrl = 'https://app.xmu.edu.my/Maintenance';

// A spider for AskA Maintenance.
class Maintenance {
  final _dio = Dio(BaseOptions(baseUrl: _maintenanceUrl))
    ..interceptors.add(_CookieManager(CookieJar()));

  final String _uid, _password;

  /// Future for login procedure.
  Future<void>? _loginFuture;

  Maintenance(this._uid, this._password);

  /// Ensure login successfully.
  Future<void> ensureSignedIn() async {
    _loginFuture ??= login();
    await _loginFuture;
  }

  /// Login with given credential.
  Future<void> login() async {
    try {
      final loginPage = await _dio.get('/Account/Login');
      final token = parse(loginPage.data)
          .querySelector('[name="__RequestVerificationToken"]')
          ?.attributes['value'];

      await _dio.post(
        '/Account/Login',
        data: {
          '__RequestVerificationToken': token,
          'CampusID': _uid,
          'Password': _password
        },
        options: Options(
          contentType: 'application/x-www-form-urlencoded',
          followRedirects: true,
        ),
      );
    } on DioError catch (e) {
      final resp = e.response;
      if (resp == null || resp.statusCode != 302) rethrow;
      if (resp.statusCode == 302) return;
    }
  }

  /// Get FAQs in given page.
  static Future<List<FaqEntry>> getFaq({int page = 1}) async {
    final faqPageResp = await Dio().get('$_maintenanceUrl/?p=$page');

    final faqPage = parse(faqPageResp.data)
            .querySelector('.table')
            ?.querySelectorAll('td') ??
        [];

    final questionList = <FaqEntry>[];
    for (var i = 0; i < faqPage.length; i += 2) {
      questionList.add(FaqEntry(
        id: int.parse(
          faqPage[i].nodes[0].text!.replaceAll(RegExp(r'^\s+|\s+$|\n|\.'), ''),
        ),
        date: DateFormat('yyyy-MM-dd').parse(
          faqPage[i].nodes[2].text!.replaceAll(RegExp(r'^\s+|\s+$|\n'), ''),
        ),
        title:
            faqPage[i].nodes[1].text!.replaceAll(RegExp(r'^\s+|\s+$|\n'), ''),
        answer: faqPage[i + 1]
            .children[0]
            .children
            .map((e) => e.text)
            .join('\n')
            .replaceAll(RegExp(r'^\s+|\s+$'), ''),
      ));
    }

    return questionList;
  }

  /// Get my requests.
  Future<List<MyRequest>> get myRequests async {
    await ensureSignedIn();
    final myRequestPageResp = await _dio.get('/Reader/Ask');

    final myRequestPage = parse(myRequestPageResp.data)
            .querySelector('.table')
            ?.querySelectorAll('td') ??
        [];

    final myRequests = <MyRequest>[];
    for (var i = 0; i < myRequestPage.length; i += 2) {
      final id = myRequestPage[i]
          .nodes
          .first
          .text!
          .replaceAll(RegExp(r'^\s+|\s+$|\n|\.'), '');

      final titles = myRequestPage[i]
          .nodes[1]
          .text!
          .replaceAll(RegExp(r'^\s+|\s+$|\n'), '')
          .split(' - ');

      final date = myRequestPage[i]
          .nodes
          .last
          .text!
          .replaceAll(RegExp(r'^\s+|\s+$|\n'), '');

      final answer = myRequestPage[i + 1]
          .children
          .map((e) => e.text)
          .join('\n')
          .replaceAll(RegExp(r'^\s+|\s+$'), '');

      myRequests.add(MyRequest(
        id: id,
        date: DateFormat('yyyy/MM/dd HH:mm:ss').parse(date),
        title: titles[2],
        category: titles[1],
        usage: titles[0],
        answer: answer,
      ));
    }

    return myRequests;
  }

  /// Get my form.
  Future<RequestForm> get form async {
    await ensureSignedIn();
    final askPageResp = await _dio.get('/Reader/Ask/Create');
    final askPage = parse(askPageResp.data);
    final selections = ['#RoomUsage', '#Category', '#Block', '#Wing']
        .map((d) => askPage
            .querySelector(d)!
            .querySelectorAll('option')
            .map((e) => e.text)
            .toList()
          ..removeAt(0))
        .toList();

    return RequestForm(
      usages: selections[0],
      categories: selections[1],
      blocks: selections[2],
      wings: selections[3],
      gender: askPage.querySelector('#Gender')!.attributes['value']!,
      name: askPage.querySelector('#Name')!.attributes['value']!,
      email: askPage.querySelector('#Email')!.attributes['value']!,
      token: askPage
          .querySelector('[name="__RequestVerificationToken"]')!
          .attributes['value']!,
      phoneNumber: askPage.querySelector('#Telephone')?.attributes['value'],
    );
  }

  /// Submit form.
  Future<void> submitForm(RequestForm form) async {
    await ensureSignedIn();

    final file = form.file;
    final formData = FormData.fromMap({
      'agree': 'true',
      '__RequestVerificationToken': form.token,
      'Gender': form.gender,
      'CampusID': _uid,
      'Name': form.name,
      'Email': form.email,
      'RoomUsage': form.usage,
      'Category': form.category,
      'Block': form.block,
      'Wing': form.wing,
      'RoomNo': form.room,
      'Description': form.description,
      'Telephone': form.phoneNumber,
      'RecurringProblem': form.recurringProblem ? 'yes' : 'no',
      if (file != null)
        'FileName': await MultipartFile.fromFile(
          file.path,
          filename: 'pic.jpg',
          contentType: MediaType.parse('image/jpeg'),
        )
    });

    await _dio.post(
      '/Reader/Ask/Create',
      data: formData,
      options: Options(validateStatus: (s) => s == 302),
    );
  }
}
