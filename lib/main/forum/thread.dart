import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:xmus_client/generated/post.pb.dart';
import 'package:xmus_client/generated/reply.pb.dart';

import '../../../component/user_profile.dart';
import '../../../global.dart';
import '../../../util/screen.dart';
import '../../component/floating_card.dart';
import 'widgets.dart';

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
  double _bottomSheetHeight = 0;
  final _bottomSheetKey = GlobalKey();
  int _sortMethodIdx = 1;
  final _sortMethodStr = ['Forum.OrderNew'.tr(), 'Forum.OrderOld'.tr()];

  Future<void> _fetchPage(int pageKey) async {
    final resp = await rpc.forumClient.getReply(GetReplyReq(
        pageNo: pageKey,
        pageSize: 10,
        refPostId: widget.postDetails.id,
        sort: SortingMethod.valueOf(_sortMethodIdx)));
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

  Future<void> _handleReplySubmit(String content, int refReplyId) async {
    try {
      await rpc.forumClient.createReply(CreateReplyReq(
          content: content,
          refPostId: widget.postDetails.id,
          refReplyId: refReplyId));
      _handleRefresh();
    } catch (e) {
      // TODO: Show error.
    }
  }

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener(_fetchPage);
    _handleRefresh();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final bottomSheetHeight =
          _bottomSheetKey.currentContext?.size?.height ?? 0;
      if (_bottomSheetHeight != bottomSheetHeight) {
        _bottomSheetHeight = bottomSheetHeight;
        setState(() {});
      }
    });
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
        title: Text('Forum.Thread'.tr()),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () =>
                  _showPostBottomSheet(context, widget.postDetails)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        child: Padding(
          padding: EdgeInsets.only(
              top: 4,
              left: context.padBody,
              right: context.padBody,
              bottom: _bottomSheetHeight + 4),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _PostDetailsCard(
                        postDetails: widget.postDetails, locale: locale),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Forum.Comments'.tr(),
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              DropdownButton<int>(
                                value: _sortMethodIdx,
                                icon: const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(Icons.sort)),
                                onChanged: (int? newValue) {
                                  if (newValue! != _sortMethodIdx) {
                                    _sortMethodIdx = newValue;
                                    _pagingController.refresh();
                                    setState(() {});
                                  }
                                },
                                items: [
                                  for (var i = 0;
                                      i < _sortMethodStr.length;
                                      ++i)
                                    DropdownMenuItem<int>(
                                      value: i,
                                      child: Text(_sortMethodStr[i]),
                                    )
                                ],
                              )
                            ])),
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
                      replyOnClick: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return UserProfileBuilder(
                                uid: item.uid,
                                builder: (context, profile) => Padding(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: _ReplyForm(
                                      autoFocus: true,
                                      onSubmit: (content, id) {
                                        _handleReplySubmit(content, id);
                                        Navigator.pop(context);
                                      },
                                      refReplyId: item.id,
                                      hintText:
                                          '${'Forum.ReplyTo'.tr()} ${profile.displayName}: ',
                                    )));
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        key: _bottomSheetKey,
        onClosing: () {},
        builder: (BuildContext context) {
          return _ReplyForm(
            onSubmit: _handleReplySubmit,
            refReplyId: -1,
            hintText: 'Forum.CommentHint'.tr(),
          );
        },
      ),
    );
  }
}

class _ReplyForm extends StatefulWidget {
  final void Function(String, int) onSubmit;
  final int refReplyId;
  final String hintText;
  final bool autoFocus;

  const _ReplyForm(
      {Key? key,
      required this.onSubmit,
      required this.refReplyId,
      required this.hintText,
      this.autoFocus = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReplyFormState();
}

class _ReplyFormState extends State<_ReplyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fieldController = TextEditingController();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: Form(
          key: _formKey,
          child: TextFormField(
            autofocus: widget.autoFocus,
            controller: _fieldController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            maxLength: 500,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: widget.hintText,
                suffixIcon: IconButton(
                    onPressed: () {
                      if (_isSubmitting || !_formKey.currentState!.validate())
                        return;
                      setState(() => _isSubmitting = true);
                      widget.onSubmit(_fieldController.text, widget.refReplyId);
                      FocusScope.of(context).unfocus();
                      _fieldController.clear();
                      setState(() => _isSubmitting = false);
                    },
                    icon: const Icon(Icons.send))),
            validator: (v) => v != null && v.isNotEmpty ? null : '',
          ),
        ));
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
    var expansibleContent = ExpandablePanel(
        theme: const ExpandableThemeData(hasIcon: false),
        controller: ExpandableController(initialExpanded: true),
        header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ProfileHeadline(
                uid: postDetails.uid,
                time: postDetails.createTime.toDateTime(),
                topped: postDetails.topped,
                best: postDetails.best,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  postDetails.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ])),
        collapsed: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              postDetails.body,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            )),
        expanded: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  postDetails.body,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
        ));

    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 0),
      padding: const EdgeInsets.symmetric(vertical: 5),
      onLongPress: () => _showPostBottomSheet(context, postDetails),
      child: expansibleContent,
    );
  }
}

class _ReplyCard extends StatelessWidget {
  final Reply reply;
  final String locale;
  final void Function()? replyOnClick;
  final bool inBottomSheet;

  const _ReplyCard(
      {Key? key,
      required this.reply,
      required this.locale,
      required this.replyOnClick,
      this.inBottomSheet = false})
      : super(key: key);

  Future<void> _showReplySheet(BuildContext context, int replyId) async {
    var tracedReply =
        await rpc.forumClient.getReplyById(GetReplyByIdReq(replyId: replyId));
    return showModalBottomSheet<void>(
        builder: (BuildContext context) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Text(
                        'Forum.ReferedComment'.tr(),
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                  _ReplyCard(
                    reply: tracedReply,
                    locale: locale,
                    replyOnClick: null,
                    inBottomSheet: true,
                  )
                ]),
        context: context);
  }

  void _handleOnTap(BuildContext context) {
    if (inBottomSheet) {
      Navigator.of(context).pop();
    }
    _showReplySheet(context, reply.refReplyId);
  }

  @override
  Widget build(BuildContext context) {
    var expansibleContent = ExpandablePanel(
        theme: const ExpandableThemeData(hasIcon: false),
        controller: ExpandableController(initialExpanded: true),
        header: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: ProfileHeadline(
              uid: reply.uid,
              time: reply.createTime.toDateTime(),
              topped: reply.topped,
              sideButton: replyOnClick != null
                  ? IconButton(
                      onPressed: replyOnClick,
                      icon: const Icon(Icons.add_comment_rounded),
                      color: Theme.of(context).hintColor,
                    )
                  : null,
            )),
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: reply.refReplyId == -1
                      ? Text(
                          reply.content,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      : UserProfileBuilder(
                          uid: reply.refUid,
                          builder: (context, profile) => RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  children: [
                                TextSpan(
                                  text: '@${profile.displayName} ',
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _handleOnTap(context),
                                ),
                                TextSpan(
                                  text: reply.content,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _handleOnTap(context),
                                )
                              ])),
                        ))
            ],
          ),
        ));

    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(5),
      onLongPress: () => _showReplyBottomSheet(context, reply),
      child: expansibleContent,
    );
  }
}

Future<void> _showPostBottomSheet(
    BuildContext pageContext, PostDetails postDetails) async {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: pageContext,
      builder: (context) => Wrap(
            children: [
              if (postDetails.uid == store.state.user.campusId)
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: Text('Remove post'.tr()),
                  onTap: () {
                    rpc.forumClient.removePost(
                      UpdatePostReq(postId: postDetails.id),
                    );
                    Navigator.of(context).pop(true);
                    Navigator.of(pageContext).pop(true);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.star_border_rounded),
                title: Text('Add to saved'.tr()),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                title: Text('Copy post title'.tr()),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: postDetails.title));
                  Navigator.of(context).pop(true);
                  showSnackbarMsg(Text('Copied'.tr()), context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                title: Text('Copy post content'.tr()),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: postDetails.body));
                  Navigator.of(context).pop(true);
                  showSnackbarMsg(Text('Copied'.tr()), context);
                },
              ),
            ],
          ));
}

Future<void> _showReplyBottomSheet(
    BuildContext pageContext, Reply reply) async {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: pageContext,
      builder: (context) => Wrap(
            children: [
              if (reply.uid == store.state.user.campusId)
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: Text('Remove reply'.tr()),
                  onTap: () {
                    rpc.forumClient.removeReply(
                      UpdateReplyReq(replyId: reply.id),
                    );
                    Navigator.of(context).pop(true);
                    showSnackbarMsg(Text('Removed'.tr()), context);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.star_border_rounded),
                title: Text('Add to saved'.tr()),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.content_copy),
                title: Text('Copy reply'.tr()),
                onTap: () {
                  Clipboard.setData(ClipboardData(text: reply.content));
                  Navigator.of(context).pop(true);
                  showSnackbarMsg(Text('Copied'.tr()), context);
                },
              ),
            ],
          ));
}
