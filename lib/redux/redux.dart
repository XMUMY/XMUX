import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'state/state.dart';

export 'actions/actions.dart';
export 'middleware.dart';
export 'reducers/reducer.dart';
export 'state/state.dart';

extension MainStoreProvider on BuildContext {
  Store<MainAppState> get store => StoreProvider.of<MainAppState>(this);
}
