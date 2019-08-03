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

  test('Test for keys of translations for each language.', () {
    for (var key in en_US.keys)
      expect(zh_CN.containsKey(key), true,
          reason: 'The en_US has key $key, but zh_CN does not have.');

    for (var key in zh_CN.keys)
      expect(en_US.containsKey(key), true,
          reason: 'The zh_CN has key $key, but en_US does not have.');
  });
}
