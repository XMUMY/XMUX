import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

MainAppState mainAppReducer(MainAppState oldState, action) {
  if (action is openDrawerAction)
    return new MainAppState(!oldState.drawerIsOpen);
  else
    return oldState;
}
