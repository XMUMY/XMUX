abstract class MainAppAction {
  get name => "MainAppAction:";
}

class OpenDrawerAction extends MainAppAction {
  get name => super.name + "OpenDrawer";
  final bool drawerStatus;
  OpenDrawerAction(this.drawerStatus);
}

class InitAction extends MainAppAction {
  get name => super.name + "Init";
  String id, password;
  final Map<String, dynamic> initMap;
  InitAction(this.initMap, {this.id, this.password});
}

class UpdateSettingAction extends MainAppAction {
  get name => super.name + "UpdateSetting";
}
