import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

MainAppState mainAppReducer(MainAppState oldState, dynamic action) {
  switch (action.name) {
    case "MainAppAction:OpenDrawer":
      return oldState.copyWith(
          drawerIsOpen: (action as OpenDrawerAction).drawerStatus);
    case "MainAppAction:Init":
      return new MainAppState.fromJson((action as InitAction).initMap);
    default:
      return oldState;
  }
}
