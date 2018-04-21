import 'package:redux/redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

final Reducer<PersonalInfoState> personalInfoReducers = combineReducers([
  new TypedReducer<PersonalInfoState, LoginAction>(_loginReducer),
]);

PersonalInfoState _loginReducer(PersonalInfoState state, LoginAction action) =>
    state.copyWith(
        uid: action.uid,
        password: action.password,
        moodleKey: action.moodleKey);
