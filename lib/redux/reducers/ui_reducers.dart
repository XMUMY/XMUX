part of 'reducer.dart';

final uiReducers = combineReducers<UIState>([
  TypedReducer(_openDrawerReducer),
  TypedReducer(_showPerformanceOverlayReducer),
  TypedReducer(_showSemanticsDebuggerReducer),
  TypedReducer(_updateHomepageNewsReducer),
  TypedReducer(_updateAnnouncementsReducer),
]);

UIState _openDrawerReducer(UIState state, OpenDrawerAction action) =>
    state.copyWith(drawerIsOpen: action.drawerIsOpen);

UIState _showPerformanceOverlayReducer(
        UIState state, ShowPerformanceOverlayAction action) =>
    state.copyWith(showPerformanceOverlay: action.showPerformanceOverlay);

UIState _showSemanticsDebuggerReducer(
        UIState state, ShowSemanticsDebuggerAction action) =>
    state.copyWith(showSemanticsDebugger: action.showSemanticsDebugger);

UIState _updateHomepageNewsReducer(
        UIState state, UpdateHomepageNewsAction action) =>
    state.copyWith(homepageNews: action.news);

UIState _updateAnnouncementsReducer(
        UIState state, UpdateHomepageAnnouncementsAction action) =>
    state.copyWith(announcements: action.announcements);
