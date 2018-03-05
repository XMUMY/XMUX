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
  final Map<String, dynamic> initMap;
  InitAction(this.initMap);
}

class UpdateSettingAction extends MainAppAction {
  get name => super.name + "UpdateSetting";
}
