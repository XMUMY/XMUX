import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';

class DeveloperOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Settings/DeveloperOptions', context)),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.warning,
              size: 50.0,
            ),
          ),
          Text(
            i18n('Settings/DeveloperOptions/Warning', context),
            textAlign: TextAlign.center,
          ),
          Divider(),
          StoreConnector<MainAppState, bool>(
            converter: (store) =>
                store.state.settingState.enableFunctionsUnderDev,
            builder: (context, value) => SwitchListTile(
                  title: Text(i18n(
                      'Settings/DeveloperOptions/EnFuncsUnderDev', context)),
                  subtitle: Text(i18n(
                      'Settings/DeveloperOptions/EnFuncsUnderDev/Caption',
                      context)),
                  value: value,
                  onChanged: (v) =>
                      store.dispatch(EnableFunctionsUnderDevAction(!value)),
                ),
          ),
        ],
      ),
    );
  }
}
