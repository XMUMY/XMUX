import 'package:flutter/widgets.dart';
import 'package:xmux/mainapp/main_page.dart';
import 'package:xmux/modules/api/models/v3_bridge.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/emgs/emgs.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart' as v2;

part 'xmux_api_actions.dart';

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

/// Open the drawer in [MainPage].
class OpenDrawerAction extends MainAppAction {
  final bool drawerIsOpen;

  OpenDrawerAction(this.drawerIsOpen);

  @override
  final needSave = false;
}

class ToggleDarkModeAction extends MainAppAction {
  @override
  final needSave = false;
}

// ****** Setting Actions ******

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
