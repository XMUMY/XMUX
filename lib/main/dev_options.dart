import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../global.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';

class DeveloperOptions extends StatelessWidget {
  const DeveloperOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Developer Options'),
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.warning,
            size: 40,
            color: Colors.red,
          ),
        ),
        const Text(
          "LEAVE HERE IF U DON'T KNOW\nWHAT U ARE DOING",
          textAlign: TextAlign.center,
        ),
        const Divider(),
        StoreConnector<AppState, bool>(
          distinct: true,
          converter: (store) => store.state.settings.enableDevFunctions,
          builder: (context, value) => SwitchListTile(
            title: const Text('Enable Dev Functions'),
            value: value,
            onChanged: (v) => store.dispatch(EnableDevFunctionsAction(v)),
          ),
        ),
        StoreConnector<AppState, bool>(
          distinct: true,
          converter: (store) => store.state.settings.showPerformanceOverlay,
          builder: (context, value) => SwitchListTile(
            title: const Text('Show Performance Overlay'),
            value: value,
            onChanged: (v) => store.dispatch(ShowPerformanceOverlayAction(v)),
          ),
        ),
        StoreConnector<AppState, bool>(
          distinct: true,
          converter: (store) => store.state.settings.showSemanticsDebugger,
          builder: (context, value) => SwitchListTile(
            title: const Text('Show Semantics Debugger'),
            value: value,
            onChanged: (v) => store.dispatch(ShowSemanticsDebuggerAction(v)),
          ),
        ),
      ],
    );
  }
}
