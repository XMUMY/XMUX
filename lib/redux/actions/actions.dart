import 'package:connectivity/connectivity.dart';
import 'package:flutter/widgets.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

part 'xmux_api_actions.dart';

/// General action for the whole app.
abstract class MainAppAction {
  /// Flag for state saving. (Default true)
  /// If false, app state will not be save when dispatch this action.
  final needSave = true;

  /// Flag for sync state saving. (Default false)
  /// If true, app state will be save sync when dispatch this action.
  /// This flag only available when *needSave* is true.
  final sync = false;

  toString() => "MainAppAction: ${this.runtimeType}";
}

class ChangeConnectivityAction extends MainAppAction {
  final ConnectivityResult connectivityResult;
  ChangeConnectivityAction(this.connectivityResult);

  final needSave = false;
}

class EnableFunctionsUnderDevAction extends MainAppAction {
  final bool enableFunctionsUnderDev;

  EnableFunctionsUnderDevAction(this.enableFunctionsUnderDev);
}

class InitAction extends MainAppAction {
  final Map<String, dynamic> initMap;
  InitAction(this.initMap);

  final needSave = false;
}

class LoginAction extends MainAppAction {
  final XMUXApiAuth auth;

  final String moodleKey;
  LoginAction(this.auth, this.moodleKey);

  final sync = true;
}

class LogoutAction extends MainAppAction {
  final sync = true;
}

class OpenDrawerAction extends MainAppAction {
  final bool drawerIsOpen;
  OpenDrawerAction(this.drawerIsOpen);

  final needSave = false;
}

class UpdateAnnouncementAction extends MainAppAction {
  final List announcements;
  UpdateAnnouncementAction(this.announcements);

  final needSave = false;
}

class UpdateAssignmentsAction extends MainAppAction {
  final List assignments;

  UpdateAssignmentsAction(this.assignments);
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
