import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmus_client/generated/user.pb.dart';
import 'package:xmux/globals.dart';

var _cached = <String, Profile>{};

/// A builder for widgets that depend on user profile.
///
/// An animation will be applied between builder and placeholder. If they have
/// same type, a different key should be assigned to triger animation.
/// See [AnimatedSwitcher].
class UserProfileBuilder extends StatefulWidget {
  final String uid;

  final Widget Function(BuildContext, Profile) builder;
  final WidgetBuilder placeholder;

  const UserProfileBuilder({
    Key key,
    @required this.uid,
    @required this.builder,
    this.placeholder,
  }) : super(key: key);

  @override
  UserProfileBuilderState createState() => UserProfileBuilderState();
}

class UserProfileBuilderState extends State<UserProfileBuilder> {
  Profile get profile => _profile;
  Profile _profile;

  @override
  void initState() {
    if (_cached.containsKey(widget.uid))
      _profile = _cached[widget.uid];
    else
      rpc.userClient.getProfile(GetProfileReq()..uid = widget.uid).then((v) {
        // TODO: Clear periodically.
        _cached[widget.uid] = v;
        if (mounted) setState(() => _profile = v);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (profile == null) {
      if (widget.placeholder != null)
        child = widget.placeholder(context);
      else
        child = CircularProgressIndicator();
    } else
      child = widget.builder(context, profile);

    return AnimatedSwitcher(
      child: child,
      duration: const Duration(milliseconds: 300),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String uid;
  final String url;
  final ImageProvider provider;

  final String heroTag;
  final double radius;

  const UserAvatar({
    Key key,
    this.uid,
    this.url,
    this.provider,
    this.heroTag,
    this.radius,
  })  : assert(uid != null || url != null || provider != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (provider != null)
      avatar = CircleAvatar(
        backgroundImage: provider,
        radius: radius,
      );
    else if (url != null)
      avatar = CircleAvatar(
        backgroundImage: ExtendedNetworkImageProvider(url),
        radius: radius,
      );
    else
      avatar = UserProfileBuilder(
        uid: uid,
        builder: (context, profile) => CircleAvatar(
          backgroundImage:
              ExtendedNetworkImageProvider(profile.avatar, cache: true),
          radius: radius,
        ),
        placeholder: (context) => CircleAvatar(
          child: SpinKitDoubleBounce(color: Colors.white70),
          radius: radius,
        ),
      );

    if (heroTag != null)
      return Hero(
        tag: heroTag,
        child: avatar,
      );
    else
      return avatar;
  }
}
