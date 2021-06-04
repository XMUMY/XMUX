import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Container();
  }
}
