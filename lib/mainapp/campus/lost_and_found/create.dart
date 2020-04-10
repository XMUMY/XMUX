import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmux/components/date_time_picker.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class NewLostAndFoundPage extends StatefulWidget {
  @override
  _NewLostAndFoundPageState createState() => _NewLostAndFoundPageState();
}

class _NewLostAndFoundPageState extends State<NewLostAndFoundPage> {
  var form = NewLostAndFoundReq();
  var formKey = GlobalKey<FormState>();

  var _isSubmitting = false;

  void _handleSubmit() async {
    if (!formKey.currentState.validate()) return;
    setState(() => _isSubmitting = true);
    try {
      await XmuxApi.instance.lostAndFoundApi.add(form);
      Navigator.of(context).pop(true);
    } catch (_) {
      // TODO: Show error.
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var formWidgets = <Widget>[
      ListTile(
        title: Text(S.of(context).Campus_ToolsLFLOrF),
        trailing: Observer(
          builder: (context) => DropdownButton(
            value: form.type,
            items: [
              DropdownMenuItem(
                child: Text(S.of(context).Campus_ToolsLFLost),
                value: LostAndFoundType.lost,
              ),
              DropdownMenuItem(
                child: Text(S.of(context).Campus_ToolsLFFound),
                value: LostAndFoundType.found,
              ),
            ],
            onChanged: (v) => setState(() => form.type = v),
          ),
        ),
      ),
      Observer(
        builder: (context) => TextFormField(
          decoration: InputDecoration(
            labelText: form.type == LostAndFoundType.lost
                ? S.of(context).Campus_ToolsLFNameLost
                : S.of(context).Campus_ToolsLFNameFound,
            hintText: S.of(context).Campus_ToolsLFNameHint,
          ),
          maxLength: 25,
          onChanged: (v) => form.name = v,
          validator: (v) => v.isNotEmpty ? null : '',
        ),
      ),
      Observer(
        builder: (context) => DateTimePicker(
          labelText: S.of(context).Campus_ToolsLFTime,
          initialDate: form.timestamp,
          firstDate: DateTime(2017, 12, 22),
          lastDate: DateTime.now(),
          onDateChanged: (date) => setState(() => form.timestamp = date),
          onTimeChanged: (time) => form.timestamp = DateTime(
            form.timestamp.year,
            form.timestamp.month,
            form.timestamp.day,
            time.hour,
            time.minute,
          ),
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: S.of(context).Campus_ToolsLFLocation,
          hintText: S.of(context).Campus_ToolsLFLocationHint,
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
          labelText: S.of(context).Campus_ToolsLFDescription,
          hintText: 'with mouse and power adaptor',
        ),
        onChanged: (v) => form.description = v,
        validator: (v) => v.isNotEmpty ? null : '',
      ),
      ListTile(
        title: Text(S.of(context).Campus_ToolsLFContacts),
        trailing: DropdownButton(
          items: ['QQ', 'WeChat', 'Facebook', 'WhatsApp', 'Telegram']
              .map((e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ))
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
        title: Text(S.of(context).Campus_ToolsLFNew),
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
