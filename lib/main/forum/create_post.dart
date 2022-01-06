import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmus_client/generated/post.pb.dart';

import '../../../global.dart';
import '../../../util/screen.dart';

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
