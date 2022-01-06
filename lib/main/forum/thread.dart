import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmus_client/generated/lost_found.pb.dart';
import 'package:xmus_client/generated/post.pb.dart';

import '../../../component/user_profile.dart';
import '../../../global.dart';
import '../../../util/screen.dart';

class ThreadPage extends StatefulWidget {
  final PostDetails postDetails;

  const ThreadPage({Key? key, required this.postDetails})
      : super(key: key);

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  // TODO: add replies

  Future<void> handleRefresh() async {
  }

  @override
  void initState() {
    handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Details.
    Widget post;
    post = Card(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.postDetails.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(color: Colors.transparent),
            Text(widget.postDetails.body,
              style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Placeholder'),
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
            UserProfileBuilder(
              uid: widget.postDetails.uid,
              builder: (context, profile) => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Hero(
                      tag: widget.postDetails.hashCode,
                      child: CircleAvatar(
                        child: ExtendedImage.network(
                          profile.avatar,
                          shape: BoxShape.circle,
                        ),
                        radius: 20,
                      ),
                    ),
                  ),
                  Text(profile.displayName),
                ],
              ),
            ),
            post,
          ],
        ),
      ),
    );
  }
}
