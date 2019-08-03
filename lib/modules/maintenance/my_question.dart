import 'dart:core';
import 'dart:io';

import 'cookie_manager.dart';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';

class Question {
  String id;
  String time;
  String title;
  String answer;
  String roomUsage;
  String category;

  @override
  String toString() {
    return '''ID: ${this.id}
      Time: ${this.time}
      Title: ${this.title}
      Room Usage: ${this.roomUsage}
      Category: ${this.category}
      Answer: ${this.answer}
      ''';
  }
}

class Form {
  Form();
  Form.fromList(List<List<String>> data)
      : roomUsage = data[0],
        category = data[1],
        recurringProblem = data[2],
        blockID = data[3],
        wingID = data[4];

  List<String> roomUsage;
  List<String> category;
  List<String> recurringProblem;
  List<String> blockID;
  List<String> wingID;
  String croomUsage;
  String ccategory;
  bool isrecurringProblem;
  String cblockID;
  String cwingID;
  String roomNo;
  String description;
  String phoneNo;
  @override
  String toString() {
    return '''roomUsage: ${this.roomUsage}
      category: ${this.category}
      recurringProblem: ${this.recurringProblem}
      blockID: ${this.blockID}
      wingID: ${this.wingID}
      ''';
  }
}

class Maintenance {
  final String _campusID;
  final String _passwd;
  String _name;
  String _email;
  String _formToken;
  String _gender;
  Dio _dioClient;
  bool _isLoggedin = false;

  Maintenance(this._campusID, this._passwd);

  Future<List<Question>> getMyQuestion() async {
    try {
      if (!_isLoggedin) {
        await login();
      }
      var myQPage =
          await _dioClient.get('https://app.xmu.edu.my/Maintenance/Reader/Ask');
      if (myQPage.data is DioError) {
        throw myQPage.data;
      }
      return _parseMyQuestion(myQPage);
    } catch (e) {
      rethrow;
    }
  }

  Future<Form> getForm() async {
    if (!_isLoggedin) {
      await login();
    }
    var askPage =
        await _dioClient.get('https://app.xmu.edu.my/Maintenance/Reader/Ask/Create');
    if (askPage.data is DioError) {
      throw askPage.data;
    }
    var page = parse(askPage.data);
    var data = [
      '#RoomUsage',
      '#Category',
      '#RecurringProblem',
      '#Block',
      '#Wing'
    ]
        .map((d) => page
            .querySelector(d)
            .querySelectorAll('option')
            .map((e) => e.text)
            .toList())
        .toList();

    data.forEach((list) => list.removeAt(0));
    var form = Form.fromList(data);
    form.isrecurringProblem = false;
    this._gender = page.querySelector('[name="Gender"]').attributes['value'];
    this._formToken = page
        .querySelector('[name="__RequestVerificationToken"]')
        .attributes['value'];
    this._name = page.querySelector('[name="Name"]').attributes['value'];
    this._email = page.querySelector('[name="Email"]').attributes['value'];
    return form;
  }

  Future<void> login() async {
    _dioClient = Dio();
    _dioClient.interceptors.add(NBCookieManager(CookieJar()));
    try {
      var loginPage =
          await _dioClient.get('https://app.xmu.edu.my/Maintenance/Account/Login');
      if (loginPage.data is DioError) {
        throw loginPage.data;
      }

      var loginData = parse(loginPage.data);
      var token = loginData
          .querySelector('[name="__RequestVerificationToken"]')
          .attributes['value'];
      await _dioClient.post('https://app.xmu.edu.my/Maintenance/Account/Login',
          data: {
            "__RequestVerificationToken": token,
            "CampusID": this._campusID,
            "Password": this._passwd
          },
          options: Options(
              contentType:
                  ContentType.parse("application/x-www-form-urlencoded"),
              followRedirects: true));
      _isLoggedin = true;
    } on DioError catch (e) {
      if (e.response == null || e.response.statusCode != 302) {
        rethrow;
      }
    }
  }

  Future<void> formSender(Form formData) async {
    if (!_isLoggedin) {
      await login();
    }
    try {
      var data = {
            '__RequestVerificationToken': this._formToken,
            'Gender': this._gender,
            'RoomUsage': formData.croomUsage,
            'Category': formData.ccategory,
            'Block': formData.cblockID,
            'Wing': formData.cwingID,
            'RoomNo': formData.roomNo,
            'RecurringProblem': formData.isrecurringProblem
                ? formData.recurringProblem[0]
                : formData.recurringProblem[1],
            'Description': formData.description,
            'CampusID': this._campusID,
            'Name': this._name,
            'Email': this._email,
            'Telephone': formData.phoneNo,
            'Agree': 'true'
          };
      await _dioClient.post('https://app.xmu.edu.my/Maintenance/Reader/Ask/Create',
          data: data,
          options: Options(
              contentType:
                  ContentType.parse("application/x-www-form-urlencoded"),
              followRedirects: true));
    } on DioError catch (e) {
      if (e.response == null || e.response.statusCode != 302) {
        rethrow;
      }
    }
  }

  Future<List<Question>> getFaq({int pageNum = 1}) async {
    if (!_isLoggedin) {
      login();
    }
    var faqPage = await _dioClient.get('https://app.xmu.edu.my/Maintenance/?p=$pageNum');
    if (faqPage.data is DioError) {
        throw faqPage.data;
    }
    return _parseFaqQuestion(faqPage);
  }

  _removeSpace(String str) {
    int start, end;
    for (int i = 0; i < str.length; ++i) {
      if (str.codeUnitAt(i) != 10 && str.codeUnitAt(i) != 32) {
        start = i;
        break;
      }
    }
    for (int i = str.length - 1; i >= 0; --i) {
      if (str.codeUnitAt(i) != 10 && str.codeUnitAt(i) != 32) {
        end = i + 1;
        break;
      }
    }
    if (start == null || end == null) {
      return '';
    }
    return str.substring(start, end);
  }

  List<Question> _parseMyQuestion(Response<dynamic> qPage) {
    var myQData =
        parse(qPage.data).querySelector('.table').querySelectorAll('td');
    var qList = List<Question>(myQData.length ~/ 2);
    int index;
    List<String> title;
    for (int i = 0; i < myQData.length; ++i) {
      if (i % 2 == 0) {
        index = i ~/ 2;
        qList[index] = new Question();
        qList[index].id = _removeSpace(myQData[i].nodes[0].text);
        title = _removeSpace(myQData[i].nodes[1].text).split(' - ');
        qList[index].roomUsage = title[0];
        qList[index].category = title[1];
        qList[index].title = title[2];
        qList[index].time = _removeSpace(myQData[i].nodes[2].text);
      } else {
        index = (i - 1) ~/ 2;
        var ans = List();
        myQData[i].children.forEach((e) {
          ans.add(e.text);
        });
        qList[index].answer = ans.join('\n');
      }
    }
    return qList;
  }

  List<Question> _parseFaqQuestion(Response<dynamic> qPage) {
    var myQData =
        parse(qPage.data).querySelector('.table').querySelectorAll('td');
    var qList = List<Question>(myQData.length ~/ 2);
    int index;
    for (int i = 0; i < myQData.length; ++i) {
      if (i % 2 == 0) {
        index = i ~/ 2;
        qList[index] = new Question();
        qList[index].id = _removeSpace(myQData[i].nodes[0].text);
        qList[index].title = _removeSpace(myQData[i].nodes[1].text);
        qList[index].time = _removeSpace(myQData[i].nodes[2].text);
      } else {
        index = (i - 1) ~/ 2;
        var ans = List();
        myQData[i].children[0].children.forEach((e) {
          ans.add(e.text);
        });
        qList[index].answer = ans.join('\n');
      }
    }
    return qList;
  }
}