import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../../component/floating_card.dart';
import '../../../component/user_profile.dart';

class ThreadCard extends StatelessWidget {
  final Thread thread;

  const ThreadCard({
    Key? key,
    required this.thread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;

    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UserProfileBuilder(
          uid: thread.uid,
          builder: (context, profile) => Row(
            key: ValueKey(profile),
            children: <Widget>[
              // Build user avatar.
              Padding(
                padding: const EdgeInsets.all(8),
                child: Hero(
                  tag: thread.hashCode,
                  child: CircleAvatar(
                    child: ExtendedImage.network(
                      profile.avatar,
                      shape: BoxShape.circle,
                    ),
                    radius: 15,
                  ),
                ),
              ),

              // Build user name and timestamp.
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(text: profile.displayName),
                    TextSpan(
                      text:
                          ' · ${format(thread.createAt.toDateTime(), locale: lang, allowFromNow: true)}',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ),
            ],
          ),
          placeholder: (context) => const Text('  ...  '),
        ),
        // Build title.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            thread.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );

    return FloatingCard(
      child: content,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      onTap: () {},
    );
  }
}
