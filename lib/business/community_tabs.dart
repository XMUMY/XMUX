import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../component/tab_shell_container.dart';
import '../foundation/localization/locale_keys.dart';

class CommunityTabs implements TabInformationProvider {
  static const _translations = {
    '/community/discover': LocaleKeys.Community_Discover,
  };

  const CommunityTabs();

  @override
  Widget? buildLeading(BuildContext context) => null;

  @override
  Widget? buildTrailing(BuildContext context) => IconButton(
        icon: const Icon(Icons.bookmark_border),
        tooltip: LocaleKeys.Community_Favorites.tr(),
        onPressed: () => context.push('/community/favorite/thread'),
      );

  @override
  Iterable<(int, String)> getTabs(Iterable<(int, String)> branches) =>
      branches.map((e) => (e.$1, _translations[e.$2]!.tr()));
}
