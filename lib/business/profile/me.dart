import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../component/gravatar.dart';
import '../../foundation/config/config.dart';
import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/breakpoint.dart';
import '../../foundation/platform/platform.dart';
import '../../global.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';
import '../redux/store.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleBodyLayout(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.padBody),
        children: [
          DrawerHeader(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: StoreConnector<AppState, String>(
                    distinct: true,
                    converter: (s) => store.state.user.profile.avatar,
                    builder: (context, url) => Gravatar(
                      url: url,
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
          ListTile(
            leading: const Icon(Icons.dns_outlined),
            title: Text(LocaleKeys.ServiceStatus.tr()),
            onTap: () => showDialog(
              context: context,
              builder: (context) => const _ServerStatus(),
            ),
          ),
          const _AboutTile(),
          ListTile(
            leading: const Icon(Icons.exit_to_app_outlined),
            title: Text(LocaleKeys.SignOut.tr()),
            onTap: () {
              store.dispatch(LogoutAction());
              rpc.authorization.erase();
              if (isMobileApp || isWeb || isMacOSApp) {
                FirebaseAuth.instance.signOut().catchError((_) {});
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ServerStatus extends StatelessWidget {
  const _ServerStatus();

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
        if (isNative)
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
  const _AboutTile();

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
          '${info?.version ?? fallbackBuildName} (${info?.buildNumber ?? fallbackBuildNumber})',
      children: [
        ListTile(
          title: Text(LocaleKeys.SignIn_Docs.tr()),
          onTap: () => launchUrlString(docsAddress),
        ),
        ListTile(
          title: Text(LocaleKeys.SignIn_Terms.tr()),
          onTap: () => launchUrlString('$docsAddress/app/terms/'),
        ),
        ListTile(
          title: Text(LocaleKeys.SignIn_Privacy.tr()),
          onTap: () => launchUrlString('$docsAddress/app/privacy/'),
        ),
        ListTile(
          title: Text(LocaleKeys.More.tr()),
          onTap: () => launchUrlString('$docsAddress/app/about/'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.info_outline),
      title: Text(LocaleKeys.About.tr()),
      onTap: () => _showAbout(),
      onLongPress: () => showDialog(
        context: context,
        builder: (_) => const DeveloperOptions(),
      ),
    );
  }
}

class DeveloperOptions extends StatelessWidget {
  const DeveloperOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Developer Options'),
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.warning,
            size: 40,
            color: Colors.red,
          ),
        ),
        const Text(
          "LEAVE HERE IF U DON'T KNOW\nWHAT U ARE DOING",
          textAlign: TextAlign.center,
        ),
        const Divider(),
        StoreConnector<AppState, bool>(
          distinct: true,
          converter: (store) => store.state.settings.enableDevFunctions,
          builder: (context, value) => SwitchListTile(
            title: const Text('Enable Dev Functions'),
            value: value,
            onChanged: (v) => store.dispatch(EnableDevFunctionsAction(v)),
          ),
        ),
        StoreConnector<AppState, bool>(
          distinct: true,
          converter: (store) => store.state.settings.showPerformanceOverlay,
          builder: (context, value) => SwitchListTile(
            title: const Text('Show Performance Overlay'),
            value: value,
            onChanged: (v) => store.dispatch(ShowPerformanceOverlayAction(v)),
          ),
        ),
        StoreConnector<AppState, bool>(
          distinct: true,
          converter: (store) => store.state.settings.showSemanticsDebugger,
          builder: (context, value) => SwitchListTile(
            title: const Text('Show Semantics Debugger'),
            value: value,
            onChanged: (v) => store.dispatch(ShowSemanticsDebuggerAction(v)),
          ),
        ),
      ],
    );
  }
}
