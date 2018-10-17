import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:package_info/package_info.dart';
import 'package:redux/redux.dart';
import 'package:xmux/modules/backend_handler/backend_handler.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

/// Backend handler instance.
///
/// Default is null. Will be selected during init.
@deprecated
BackendHandler backend;

/// Firebase user instance.
///
/// Default is null. Will be assigned by FirebaseUser when logged in.
FirebaseUser firebaseUser;

/// Package information from platform.
///
/// Default is null. Will be assigned during init.
PackageInfo packageInfo;

/// XMUX API instance.
///
/// Default is null. Will be selected during init.
XMUXApi xmuxApi;

/// Firebase messaging instance.
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

/// Main store for redux.
final Store<MainAppState> mainAppStore = Store<MainAppState>(appReducer,
    initialState: MainAppState.def(),
    middleware: [apiRequestMiddleware, saveMiddleware]);
