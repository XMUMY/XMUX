import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:xmus_client/generated/post.pb.dart';

import '../../../component/user_profile.dart';
import '../../../global.dart';
import '../../../util/screen.dart';
import '../../component/floating_card.dart';
import 'forum_page.dart';

class ThreadPage extends StatefulWidget {
  final PostDetails postDetails;

  const ThreadPage({Key? key, required this.postDetails}) : super(key: key);

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  // TODO: add replies

  Future<void> handleRefresh() async {}

  @override
  void initState() {
    handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();

    return Scaffold(
      appBar: AppBar(
        title: Text(groupNameDecorationUtil(widget.postDetails.groupName)),
        actions: <Widget>[
          if (widget.postDetails.uid == store.state.user.campusId)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                await rpc.forumClient.removePost(
                  UpdatePostReq(postId: widget.postDetails.id),
                );
                Navigator.of(context).pop(true);
              },
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: context.padBody,
          ),
          shrinkWrap: true,
          children: <Widget>[
            _PostDetailsCard(postDetails: widget.postDetails, locale: locale),
          ],
        ),
      ),
    );
  }
}

class _PostDetailsCard extends StatelessWidget {
  final PostDetails postDetails;
  final String locale;

  const _PostDetailsCard(
      {Key? key, required this.postDetails, required this.locale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UserProfileBuilder(
              uid: postDetails.uid,
              builder: (context, profile) => Row(
                key: ValueKey(profile),
                children: <Widget>[
                  // Build user avatar.
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      child: ExtendedImage.network(
                        profile.avatar,
                        shape: BoxShape.circle,
                      ),
                      radius: 20,
                    ),
                  ),

                  // Build user name and timestamp.
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(profile.displayName),
                      Text(
                        timeUtil(postDetails.createTime.toDateTime(), locale),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              placeholder: (context) => const Text('  ...  '),
            ),

            // Special attributes of post.
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(postDetails.best && postDetails.topped
                  ? 'Best & Top'
                  : postDetails.best
                      ? 'Best'
                      : postDetails.topped
                          ? 'Top'
                          : ''),
            ),
          ],
        ),

        // Build post.
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                postDetails.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(color: Colors.transparent),
              Text(
                postDetails.body,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );

    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      child: content,
    );
  }
}
