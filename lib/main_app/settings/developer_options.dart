import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';

class DeveloperOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Settings_DeveloperOptions.tr()),
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
            LocaleKeys.Settings_DeveloperOptionsWarning.tr(),
            textAlign: TextAlign.center,
          ),
          Divider(),

          // Enable Functions under Dev.
          StoreConnector<MainAppState, bool>(
            converter: (store) =>
                store.state.settingState.enableFunctionsUnderDev,
            builder: (context, value) => SwitchListTile.adaptive(
              title: Text(
                  LocaleKeys.Settings_DeveloperOptionsEnableFnUnderDev.tr()),
              subtitle: Text(
                LocaleKeys.Settings_DeveloperOptionsEnableFnUnderDevCaption.tr()
                    .tr(),
              ),
              value: value,
              onChanged: (v) =>
                  store.dispatch(EnableFunctionsUnderDevAction(!value)),
            ),
          ),

          StoreConnector<MainAppState, bool>(
            converter: (store) => store.state.uiState.showPerformanceOverlay,
            builder: (context, value) => SwitchListTile.adaptive(
              title: Text(LocaleKeys
                  .Settings_DeveloperOptionsShowPerformanceOverlay.tr()),
              subtitle: Text(
                LocaleKeys
                        .Settings_DeveloperOptionsShowPerformanceOverlayCaption
                    .tr(),
              ),
              value: value,
              onChanged: (v) =>
                  store.dispatch(ShowPerformanceOverlayAction(!value)),
            ),
          ),

          StoreConnector<MainAppState, bool>(
            converter: (store) => store.state.uiState.showSemanticsDebugger,
            builder: (context, value) => SwitchListTile.adaptive(
              title: Text(LocaleKeys
                  .Settings_DeveloperOptionsShowSemanticsDebugger.tr()),
              subtitle: Text(
                LocaleKeys.Settings_DeveloperOptionsShowSemanticsDebuggerCaption
                    .tr(),
              ),
              value: value,
              onChanged: (v) =>
                  store.dispatch(ShowSemanticsDebuggerAction(!value)),
            ),
          ),

          // Copy FCM key.
          ListTile(
            title: Text(
                LocaleKeys.Settings_DeveloperOptionsNotificationToken.tr()),
            subtitle: Text(
              LocaleKeys.Settings_DeveloperOptionsNotificationTokenCaption.tr(),
            ),
            onTap: () async => Clipboard.setData(
                ClipboardData(text: await firebase.messaging.getToken())),
          ),
        ],
      ),
    );
  }
}
