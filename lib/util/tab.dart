import 'package:flutter/material.dart';

/// An entry abstraction for tabs in [TabBarView].
abstract class TabEntry extends Widget {
  const TabEntry({super.key});

  /// The path of tab that used in tracker and router.
  String get path;

  /// The label displayed in tab bar.
  String get label;
}
