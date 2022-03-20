import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';
import '../global.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';
import '../util/platform.dart';

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
              children: [
                ListTile(
                  title: Text(LocaleKeys.ServiceStatus.tr()),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => const _ServerStatus(),
                  ),
                ),
                const _AboutTile(),
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

class _ServerStatus extends StatelessWidget {
  const _ServerStatus({Key? key}) : super(key: key);

  Widget _buildTile({required String name, required String url}) {
    return FutureBuilder(
      future: get(Uri.parse(url)).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception(),
      ),
      builder: (context, snapshot) {
        return ListTile(
          title: Text(name),
          trailing: snapshot.connectionState == ConnectionState.waiting
              ? const Icon(Icons.more_horiz)
              : snapshot.connectionState == ConnectionState.done &&
                      !snapshot.hasError
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.close, color: Colors.red),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(LocaleKeys.ServiceStatus.tr()),
      children: [
        _buildTile(
          name: 'XMUX',
          url: apiAddress,
        ),
        _buildTile(
          name: 'Moodle',
          url: '$moodleAddress/webservice/rest/server.php',
        ),
        if (isVM)
          _buildTile(
            name: 'Media Site',
            url: 'https://mymedia.xmu.edu.cn/Mediasite/',
          ),
        _buildTile(
          name: 'Media Site Video',
          url: 'https://myv.xmu.edu.cn/MediasiteDeliver/',
        ),
      ],
    );
  }
}

class _AboutTile extends StatefulWidget {
  const _AboutTile({Key? key}) : super(key: key);

  @override
  State<_AboutTile> createState() => _AboutTileState();
}

class _AboutTileState extends State<_AboutTile> {
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
          onTap: () => launch(docsAddress),
        ),
        ListTile(
          title: Text(LocaleKeys.SignIn_Privacy.tr()),
          onTap: () => launch('$docsAddress/app/privacy/'),
        ),
        ListTile(
          title: Text(LocaleKeys.More.tr()),
          onTap: () => launch('$docsAddress/app/about/'),
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
