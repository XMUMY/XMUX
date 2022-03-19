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
                    builder: (context, url) => CircleAvatar(
                      foregroundImage: ExtendedNetworkImageProvider(
                        url,
                        cache: true,
                      ),
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
              children: const [
                AboutTile(),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(LocaleKeys.SignOut.tr()),
            onTap: () => store.dispatch(LogoutAction()),
          ),
        ],
      ),
    );
  }
}

class AboutTile extends StatefulWidget {
  const AboutTile({Key? key}) : super(key: key);

  @override
  State<AboutTile> createState() => _AboutTileState();
}

class _AboutTileState extends State<AboutTile> {
  Future<void> _showAbout() async {
    PackageInfo? info;
    try {
      info = await PackageInfo.fromPlatform();
    } catch (_) {}
    if (!mounted) return;
    showAboutDialog(
      context: context,
      applicationVersion:
          '${info?.version ?? fallbackVersionName} (${info?.buildNumber ?? fallbackVersionCode})',
      children: [
        ListTile(
          title: Text(LocaleKeys.SignIn_Docs.tr()),
          onTap: () => launch('https://docs.xmux.xdea.io'),
        ),
        ListTile(
          title: Text(LocaleKeys.SignIn_Privacy.tr()),
          onTap: () => launch('https://docs.xmux.xdea.io/app/privacy/'),
        ),
        ListTile(
          title: Text(LocaleKeys.More.tr()),
          onTap: () => launch('https://docs.xmux.xdea.io/app/about'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.About.tr()),
      onTap: () => _showAbout(),
    );
  }
}
