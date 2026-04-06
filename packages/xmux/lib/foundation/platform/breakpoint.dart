import 'package:flutter/widgets.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

extension PaddingExtension on BuildContext {
  double get padBody => Breakpoints.mediumAndUp.isActive(this) ? 24 : 16;

  EdgeInsets get padListView {
    final horizontalPadding = padBody;
    return EdgeInsets.fromLTRB(
      horizontalPadding,
      4,
      horizontalPadding,
      MediaQuery.of(this).padding.bottom,
    );
  }
}

class SingleBodyLayout extends StatelessWidget {
  final Widget child;

  const SingleBodyLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1040),
        child: child,
      ),
    );
  }
}
