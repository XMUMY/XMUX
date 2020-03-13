import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/modules/api/models/v3_user.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class SessionsPage extends StatelessWidget {
  Future<List<Device>> handleRefresh() async {
    var resp = await XmuxApi.instance.devices;
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).Settings_Sessions)),
      body: Refreshable<List<Device>>(
        onRefresh: handleRefresh,
        builder: (context, devices) => ListView.separated(
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
      ),
    );
  }
}
