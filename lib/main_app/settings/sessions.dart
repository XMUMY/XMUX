import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class SessionsPage extends StatelessWidget {
  Future<List<Device>> handleRefresh() async {
    var resp = await XmuxApi.instance.devices;
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Settings_SecuritySessions.tr())),
      body: Refreshable<List<Device>>(
        onRefresh: handleRefresh,
        builder: (context, devices) => ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: max((MediaQuery.of(context).size.width - 500) / 2, 20),
          ),
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
