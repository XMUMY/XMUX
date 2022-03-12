import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';
import '../global.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: StoreConnector<AppState, String>(
                    distinct: true,
                    converter: (s) => store.state.user.profile.avatar.isNotEmpty
                        ? store.state.user.profile.avatar
                        : remoteConfigs.staticResources.defaultAvatar,
                    builder: (context, s) => CircleAvatar(
                      foregroundImage: ExtendedNetworkImageProvider(s),
                      radius: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: StoreConnector<AppState, String>(
                    distinct: true,
                    converter: (s) => s.state.user.profile.displayName,
                    builder: (context, s) =>
                        Text(s, textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(LocaleKeys.SignOut.tr()),
                  onTap: () => store.dispatch(LogoutAction()),
                ),
                ListTile(
                  title: Text(LocaleKeys.About.tr()),
                  onTap: () => launch('https://docs.xmux.xdea.io/app/about'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) =>
                  Text(snapshot.data?.version ?? fallbackVersionName),
            ),
          ),
        ],
      ),
    );
  }
}
