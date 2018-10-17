import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class DeveloperOptionsPage extends StatefulWidget {
  @override
  _DeveloperOptionsPageState createState() => _DeveloperOptionsPageState();
}

class _DeveloperOptionsPageState extends State<DeveloperOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            MainLocalizations.of(context).get("Settings/DeveloperOptions")),
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
            MainLocalizations.of(context)
                .get("Settings/DeveloperOptions/Warning"),
            textAlign: TextAlign.center,
          ),
          Divider(),
          StoreConnector<MainAppState, bool>(
            converter: (store) =>
                store.state.settingState.enableFunctionsUnderDev,
            builder: (context, value) => SwitchListTile(
                  title: Text(MainLocalizations.of(context)
                      .get("Settings/DeveloperOptions/EnFuncsUnderDev")),
                  subtitle: Text(MainLocalizations.of(context).get(
                      "Settings/DeveloperOptions/EnFuncsUnderDev/Caption")),
                  value: value,
                  onChanged: (v) => mainAppStore
                      .dispatch(EnableFunctionsUnderDevAction(!value)),
                ),
          ),
        ],
      ),
    );
  }
}
