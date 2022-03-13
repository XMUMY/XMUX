import 'dart:io';

import 'package:flutter/foundation.dart';

const isWeb = kIsWeb;
const isVM = !kIsWeb;

final isAndroid = isVM && Platform.isAndroid;
final isIOS = isVM && Platform.isIOS;
final isMobile = isVM && (isAndroid || isIOS);

final isMacOS = isVM && Platform.isMacOS;
final isWindows = isVM && Platform.isWindows;
final isLinux = isVM && Platform.isLinux;
final isDesktop = isVM && (isMacOS || isWindows || isLinux);
