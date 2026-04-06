import 'package:flutter/foundation.dart';

const isWeb = kIsWeb;
const isNative = !kIsWeb;

final isAndroid = defaultTargetPlatform == TargetPlatform.android;
final isIOS = defaultTargetPlatform == TargetPlatform.iOS;
final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
final isWindows = defaultTargetPlatform == TargetPlatform.windows;
final isLinux = defaultTargetPlatform == TargetPlatform.linux;

final isMobile = isAndroid || isIOS;
final isDesktop = isMacOS || isWindows || isLinux;

final isAndroidApp = isNative && isAndroid;
final isIOSApp = isNative && isIOS;
final isMacOSApp = isNative && isMacOS;
final isWindowsApp = isNative && isWindows;
final isLinuxApp = isNative && isLinux;

final isMobileApp = isAndroidApp || isIOSApp;
final isDesktopApp = isMacOSApp || isWindowsApp || isLinuxApp;
