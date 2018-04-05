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

class OpenDrawerAction extends MainAppAction {
  get needSave => false;
  final bool drawerIsOpen;

  OpenDrawerAction(this.drawerIsOpen);
}

class UpdateEPaymentPasswordAction extends MainAppAction {
  String ePaymentPassword;

  UpdateEPaymentPasswordAction(this.ePaymentPassword);
}

class UpdateACAction extends MainAppAction {
  Map<String, dynamic> acInitMap;
  List assignments;

  UpdateACAction({this.acInitMap, this.assignments});
}
