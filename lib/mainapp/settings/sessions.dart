import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v3.dart';

class SessionsPage extends StatefulWidget {
  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  List<Device> devices;

  Future<Null> handleRefresh() async {
    var resp = await XMUXApi.instance.getDevices(
        Authorization.bearer((await firebaseUser.getIdToken()).token));
    devices = resp.data;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (devices == null)
      body = Center(child: CircularProgressIndicator());
    else if (devices.isEmpty)
      body = EmptyErrorButton(onRefresh: handleRefresh);
    else
      body = RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name: ${devices[index].deviceName}'),
                Text('Model: ${devices[index].deviceModel}'),
                Text(
                    'Last Seen: ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(devices[index].lastSeen)} '
                    '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(devices[index].lastSeen)}')
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      );

    return Scaffold(appBar: AppBar(title: Text('Sessions')), body: body);
  }
}
