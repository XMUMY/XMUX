import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:timeago/timeago.dart' as timeago;

import '../../component/user_profile.dart';

class ProfileHeadline extends StatelessWidget {
  final String uid;
  final DateTime time;
  final bool topped;
  final bool best;
  final Widget? sideButton;

  const ProfileHeadline(
      {Key? key,
      required this.uid,
      required this.time,
      this.topped = false,
      this.best = false,
      this.sideButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        UserProfileBuilder(
          uid: uid,
          builder: (context, profile) => Row(
            key: ValueKey(profile),
            children: <Widget>[
              // Build user avatar.
              Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  child: ExtendedImage.network(
                    profile.avatar,
                    shape: BoxShape.circle,
                  ),
                  radius: 13,
                ),
              ),

              // Build user name and timestamp.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: [
                        TextSpan(text: profile.displayName),
                        TextSpan(
                            text: ' · ${timeUtil(time, 'et')}',
                            style: Theme.of(context).textTheme.caption)
                      ])),
                ],
              ),
            ],
          ),
          placeholder: (context) => const Text('  ...  '),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Special attributes.
            if (topped)
              Padding(
                padding: const EdgeInsets.all(5),
                child: Transform.rotate(
                    angle: math.pi / 6,
                    child: const Icon(
                      Icons.push_pin_rounded,
                      color: Colors.lightGreen,
                    )),
              ),
            if (best && !topped)
              const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.star,
                    color: Colors.lightBlueAccent,
                  )),
            if (sideButton != null) sideButton!
          ],
        ),
      ],
    );
  }
}

String timeUtil(DateTime date, String locale) {
  locale = locale.substring(0, 2);
  return timeago.format(date, locale: locale, allowFromNow: true);
}
