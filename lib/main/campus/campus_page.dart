import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/util/screen.dart';

import '../main_page.dart';

class CampusPage extends StatelessWidget implements TopLevelPage {
  const CampusPage({Key? key}) : super(key: key);

  @override
  String get label => 'Campus';

  @override
  Widget get icon => const Icon(FontAwesomeIcons.university);

  @override
  Widget get activeIcon => const Icon(FontAwesomeIcons.university);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: context.padBody),
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Academic Tools',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Divider(height: 3),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Campus Tools',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const Divider(height: 3),
      ],
    );
  }
}
