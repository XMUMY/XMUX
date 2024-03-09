import 'package:redux/redux.dart';

import 'middleware/api_request.dart';
import 'middleware/redirect.dart';
import 'middleware/save.dart';
import 'reducer/reducer.dart';
import 'state/state.dart';

/// The global redux store
final store = Store(
  appReducer,
  initialState: AppState(),
  middleware: [
    redirectMiddleware,
    apiRequestMiddleware,
    saveMiddleware,
  ],
  distinct: true,
);
