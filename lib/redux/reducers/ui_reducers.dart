part of 'reducer.dart';

final uiReducers = combineReducers<UIState>([
  TypedReducer(_openDrawerReducer),
  TypedReducer(_updateHomepageNewsReducer),
  TypedReducer(_updateAnnouncementsReducer),
]);

UIState _openDrawerReducer(UIState state, OpenDrawerAction action) =>
    state.copyWith(drawerIsOpen: action.drawerIsOpen);

UIState _updateHomepageNewsReducer(
        UIState state, UpdateHomepageNewsAction action) =>
    state.copyWith(homepageNews: action.news);

UIState _updateAnnouncementsReducer(
        UIState state, UpdateHomepageAnnouncementsAction action) =>
    state.copyWith(announcements: action.announcements);
