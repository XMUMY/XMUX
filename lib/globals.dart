import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:package_info/package_info.dart';
import 'package:redux/redux.dart';
import 'package:xmux/config.dart';
import 'package:xmux/modules/backend_handler/backend_handler.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';
import 'package:xmux/redux/middleware.dart';
import 'package:xmux/redux/reducers/main_reducer.dart';
import 'package:xmux/redux/state.dart';

/// Backend handler instance.
final backend = BackendHandler(BackendApiConfig.addresses);

/// Error widgets instance.
final errorWidgets = ErrorWidgets();

/// Firebase messaging instance.
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

/// Firebase user instance.
///
/// Default is null. Will be assigned by FirebaseUser when logged in.
FirebaseUser firebaseUser;

/// Package information from platform.
///
/// Default is null. Will be assigned during init.
PackageInfo packageInfo;

/// Main store for redux.
final Store<MainAppState> mainAppStore = Store<MainAppState>(mainAppReducer,
    initialState: MainAppState(), middleware: [saveMiddleware]);
