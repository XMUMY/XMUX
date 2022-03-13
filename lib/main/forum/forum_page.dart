import 'package:flutter/material.dart';

import '../../global.dart';
import '../main_page.dart';

class ForumPage extends StatelessWidget implements TopLevelPage {
  const ForumPage({Key? key}) : super(key: key);

  @override
  String get path => 'Forum';

  @override
  String get label => LocaleKeys.Forum_Forum.tr();

  @override
  Widget get icon => const Icon(Icons.chat_outlined);

  @override
  Widget get activeIcon => const Icon(Icons.chat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
