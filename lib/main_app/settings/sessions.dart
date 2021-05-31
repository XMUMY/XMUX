import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmus_client/generated/google/protobuf/empty.pb.dart';
import 'package:xmus_client/generated/user.pb.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/components/width_limited.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';

class SessionsPage extends StatelessWidget {
  Future<List<GetDevicesResp_Device>> _handleRefresh() async {
    var resp = await rpc.userClient.getDevices(Empty());
    return resp.devices;
  }

  @override
  Widget build(BuildContext context) {
    var languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Settings_SecuritySessions.tr())),
      body: Refreshable<List<GetDevicesResp_Device>>(
        onRefresh: _handleRefresh,
        builder: (context, devices) => ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10),
          itemCount: devices.length,
          itemBuilder: (context, index) {
            var lastSeen = devices[index].lastSeen.toDateTime().toLocal();
            var content = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Name: ${devices[index].deviceName}'),
                Text('Model: ${devices[index].deviceModel}'),
                Text(
                  'Last Seen: ${DateFormat.yMMMd(languageCode).format(lastSeen)} '
                  '${DateFormat.Hms(languageCode).format(lastSeen)}',
                )
              ],
            );

            return WidthLimited(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: content,
              ),
            );
          },
          separatorBuilder: (context, index) => WidthLimited(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
          ),
        ),
      ),
    );
  }
}
