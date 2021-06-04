import 'package:redux/redux.dart';

import '../action/action.dart';
import '../state/state.dart';

/// Redux middleware for API request.
///
/// If an action is [ApiRequestAction], the middleware will call for API request
/// before go to next middleware.
void apiRequestMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is ApiRequestAction) {
    action.future = _request(store, action, next);
  } else {
    next(action);
  }
}

Future<void> _request(
  Store<AppState> store,
  ApiRequestAction action,
  NextDispatcher next,
) async {
  try {
    await action(store);
    next(action);
  } on Exception catch (e) {
    final onError = action.onError;
    if (onError != null) {
      onError(e);
    } else {
      rethrow;
    }
  }
}
