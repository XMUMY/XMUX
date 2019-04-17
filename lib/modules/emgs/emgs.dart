import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

export 'model.dart';

/// Parse nationality to country code.
/// Return `null` if unsupported.
String getCountryCode(String nationality) {
  switch (nationality) {
    case 'Chinese':
      return 'CN';
    default:
      return null;
  }
}

/// Get application status from website.
Future<EmgsApplicationResult> getApplicationStatus(
    String id, String nationality) async {
  // Get form key & cookie.
  var formPage = await Dio()
      .get('https://educationmalaysia.gov.my/emgs/application/searchForm/');
  var formKey = parse(formPage.data)
      .getElementById('search-form-validate')
      .children[0]
      .attributes['value'];

  List<String> cookies;
  formPage.headers.forEach((s, l) => (s == 'set-cookie')
      ? cookies = l.map((s) => s.split(';')[0]).toList()
      : null);

  // Query for application result.
  var res = await http.post(
      'https://educationmalaysia.gov.my/emgs/application/searchPost/',
      headers: {
        'Cookie': '${cookies[0]}; ${cookies[1]}'
      },
      body: {
        'form_key': formKey,
        'travel_doc_no': id,
        'nationality': nationality,
        'agreement': '1'
      });

  if (res.statusCode != 200) throw Exception('EMGS: Fetch ERROR');
  var document = parse(res.body);

  // Get status table.
  var statusList = document
      .getElementsByClassName('application-summary')[0]
      .children
      .map((c) => c.text.replaceAll('\n', ''))
      .toList();
  var status = Map<String, dynamic>.fromIterable(statusList,
      key: (s) => s.split(':')[0].replaceAll(' ', ''),
      value: (s) => s.split(':')[1].replaceAll(RegExp(r'^\s+|\s+$'), ''));

  // Get percentage.
  var percentage = RegExp('isShowStaticInfoText: "[0-9]{1,3}%"')
      .firstMatch(res.body)
      .group(0)
      .split('"')[1]
      .replaceAll('%', '');

  // Get history.
  var history = document
      .querySelector('#form-table tbody')
      .children
      .map((l) => {
            'date': l.children[0].text.replaceAll(RegExp(r'^\s+|\s+$|\n'), ''),
            'status':
                l.children[1].text.replaceAll(RegExp(r'^\s+|\s+$|\n'), ''),
            'remark':
                l.children[2].text.replaceAll(RegExp(r'^\s+|\s+$|\n'), ''),
          })
      .toList();

  status.addAll({'percentage': double.parse(percentage), 'history': history});

  return EmgsApplicationResult.fromJson(status);
}