import 'package:flutter/material.dart';

import '../../global.dart';
import '../../util/tab.dart';
import 'thread_list.dart';

/// The discover tab. Currently use forum 0.
class DiscoverTab extends StatefulWidget implements TabEntry {
  const DiscoverTab({Key? key}) : super(key: key);

  @override
  String get path => 'Discover';

  @override
  String get label => LocaleKeys.Community_Discover.tr();

  @override
  State<DiscoverTab> createState() => _DiscoverTabState();
}

class _DiscoverTabState extends State<DiscoverTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const ThreadList(forumId: 0);
  }
}
