import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xmux/components/date_time_picker.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/modules/api/models/v3_lost_and_found.dart';

class NewLostAndFoundPage extends StatefulWidget {
  @override
  _NewLostAndFoundPageState createState() => _NewLostAndFoundPageState();
}

class _NewLostAndFoundPageState extends State<NewLostAndFoundPage> {
  var form = NewLostAndFoundReq();
  var formKey = GlobalKey<FormState>();

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
            labelText: S.of(context).Campus_ToolsLFName,
            hintText: S.of(context).Campus_ToolsLFNameHint,
          ),
          maxLength: 25,
          onChanged: (v) => setState(() => form.name = v),
        ),
      ),
      Observer(
        builder: (context) => DateTimePicker(
          labelText: S.of(context).Campus_ToolsLFTime,
          initialDate: form.timestamp,
          firstDate: DateTime(2017, 12, 22),
          lastDate: DateTime.now(),
          onDateChanged: (date) => setState(() => form.timestamp = date),
        ),
      ),
      Observer(
        builder: (context) => TextFormField(
          decoration: InputDecoration(
            labelText: S.of(context).Campus_ToolsLFLocation,
            hintText: S.of(context).Campus_ToolsLFLocationHint,
          ),
          maxLength: 30,
          onChanged: (v) => setState(() => form.name = v),
        ),
      ),
      Divider(color: Colors.transparent),
      TextFormField(
        maxLines: 4,
        maxLength: 200,
        maxLengthEnforced: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: S.of(context).Campus_ToolsLFDescription,
          hintText: '',
        ),
        onChanged: (v) => form.description = v,
        validator: (v) => v.isNotEmpty ? null : 'Err',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Campus_ToolsLFNew),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {},
          )
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
