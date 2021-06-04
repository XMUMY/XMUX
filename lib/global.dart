import 'package:redux/redux.dart';
import 'package:xmus_client/xmus_client.dart';

import 'config.dart';
import 'redux/reducer/reducer.dart';
import 'redux/state/state.dart';

/// Redux store.
final store = Store(appReducer, initialState: const AppState());

/// RPC client.
final rpc = XmuxRpc(apiAddress);
