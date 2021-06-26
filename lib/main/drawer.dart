import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../config.dart';
import '../redux/state/state.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: StoreConnector<AppState, String>(
              distinct: true,
              converter: (s) => s.state.user.profile.name,
              builder: (context, name) => Center(child: Text(name)),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('Sign Out'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.done
                    ? Text(snapshot.data!.version)
                    : const Text(fallbackVersionName),
          ),
        ],
      ),
    );
  }
}
