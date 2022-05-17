import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:taskflow/taskflow.dart';

import '../global.dart';

class Gravatar extends StatelessWidget {
  static const _defaultPath = '/avatar/?d=mp';
  static const cdns = [
    'https://s.gravatar.com',
    'https://cn.gravatar.com',
    'https://cravatar.cn',
    'https://gravatar.loli.net',
  ];

  static var cdn = cdns.first;
  static var defaultAvatar = cdns.first + _defaultPath;

  /// Task to trigger CDN test.
  static final cdnTestTask = Task((ctx) async {
    _testCdn();
  });

  /// Select fastest CDN address.
  static Future<void> _testCdn() async {
    cdn = await Future.any(
      cdns.map((cdn) async {
        await get(Uri.parse('$cdn/avatar/'));
        return cdn;
      }),
    );
    defaultAvatar = cdn + _defaultPath;
    log.d('Gravatar CDN: $cdn');
  }

  /// Convert avatar url to use CDN.
  static String _toCdn(String url) {
    final uri = Uri.parse(url);
    if (uri.host.endsWith('.gravatar.com')) {
      return '$cdn${uri.path}?d=mp';
    }
    return url;
  }

  final String url;
  final double? radius;
  final String? fallbackName;

  const Gravatar({
    Key? key,
    this.url = '',
    this.radius,
    this.fallbackName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fallbackName = this.fallbackName;
    final u = url.isNotEmpty ? _toCdn(url) : defaultAvatar;

    var fallbackChar = '';
    if (fallbackName != null && fallbackName.isNotEmpty) {
      fallbackName.substring(0, 1);
    }

    return CircleAvatar(
      radius: radius,
      foregroundImage: ExtendedNetworkImageProvider(u, cache: true),
      child: fallbackChar.isEmpty ? null : Text(fallbackChar),
    );
  }
}
