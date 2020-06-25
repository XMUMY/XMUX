import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';

class InterfacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Settings_Interface.tr()),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          StoreConnector<MainAppState, bool>(
            converter: (store) => store.state.settingState.enableBlur,
            builder: (context, value) => SwitchListTile.adaptive(
              title: Text(LocaleKeys.Settings_InterfaceEnableBlur.tr()),
              subtitle: Text(
                LocaleKeys.Settings_InterfaceEnableBlurCaption.tr(),
              ),
              value: value,
              onChanged: (v) => store.dispatch(EnableBlurAction(!value)),
            ),
          ),
        ],
      ),
    );
  }
}
