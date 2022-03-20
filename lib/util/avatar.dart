import 'package:extended_image/extended_image.dart';
import 'package:taskflow/taskflow.dart';

import '../global.dart';

class Gravatar {
  static const cdnAddresses = [
    'https://s.gravatar.com',
    'https://cravatar.cn',
    'https://dn-qiniu-avatar.qbox.me',
    'https://gravatar.loli.net',
  ];

  static var cdnAddress = cdnAddresses.first;

  static final cdnTestTask = Task((ctx) async {
    cdnTest(); // Trigger CDN test.
  });

  /// Select fastest CDN address.
  static Future<void> cdnTest() async {
    cdnAddress = await Future.any(
      cdnAddresses.map((cdn) async {
        await get(Uri.parse('$cdn/avatar/'));
        return cdn;
      }),
    );
    log.d('Gravatar CDN: $cdnAddress');
  }

  /// Convert avatar url to use CDN.
  static String _toCdn(String url) {
    final uri = Uri.parse(url);
    if (uri.host.endsWith('gravatar.com')) {
      return cdnAddress + uri.path;
    }
    return url;
  }
}

extension GravatarCdn on String {
  /// Convert avatar url to use CDN.
  String get toGravatarCdn => Gravatar._toCdn(this);
}
