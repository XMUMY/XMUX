import 'package:redux/redux.dart';

import '../../../foundation/router/router.dart';
import '../action/action.dart';
import '../state/state.dart';

void redirectMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  next(action);

  if (action is AwaitableActionMixin) {
    action.future?.then((_) => _redirect(action));
  } else {
    _redirect(action);
  }
}

void _redirect(dynamic action) {
  if (action is RedirectableActionMixin) {
    final url = action.redirectTo;
    if (url != null && url.isNotEmpty) {
      router.go(url);
    }
  }
}
