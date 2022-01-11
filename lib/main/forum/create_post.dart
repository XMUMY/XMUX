import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmus_client/generated/post.pb.dart';

import '../../../global.dart';
import '../../../util/screen.dart';
import 'forum_page.dart';

class _PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  _PersistentHeaderDelegate(this.minHeight, this.maxHeight, this.child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_PersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _GroupItemDelegate extends SliverChildDelegate {
  final List<String> _itemList;

  _GroupItemDelegate(this._itemList);

  @override
  Widget? build(BuildContext context, int index) {
    if (index < _itemList.length) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 100,
          child: Text(groupNameDecorationUtil(_itemList[index])),
        ),
        Divider()
      ]);
    } else {
      return null;
    }
  }

  @override
  int get estimatedChildCount => _itemList.length;

  @override
  bool shouldRebuild(_GroupItemDelegate oldDelegate) {
    return _itemList != oldDelegate._itemList;
  }
}

class SelectGroupPage extends StatefulWidget {
  const SelectGroupPage({Key? key}) : super(key: key);

  @override
  _SelectGroupPageState createState() => _SelectGroupPageState();
}

class _SelectGroupPageState extends State<SelectGroupPage> {
  var groups = <String>[
    'For yourself',
    'For me',
    'Everybody laugh',
    'haha',
    'nice',
    'lala',
    'lololol',
    '1',
    '2'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post to'.tr()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_next),
            // TODO: ADD action
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true,
              delegate: _PersistentHeaderDelegate(
                  60,
                  60,
                  Material(
                      elevation: 3,
                      child: Container(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 4, bottom: 4),
                          color: Theme.of(context).canvasColor,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Search for groups'.tr(),
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.search))),
                          ))))),
          SliverList(
            delegate: _GroupItemDelegate(groups),
          )
        ],
      ),
    );
  }
}

class PostForm {
  var title = '';
  var body = '';
  var groupId = 1;
}

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  var form = PostForm();
  var formKey = GlobalKey<FormState>();
  var _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (_isSubmitting || !formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);
    try {
      await rpc.forumClient.createPost(CreatePostReq(
          title: form.title, body: form.body, groupId: form.groupId));
      Navigator.of(context).maybePop(true);
    } catch (e) {
      // TODO: Show error.
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formWidgets = <Widget>[
      TextFormField(
        decoration: InputDecoration(labelText: 'Title'.tr()),
        maxLength: 70,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        onChanged: (v) => form.title = v,
        validator: (v) => v != null && v.isNotEmpty ? null : '',
      ),
      const Divider(color: Colors.transparent),
      TextFormField(
        maxLines: 10,
        maxLength: 1000,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Post body'.tr(),
        ),
        onChanged: (v) => form.body = v,
        validator: (v) => v != null && v.isNotEmpty ? null : '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('New post'.tr()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: _handleSubmit,
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: context.padBody,
          ),
          children: formWidgets,
        ),
      ),
    );
  }
}
