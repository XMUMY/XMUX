import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';

class DeveloperOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Settings_DeveloperOptions),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.warning,
              size: 50,
            ),
          ),
          Text(
            S.of(context).Settings_DeveloperOptionsWarning,
            textAlign: TextAlign.center,
          ),
          Divider(),

          // Enable Functions under Dev.
          StoreConnector<MainAppState, bool>(
            converter: (store) =>
                store.state.settingState.enableFunctionsUnderDev,
            builder: (context, value) => SwitchListTile.adaptive(
              title:
                  Text(S.of(context).Settings_DeveloperOptionsEnableFnUnderDev),
              subtitle: Text(
                S.of(context).Settings_DeveloperOptionsEnableFnUnderDevCaption,
              ),
              value: value,
              onChanged: (v) =>
                  store.dispatch(EnableFunctionsUnderDevAction(!value)),
            ),
          ),

          StoreConnector<MainAppState, bool>(
            converter: (store) => store.state.uiState.showPerformanceOverlay,
            builder: (context, value) => SwitchListTile.adaptive(
              title: Text(S
                  .of(context)
                  .Settings_DeveloperOptionsShowPerformanceOverlay),
              subtitle: Text(
                S
                    .of(context)
                    .Settings_DeveloperOptionsShowPerformanceOverlayCaption,
              ),
              value: value,
              onChanged: (v) =>
                  store.dispatch(ShowPerformanceOverlayAction(!value)),
            ),
          ),

          StoreConnector<MainAppState, bool>(
            converter: (store) => store.state.uiState.showSemanticsDebugger,
            builder: (context, value) => SwitchListTile.adaptive(
              title: Text(
                  S.of(context).Settings_DeveloperOptionsShowSemanticsDebugger),
              subtitle: Text(
                S
                    .of(context)
                    .Settings_DeveloperOptionsShowSemanticsDebuggerCaption,
              ),
              value: value,
              onChanged: (v) =>
                  store.dispatch(ShowSemanticsDebuggerAction(!value)),
            ),
          ),

          // Copy FCM key.
          ListTile(
            title:
                Text(S.of(context).Settings_DeveloperOptionsNotificationToken),
            subtitle: Text(
              S.of(context).Settings_DeveloperOptionsNotificationTokenCaption,
            ),
            onTap: () async => Clipboard.setData(
                ClipboardData(text: await firebase.messaging.getToken())),
          ),
        ],
      ),
    );
  }
}
