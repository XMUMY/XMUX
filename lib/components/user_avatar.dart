import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmux/modules/api/models/v3_user.dart';
import 'package:xmux/modules/api/xmux_api.dart';

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
    this.heroTag = 'UserAvatar',
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
      avatar = FutureBuilder<Profile>(
        future: () async {
          var resp = await XmuxApi.instance.getProfile(uid: uid);
          return resp.data;
        }(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return CircleAvatar(
                backgroundImage:
                    ExtendedNetworkImageProvider(snapshot.data.avatar),
              );
            default:
              return CircleAvatar(
                child: SpinKitDoubleBounce(color: Colors.white70),
              );
          }
        },
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
