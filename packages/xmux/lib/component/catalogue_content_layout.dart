import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../foundation/platform/breakpoint.dart';

class CatalogueContentPadding extends InheritedWidget {
  final EdgeInsets padding;

  const CatalogueContentPadding({
    super.key,
    required this.padding,
    required super.child,
  });

  static EdgeInsets of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<CatalogueContentPadding>()
          ?.padding ??
      EdgeInsets.symmetric(horizontal: context.padBody);

  @override
  bool updateShouldNotify(CatalogueContentPadding oldWidget) =>
      padding != oldWidget.padding;
}

class CatalogueContentLayout extends StatelessWidget {
  /// The catelogue shows on the left side of wide screen.
  final Widget catalogue;

  /// The content shows on the rest area of wide screen.
  final Widget? content;

  const CatalogueContentLayout({
    super.key,
    required this.catalogue,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isLarge = Breakpoints.large.isActive(context);
    final bodyPadding = context.padBody;

    return AdaptiveLayout(
      bodyRatio: width < 1400 ? null : 600 / (width - 192),
      body: SlotLayout(config: {
        Breakpoints.standard: SlotLayout.from(
          key: const ValueKey('catalogue'),
          builder: (context) => CatalogueContentPadding(
            padding: content != null && isLarge
                ? EdgeInsets.only(right: bodyPadding / 2)
                : EdgeInsets.symmetric(horizontal: bodyPadding),
            child: catalogue,
          ),
        ),
      }),
      secondaryBody: SlotLayout(config: {
        if (isLarge && content != null)
          Breakpoints.large: SlotLayout.from(
            key: const ValueKey('content'),
            builder: (context) => CatalogueContentPadding(
              padding: EdgeInsets.only(
                left: bodyPadding / 2,
                right: bodyPadding,
              ),
              child: PrimaryScrollController(
                controller: ScrollController(),
                child: content!,
              ),
            ),
          )
      }),
    );
  }
}

extension CatalogueContentLayoutExtension on BuildContext {
  bool get isDualPane => Breakpoints.large.isActive(this);

  bool get isUnderCatalogueContentLayout =>
      dependOnInheritedWidgetOfExactType<CatalogueContentPadding>() != null;
}
