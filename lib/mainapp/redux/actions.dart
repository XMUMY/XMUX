abstract class MainAppAction {
  String toString() => "";
}

class openDrawerAction extends MainAppAction {
  final bool drawerStatus;
  openDrawerAction(this.drawerStatus);
}
