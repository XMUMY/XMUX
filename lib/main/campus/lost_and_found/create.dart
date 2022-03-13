import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:xmus_client/error.dart';
import 'package:xmus_client/generated/google/protobuf/timestamp.pb.dart';
import 'package:xmus_client/generated/lost_found.pb.dart';

import '../../../component/date_time_picker.dart';
import '../../../global.dart';
import '../../../util/screen.dart';

part 'create.g.dart';

/// Form for adding lost & found item.
class LostAndFoundForm = _LostAndFoundForm with _$LostAndFoundForm;

abstract class _LostAndFoundForm with Store {
  @observable
  var type = LostAndFoundType.Lost;

  @observable
  var name = '';

  @observable
  var time = DateTime.now();

  @observable
  var location = '';

  @observable
  var description = '';

  @observable
  var contacts = ObservableMap<String, String>();
}

class NewLostAndFoundPage extends StatefulWidget {
  const NewLostAndFoundPage({Key? key}) : super(key: key);

  @override
  _NewLostAndFoundPageState createState() => _NewLostAndFoundPageState();
}

class _NewLostAndFoundPageState extends State<NewLostAndFoundPage> {
  var form = LostAndFoundForm();
  var formKey = GlobalKey<FormState>();
  var _isSubmitting = false;

  Future<void> _handleSubmit() async {
    if (_isSubmitting || !formKey.currentState!.validate()) return;
    _isSubmitting = true;
    try {
      await rpc.lostAndFoundClient.addItem(AddItemReq()
        ..type = form.type
        ..name = form.name
        ..time = Timestamp.fromDateTime(form.time)
        ..location = form.location
        ..description = form.description
        ..contacts.clear()
        ..contacts.addAll(form.contacts));
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
  Widget build(BuildContext context) {
    final formWidgets = <Widget>[
      ListTile(
        title: Text(LocaleKeys.Campus_LaFLOrF.tr()),
        trailing: Observer(
          builder: (context) => DropdownButton<LostAndFoundType>(
            value: form.type,
            items: [
              DropdownMenuItem(
                child: Text(LocaleKeys.Campus_LaFLost.tr()),
                value: LostAndFoundType.Lost,
              ),
              DropdownMenuItem(
                child: Text(LocaleKeys.Campus_LaFFound.tr()),
                value: LostAndFoundType.Found,
              ),
            ],
            onChanged: (v) => form.type = v!,
          ),
        ),
      ),
      Observer(
        builder: (context) => TextFormField(
          decoration: InputDecoration(
            labelText: form.type == LostAndFoundType.Lost
                ? LocaleKeys.Campus_LaFNameLost.tr()
                : LocaleKeys.Campus_LaFNameFound.tr(),
            hintText: LocaleKeys.Campus_LaFNameHint.tr(),
          ),
          maxLength: 25,
          onChanged: (v) => form.name = v,
          validator: (v) => v != null && v.isNotEmpty ? null : '',
        ),
      ),
      Observer(
        builder: (context) => DateTimePicker(
          labelText: LocaleKeys.Campus_LaFTime.tr(),
          date: form.time,
          firstDate: DateTime(2017, 12, 22),
          lastDate: DateTime.now(),
          onDateChanged: (date) => form.time = date,
          onTimeChanged: (time) => form.time = DateTime(
            form.time.year,
            form.time.month,
            form.time.day,
            time.hour,
            time.minute,
          ),
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: LocaleKeys.Campus_LaFLocation.tr(),
          hintText: LocaleKeys.Campus_LaFLocationHint.tr(),
        ),
        maxLength: 30,
        onChanged: (v) => form.location = v,
        validator: (v) => v != null && v.isNotEmpty ? null : '',
      ),
      const Divider(color: Colors.transparent),
      TextFormField(
        maxLines: 4,
        maxLength: 200,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: LocaleKeys.Campus_LaFDescription.tr(),
        ),
        onChanged: (v) => form.description = v,
        validator: (v) => v != null && v.isNotEmpty ? null : '',
      ),
      ListTile(
        title: Text(LocaleKeys.Campus_LaFContacts.tr()),
        trailing: DropdownButton<String>(
          items: ['QQ', 'WeChat', 'Facebook', 'WhatsApp', 'Telegram']
              .map((e) => DropdownMenuItem(child: Text(e), value: e))
              .toList(),
          onChanged: (c) => setState(() => form.contacts[c!] = ''),
        ),
      ),
      for (var contact in form.contacts.keys)
        TextFormField(
          decoration: InputDecoration(labelText: contact),
          maxLength: 30,
          onChanged: (v) => form.contacts[contact] = v,
        ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_LaFNew.tr()),
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
