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
  InitAction.fromLogin(
      String id, String password, Map<String, dynamic> loginMap)
      : this.initMap = {
          "personalInfoState": {
            "uid": id,
            "password": password,
          },
          "settingState": {"ePaymentPassword": null},
          "acState": {
            "status": "success",
            "timestamp": new DateTime.now().microsecondsSinceEpoch,
            "data": {
              "timetable": loginMap["timetable"],
              "exams": loginMap["exam"],
              "examResult": {},
              "assignments":loginMap["assignments"],
            },
          },
        };
}

class UpdateSettingAction extends MainAppAction {
  get name => super.name + "UpdateSetting";
}
