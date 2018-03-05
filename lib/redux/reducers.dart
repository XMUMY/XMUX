import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

MainAppState mainAppReducer(MainAppState oldState, action) {
  if (action is openDrawerAction)
    return oldState.copyWith(drawerIsOpen: action.drawerStatus);
  else
    return oldState;
}
