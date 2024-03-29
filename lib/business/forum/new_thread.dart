import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:xmus_client/api/forum_thread.pb.dart';
import 'package:xmus_client/error.dart';

import '../../../global.dart';
import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/breakpoint.dart';

class NewThreadPage extends StatefulWidget {
  final int forumId;

  const NewThreadPage({super.key, required this.forumId});

  @override
  State<NewThreadPage> createState() => _NewThreadPageState();
}

class _NewThreadPageState extends State<NewThreadPage> {
  final _bodyController = TextEditingController();
  var form = CreateThreadReq();
  var formKey = GlobalKey<FormState>();
  var _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (_isSubmitting || !formKey.currentState!.validate()) return;
    _isSubmitting = true;

    switch (form.whichBody()) {
      case CreateThreadReq_Body.plainContent:
        form.plainContent.content = _bodyController.text;
        break;
      case CreateThreadReq_Body.markdownContent:
        form.markdownContent.content = _bodyController.text;
        break;
      default:
        return;
    }

    try {
      await rpc.forumClient.createThread(form);
      if (mounted) Navigator.of(context).maybePop(true);
    } on XmuxRpcError catch (e) {
      if (mounted) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      _isSubmitting = false;
    }
  }

  @override
  void initState() {
    form.forumId = widget.forumId;
    form.ensurePlainContent();
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
        controller: _bodyController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        validator: (v) => v != null && v.isNotEmpty ? null : '',
        onChanged: (v) {
          if (form.hasMarkdownContent()) setState(() {}); // Update preview.
        },
      ),
      SwitchListTile(
        title: Text(LocaleKeys.Community_Markdown.tr()),
        value: form.whichBody() == CreateThreadReq_Body.markdownContent,
        onChanged: (v) => setState(
          () => v ? form.ensureMarkdownContent() : form.ensurePlainContent(),
        ),
      ),
      const Divider(color: Colors.transparent),
      if (form.hasMarkdownContent()) ...[
        Text(
          LocaleKeys.Community_Preview.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Divider(),
        MarkdownBody(
          data: _bodyController.text,
          shrinkWrap: true,
        ),
      ]
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Community_CreateThreadTitle.tr()),
        actions: <Widget>[
          FloatingActionButton(
            mini: true,
            elevation: 0,
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surface,
            onPressed: _handleSubmit,
            child: Icon(
              Icons.check,
              color: Theme.of(context).iconTheme.color,
            ),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: formWidgets,
          ),
        ),
      ),
    );
  }
}
