import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';

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
  final _pagingController = PagingController<int, Reply>(
    firstPageKey: 0,
  );
  final TextEditingController _replyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isSubmitting = false;

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getReply(GetReplyReq(
        pageNo: pageKey,
        pageSize: 10,
        refId: widget.postDetails.id,
        refType: RefType.POST,
        sort: SortingMethod.NEWEST));
    final replies = resp.replies;
    if (replies.isNotEmpty) {
      _pagingController.appendPage(replies, pageKey + 1);
    } else {
      _pagingController.appendLastPage([Reply(id: -14514)]);
    }
  }

  Future<void> _handleRefresh() async {
    _pagingController.refresh();
    if (mounted) setState(() {});
  }

  Future<void> _handleReplySubmit() async {
    if (_isSubmitting || !_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);
    try {
      await rpc.forumClient.createReply(CreateReplyReq(
          content: _replyController.text,
          refId: widget.postDetails.id,
          refType: RefType.POST));
      _handleRefresh();
    } catch (e) {
      // TODO: Show error.
      setState(() => _isSubmitting = false);
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    _handleRefresh();
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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
        onRefresh: _handleRefresh,
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _PostDetailsCard(
                        postDetails: widget.postDetails, locale: locale),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Comments'.tr(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
              PagedSliverList<int, Reply>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Reply>(
                  itemBuilder: (context, item, index) {
                    if (item.id == -14514) {
                      return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('-----END-----',
                              style: Theme.of(context).textTheme.caption,
                              textAlign: TextAlign.center));
                    }
                    return _ReplyCard(
                      reply: item,
                      locale: locale,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _replyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 500,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Your comment here'.tr(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _handleReplySubmit();
                            FocusScope.of(context).unfocus();
                            _replyController.clear();
                          },
                          icon: const Icon(Icons.send))),
                  validator: (v) => v != null && v.isNotEmpty ? null : '',
                ),
              ));
        },
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
                style: Theme.of(context).textTheme.headline5,
              ),
              const Divider(color: Colors.transparent),
              Text(
                postDetails.body,
                style: Theme.of(context).textTheme.bodyLarge,
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

class _ReplyCard extends StatelessWidget {
  final Reply reply;
  final String locale;

  const _ReplyCard({Key? key, required this.reply, required this.locale})
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
              uid: reply.uid,
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
                        timeUtil(reply.createTime.toDateTime(), locale),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
              placeholder: (context) => const Text('  ...  '),
            ),

            // Special attributes of reply.
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(reply.topped ? 'Top' : ''),
            ),
          ],
        ),

        // Build content.
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(reply.content,
              style: Theme.of(context).textTheme.titleMedium),
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
