import 'package:flutter_test/flutter_test.dart';
import 'package:xmux/translations/en_US.dart';
import 'package:xmux/translations/zh_CN.dart';

void main() {
  test('Test for quantities of translations for each language.', () {
    expect(en_US.keys.length == zh_CN.keys.length, true,
        reason: 'The zh_CN has ${zh_CN.keys.length} keys, '
            'but en_US has ${en_US.keys.length} keys.');

    expect(en_US_login.keys.length == zh_CN_login.keys.length, true,
        reason: 'The zh_CN_login has ${zh_CN_login.keys.length} keys, '
            'but en_US_login has ${en_US_login.keys.length} keys.');
  });
}
