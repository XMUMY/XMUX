import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmus_client/error.dart';
import 'package:xmus_client/generated/forum_thread.pb.dart';

import '../../../global.dart';
import '../../../util/screen.dart';

class NewThreadPage extends StatefulWidget {
  final int forumId;

  const NewThreadPage({Key? key, required this.forumId}) : super(key: key);

  @override
  _NewThreadPageState createState() => _NewThreadPageState();
}

class _NewThreadPageState extends State<NewThreadPage> {
  var form = CreateThreadReq();
  var formKey = GlobalKey<FormState>();
  var _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (_isSubmitting || !formKey.currentState!.validate()) return;
    _isSubmitting = true;
    try {
      await rpc.forumClient.createThread(form);
      Navigator.of(context).maybePop(true);
    } on XmuxRpcError catch (e) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      _isSubmitting = false;
    }
  }

  @override
  void initState() {
    form.forumId = widget.forumId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formWidgets = <Widget>[
      TextFormField(
        maxLength: 70,
        decoration: InputDecoration(
          labelText: LocaleKeys.Community_CreateTitle.tr(),
        ),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        onChanged: (v) => form.title = v,
        validator: (v) => v != null && v.isNotEmpty ? null : '',
      ),
      const Divider(color: Colors.transparent),
      TextFormField(
        maxLines: 10,
        maxLength: 1000,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        onChanged: (v) => form.body = v,
        validator: (v) => v != null && v.isNotEmpty ? null : '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Community_CreateThreadTitle.tr()),
        actions: <Widget>[
          FloatingActionButton(
            mini: true,
            child: Icon(
              Icons.check,
              color: Theme.of(context).iconTheme.color,
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            onPressed: _handleSubmit,
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: context.padBody,
          ),
          child: Column(
            children: formWidgets,
          ),
        ),
      ),
    );
  }
}
