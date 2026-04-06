import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../component/tab.dart';
import '../../foundation/localization/locale_keys.dart';
import 'thread_list.dart';

/// The discover tab. Currently use forum 0.
class DiscoverTab extends StatefulWidget implements TabEntry {
  const DiscoverTab({super.key});

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
