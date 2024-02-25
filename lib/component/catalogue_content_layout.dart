import 'package:flutter/material.dart';

import '../util/screen.dart';

class CatalogueContentLayout extends StatelessWidget {
  /// Builder for catalogue.
  final Widget Function(BuildContext context, bool isNarrow) catalogueBuilder;

  /// The content shows on the rest area of wide screen.
  final Widget? content;

  const CatalogueContentLayout({
    super.key,
    required this.catalogueBuilder,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final isNarrow = Breakpoint.extraSmall.contains(width) ||
          Breakpoint.small1.contains(width);

      final catalogue = catalogueBuilder(context, isNarrow);

      if (!isNarrow) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: Breakpoint.small1.maxWidth / 2,
              child: catalogue,
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: content ?? Container(),
              ),
            ),
          ],
        );
      }

      return catalogue;
    });
  }
}
