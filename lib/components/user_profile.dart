import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmux/modules/api/models/v3_user.dart';
import 'package:xmux/modules/api/xmux_api.dart';

var _cached = <String, Profile>{};

class UserProfileBuilder extends StatefulWidget {
  final String uid;

  final Widget Function(BuildContext, Profile) builder;
  final WidgetBuilder loadingBuilder;

  const UserProfileBuilder({
    Key key,
    @required this.uid,
    @required this.builder,
    this.loadingBuilder,
  }) : super(key: key);

  @override
  UserProfileBuilderState createState() => UserProfileBuilderState();
}

class UserProfileBuilderState extends State<UserProfileBuilder> {
  Profile profile;

  @override
  void initState() {
    if (_cached.containsKey(widget.uid))
      profile = _cached[widget.uid];
    else
      XmuxApi.instance.getProfile(uid: widget.uid).then((v) {
        // TODO: Clear periodically.
        _cached[widget.uid] = v.data;
        if (mounted) setState(() => profile = v.data);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (profile == null) if (widget.loadingBuilder != null)
      return widget.loadingBuilder(context);
    else
      return CircularProgressIndicator();
    return widget.builder(context, profile);
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
          backgroundImage: ExtendedNetworkImageProvider(profile.avatar),
          radius: radius,
        ),
        loadingBuilder: (context) => CircleAvatar(
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
