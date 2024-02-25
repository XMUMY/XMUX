import 'package:flutter/material.dart';
import 'package:xmus_client/generated/user.pb.dart';

import '../global.dart';

final _cached = <String, Profile>{};

/// A builder for widgets that depend on user profile.
///
/// An animation will be applied between builder and placeholder. If they have
/// same type, a different key should be assigned to trigger the animation.
/// See [AnimatedSwitcher].
class UserProfileBuilder extends StatefulWidget {
  final String uid;

  final Widget Function(BuildContext, Profile) builder;

  final WidgetBuilder? placeholder;

  const UserProfileBuilder({
    super.key,
    required this.uid,
    required this.builder,
    this.placeholder,
  });

  @override
  State<UserProfileBuilder> createState() => _UserProfileBuilderState();
}

class _UserProfileBuilderState extends State<UserProfileBuilder> {
  Profile? _profile;

  void _updateProfile() {
    if (_cached.containsKey(widget.uid)) {
      _profile = _cached[widget.uid];
    } else {
      rpc.userClient.getProfile(GetProfileReq()..uid = widget.uid).then((v) {
        _cached[widget.uid] = v;
        if (mounted) setState(() => _profile = v);
      });
    }
  }

  @override
  void initState() {
    _updateProfile();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UserProfileBuilder oldWidget) {
    if (widget.uid != oldWidget.uid) _updateProfile();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final profile = _profile;

    Widget child;
    if (profile != null) {
      child = widget.builder(context, profile);
    } else {
      final placeholder = widget.placeholder;
      if (placeholder != null) {
        child = placeholder(context);
      } else {
        child = const CircularProgressIndicator();
      }
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: child,
    );
  }
}
