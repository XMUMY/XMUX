abstract class MainAppAction {
  get needSave => true;
  get sync => false;
  toString() => "MainAppAction";
}

class InitAction extends MainAppAction {
  get needSave => false;
  final Map<String, dynamic> initMap;

  InitAction(this.initMap);
}

class LoginAction extends MainAppAction {
  get sync => true;
  final String uid, password, moodleKey;

  LoginAction(this.uid, this.password, this.moodleKey);
}

class LogoutAction extends MainAppAction {
  get sync => true;
}

class OpenDrawerAction extends MainAppAction {
  get needSave => false;
  final bool drawerIsOpen;

  OpenDrawerAction(this.drawerIsOpen);
}

class UpdateEPaymentPasswordAction extends MainAppAction {
  final String ePaymentPassword;

  UpdateEPaymentPasswordAction(this.ePaymentPassword);
}

class UpdateACAction extends MainAppAction {
  final Map<String, dynamic> acMap;
  UpdateACAction(this.acMap);
}

class UpdateAssignmentsAction extends MainAppAction {
  final List assignments;

  UpdateAssignmentsAction(this.assignments);
}
