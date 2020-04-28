import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';

class InterfacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Settings_Interface),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          StoreConnector<MainAppState, bool>(
            converter: (store) => store.state.settingState.enableBlur,
            builder: (context, value) => SwitchListTile.adaptive(
              title: Text(S.of(context).Settings_InterfaceEnableBlur),
              subtitle: Text(
                S.of(context).Settings_InterfaceEnableBlurCaption,
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
