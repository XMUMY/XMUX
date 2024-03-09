import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class TabInformationProvider {
  Widget? buildLeading(BuildContext context);
  Widget? buildTrailing(BuildContext context);
  Iterable<(int, String)> getTabs(Iterable<(int, String)> branches);
}

class TabShellContainer extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final TabInformationProvider tabInformationProvider;
  final List<Widget> children;

  const TabShellContainer({
    super.key,
    required this.navigationShell,
    required this.tabInformationProvider,
    required this.children,
  });

  @override
  State<StatefulWidget> createState() => _TabShellContainerState();
}

class _TabShellContainerState extends State<TabShellContainer>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    vsync: this,
    length: widget.children.length,
    initialIndex: widget.navigationShell.currentIndex,
  );

  void _onTabTap(int index) {
    widget.navigationShell.goBranch(index);
  }

  void _onTabSwap() {
    if (_tabController.indexIsChanging) return;

    final shellIndex = widget.navigationShell.currentIndex;
    final tabAnimationIndex = _tabController.animation!.value.round();
    if (shellIndex != tabAnimationIndex) {
      widget.navigationShell.goBranch(tabAnimationIndex);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController.animation!.addListener(_onTabSwap);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TabShellContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    final shellIndex = widget.navigationShell.currentIndex;
    final tabIndex = _tabController.index;
    if (tabIndex != shellIndex) {
      _tabController.animateTo(shellIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final branches = widget.navigationShell.route.branches
        .mapIndexed((i, branch) => (i, (branch.routes.first as GoRoute).path));
    final effective = widget.tabInformationProvider.getTabs(branches).toList();

    final tabs = effective.map((e) => Tab(text: e.$2)).toList();
    final children = effective.map((e) => widget.children[e.$1]).toList();

    final leading = widget.tabInformationProvider.buildLeading(context);
    final trailing = widget.tabInformationProvider.buildTrailing(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kMinInteractiveDimension),
          child: Row(
            children: [
              if (leading != null) leading,
              Expanded(
                child: TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  dividerHeight: 0,
                  tabAlignment: TabAlignment.start,
                  tabs: tabs,
                  onTap: _onTabTap,
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: children,
        ),
      ),
    );
  }
}
