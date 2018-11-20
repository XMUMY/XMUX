part of 'reducer.dart';

final Reducer<UIState> uiReducers = combineReducers([
  TypedReducer<UIState, OpenDrawerAction>(_openDrawerReducer),
  TypedReducer<UIState, UpdateHomepageNewsAction>(_updateHomepageNewsReducer),
  new TypedReducer<UIState, UpdateAnnouncementAction>(
      _updateAnnouncementsReducer),
]);

UIState _openDrawerReducer(UIState state, OpenDrawerAction action) =>
    state.copyWith(drawerIsOpen: action.drawerIsOpen);

UIState _updateHomepageNewsReducer(
        UIState state, UpdateHomepageNewsAction action) =>
    state.copyWith(homepageNews: action.news);

UIState _updateAnnouncementsReducer(
        UIState state, UpdateAnnouncementAction action) =>
    state.copyWith(announcements: action.announcements);
