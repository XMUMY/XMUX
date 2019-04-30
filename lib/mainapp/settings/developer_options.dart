import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
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

          // Enable Functions under Dev.
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

          // XMUX API address selector.
          ListTile(
            title: Text(i18n('Settings/DeveloperOptions/Servers', context)),
            subtitle: Text(
                i18n('Settings/DeveloperOptions/Servers/Caption', context)),
            trailing: _XmuxApiSwitch(),
          ),
        ],
      ),
    );
  }
}

class _XmuxApiSwitch extends StatefulWidget {
  static String addressToName(String address) =>
      Uri.parse(address).host.split('.')[0];

  @override
  _XmuxApiSwitchState createState() => _XmuxApiSwitchState();
}

class _XmuxApiSwitchState extends State<_XmuxApiSwitch> {
  List<DropdownMenuItem<String>> _items = XMUXApi.instance.addresses
      .map((a) => DropdownMenuItem<String>(
            child: Text(_XmuxApiSwitch.addressToName(a)),
            value: a,
          ))
      .toList();

  String get _current => XMUXApi.instance.currentAddress;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        items: _items,
        value: _current,
        onChanged: (_) => setState(() => XMUXApi.instance.currentAddress = _));
  }
}
