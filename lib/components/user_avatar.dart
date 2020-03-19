import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmux/modules/api/models/v3_user.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class UserAvatar extends StatefulWidget {
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
  _UserAvatarState createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  Profile profile;

  @override
  void initState() {
    if (widget.uid != null && widget.provider == null && widget.url == null)
      XmuxApi.instance
          .getProfile(uid: widget.uid)
          .then((v) => mounted ? setState(() => profile = v.data) : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    if (widget.provider != null)
      avatar = CircleAvatar(
        backgroundImage: widget.provider,
        radius: widget.radius,
      );
    else if (widget.url != null)
      avatar = CircleAvatar(
        backgroundImage: ExtendedNetworkImageProvider(widget.url),
        radius: widget.radius,
      );
    else
      avatar = profile != null
          ? CircleAvatar(
              backgroundImage: ExtendedNetworkImageProvider(profile.avatar),
              radius: widget.radius,
            )
          : CircleAvatar(
              child: SpinKitDoubleBounce(color: Colors.white70),
              radius: widget.radius,
            );

    if (widget.heroTag != null)
      return Hero(
        tag: widget.heroTag,
        child: avatar,
      );
    else
      return avatar;
  }
}
