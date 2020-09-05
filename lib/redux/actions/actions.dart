import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/main_page.dart';
import 'package:xmux/modules/emgs/emgs.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';
import 'package:xmux/modules/rpc/clients/aaos.pb.dart';
import 'package:xmux/modules/rpc/clients/google/protobuf/empty.pb.dart';
import 'package:xmux/modules/rpc/clients/user.pb.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart' as v2;
import 'package:xmux/redux/state/state.dart';

part 'moodle_api_actions.dart';
part 'xmux_api_actions.dart';
part 'xmux_rpc_actions.dart';

/// General action for the whole app.
abstract class MainAppAction {
  /// Flag for state saving. (Default `true`)
  /// If false, app state will not be save when dispatch this action.
  final needSave = true;

  /// Flag for sync state saving. (Default `false`)
  /// If true, app state will be saved sync when dispatch this action.
  /// This flag only available when `needSave` is true.
  final sync = false;

  toString() => "MainAppAction: ${this.runtimeType}";
}

abstract class ApiCallAction extends MainAppAction {
  /// A [Future] of API request process.
  /// It is [null] by default and will be assign by [apiRequestMiddleware].
  Future<Null> future;

  /// Parameters for API request.
  final Map<String, String> params;

  /// Called when [Exception] is caught.
  final void Function(Exception) onError;

  ApiCallAction({this.params, this.onError});

  /// Make the action callable.
  /// Should be implemented by different API requests.
  Future<Null> call(Store<MainAppState> store);
}

// ****** General Actions ******

/// Init the whole state by using the state stored before.
class InitAction extends MainAppAction {
  final Map<String, dynamic> initMap;

  InitAction(this.initMap);

  @override
  final needSave = false;
}

/// Store uid and password after login.
class LoginAction extends MainAppAction {
  final String campusId, password;

  LoginAction(this.campusId, this.password);

  @override
  final sync = true;
}

/// Logout and restore the whole state to default.
class LogoutAction extends MainAppAction {
  @override
  final sync = true;
}

// ****** UI Actions ******

abstract class UIActions extends MainAppAction {
  @override
  final needSave = false;
}

/// Open the drawer in [MainPage].
class OpenDrawerAction extends UIActions {
  final bool drawerIsOpen;

  OpenDrawerAction(this.drawerIsOpen);
}

class ShowPerformanceOverlayAction extends UIActions {
  final bool showPerformanceOverlay;

  ShowPerformanceOverlayAction(this.showPerformanceOverlay);
}

class ShowSemanticsDebuggerAction extends UIActions {
  final bool showSemanticsDebugger;

  ShowSemanticsDebuggerAction(this.showSemanticsDebugger);
}

// ****** Setting Actions ******

class ThemeModeAction extends MainAppAction {
  final ThemeMode themeMode;

  ThemeModeAction(this.themeMode);
}

/// Enable gaussian blur background for dialogs.
class EnableBlurAction extends MainAppAction {
  final bool enableBlur;

  EnableBlurAction(this.enableBlur);
}

/// Enable functions under development.
class EnableFunctionsUnderDevAction extends MainAppAction {
  final bool enableFunctionsUnderDev;

  EnableFunctionsUnderDevAction(this.enableFunctionsUnderDev);
}

class UpdateEPaymentPasswordAction extends MainAppAction {
  final String ePaymentPassword;

  UpdateEPaymentPasswordAction(this.ePaymentPassword);
}

class UpdateNewsAction extends MainAppAction {
  final List news;

  UpdateNewsAction(this.news);

  final needSave = false;
}

class UpdateEmgsApplicationResultAction extends MainAppAction {
  final EmgsApplicationResult result;

  UpdateEmgsApplicationResultAction(this.result);
}
