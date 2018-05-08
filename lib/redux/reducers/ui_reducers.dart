import 'package:redux/redux.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';

final Reducer<UIState> uiReducers = combineReducers([
  new TypedReducer<UIState, OpenDrawerAction>(_openDrawerReducer),
  new TypedReducer<UIState, UpdateNewsAction>(_updateNewsReducer),
]);

UIState _openDrawerReducer(UIState state, OpenDrawerAction action) =>
    state.copyWith(drawerIsOpen: action.drawerIsOpen);

UIState _updateNewsReducer(UIState state, UpdateNewsAction action) =>
    state.copyWith(news: action.news);
