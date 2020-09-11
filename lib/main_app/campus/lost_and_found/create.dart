import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx/mobx.dart';
import 'package:xmux/components/date_time_picker.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/rpc/clients/google/protobuf/timestamp.pb.dart';
import 'package:xmux/modules/rpc/clients/lost_found.pb.dart';

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
  @override
  _NewLostAndFoundPageState createState() => _NewLostAndFoundPageState();
}

class _NewLostAndFoundPageState extends State<NewLostAndFoundPage> {
  var form = LostAndFoundForm();
  var formKey = GlobalKey<FormState>();

  var _isSubmitting = false;

  void _handleSubmit() async {
    if (!formKey.currentState.validate()) return;
    setState(() => _isSubmitting = true);
    try {
      await rpc.lostAndFoundClient.addItem(AddItemReq()
        ..type = form.type
        ..name = form.name
        ..time = Timestamp.fromDateTime(form.time)
        ..location = form.location
        ..description = form.description
        ..contacts.clear()
        ..contacts.addAll(form.contacts));
      Navigator.of(context).pop(true);
    } catch (e) {
      // TODO: Show error.
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var formWidgets = <Widget>[
      ListTile(
        title: Text(LocaleKeys.Campus_ToolsLFLOrF.tr()),
        trailing: Observer(
          builder: (context) => DropdownButton(
            value: form.type,
            items: [
              DropdownMenuItem(
                child: Text(LocaleKeys.Campus_ToolsLFLost.tr()),
                value: LostAndFoundType.Lost,
              ),
              DropdownMenuItem(
                child: Text(LocaleKeys.Campus_ToolsLFFound.tr()),
                value: LostAndFoundType.Found,
              ),
            ],
            onChanged: (v) => form.type = v,
          ),
        ),
      ),
      Observer(
        builder: (context) => TextFormField(
          decoration: InputDecoration(
            labelText: form.type == LostAndFoundType.Lost
                ? LocaleKeys.Campus_ToolsLFNameLost.tr()
                : LocaleKeys.Campus_ToolsLFNameFound.tr(),
            hintText: LocaleKeys.Campus_ToolsLFNameHint.tr(),
          ),
          maxLength: 25,
          onChanged: (v) => form.name = v,
          validator: (v) => v.isNotEmpty ? null : '',
        ),
      ),
      Observer(
        builder: (context) => DateTimePicker(
          labelText: LocaleKeys.Campus_ToolsLFTime.tr(),
          initialDate: form.time,
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
          labelText: LocaleKeys.Campus_ToolsLFLocation.tr(),
          hintText: LocaleKeys.Campus_ToolsLFLocationHint.tr(),
        ),
        maxLength: 30,
        onChanged: (v) => form.location = v,
        validator: (v) => v.isNotEmpty ? null : '',
      ),
      Divider(color: Colors.transparent),
      TextFormField(
        maxLines: 4,
        maxLength: 200,
        maxLengthEnforced: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: LocaleKeys.Campus_ToolsLFDescription.tr(),
          hintText: 'with mouse and power adaptor',
        ),
        onChanged: (v) => form.description = v,
        validator: (v) => v.isNotEmpty ? null : '',
      ),
      ListTile(
        title: Text(LocaleKeys.Campus_ToolsLFContacts.tr()),
        trailing: DropdownButton(
          items: ['QQ', 'WeChat', 'Facebook', 'WhatsApp', 'Telegram']
              .map((e) => DropdownMenuItem(child: Text(e), value: e))
              .toList(),
          onChanged: (c) => setState(() => form.contacts[c] = ''),
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
        title: Text(LocaleKeys.Campus_ToolsLFNew.tr()),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
        actions: <Widget>[
          AnimatedCrossFade(
            crossFadeState: _isSubmitting
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            firstChild: IconButton(
              icon: Icon(Icons.done),
              onPressed: _handleSubmit,
            ),
            secondChild: SpinKitDoubleBounce(
              color: Theme.of(context).accentColor,
              size: 40,
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: formWidgets,
        ),
      ),
    );
  }
}
