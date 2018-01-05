import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translations/translation.dart';

class LostAndFoundCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LostAndFoundCreatePageState();
}

class _LostAndFoundCreatePageState extends State<LostAndFoundCreatePage> {
  bool _isLost = true;
  DateTime _date = new DateTime.now();
  TimeOfDay _timeOfDay = new TimeOfDay(
      hour: new DateTime.now().hour, minute: new DateTime.now().minute);

  final TextEditingController _briefLocationCtrler =
      new TextEditingController();
  final TextEditingController _thingsCtrler = new TextEditingController();
  final TextEditingController _locationCtrler = new TextEditingController();
  final TextEditingController _detailCtrler = new TextEditingController();

  Future _handleSubmission(BuildContext context) async {
    if (_briefLocationCtrler.text.isEmpty || _thingsCtrler.text.isEmpty) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text("Format Error.")));
      return;
    }
    Navigator.pop(context);
    FirebaseDatabase.instance.reference().child('lostandfound').push().set({
      'uid': firebaseUser.uid,
      'senderName': firebaseUser.displayName,
      'senderPhotoUrl': firebaseUser.photoUrl,
      'time': new DateTime(_date.year, _date.month, _date.day, _timeOfDay.hour,
              _timeOfDay.minute)
          .toIso8601String(),
      'location_brief': _briefLocationCtrler.text,
      'location': _locationCtrler.text,
      'brief': _thingsCtrler.text,
      'details': _detailCtrler.text,
      'isLost': _isLost,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:
            new Text(MainLocalizations.of(context).get("lostandfound/create")),
        actions: <Widget>[
          new Builder(builder: (BuildContext context) {
            return new IconButton(
                icon: new Icon(Icons.done),
                onPressed: () {
                  _handleSubmission(context);
                });
          }),
        ],
      ),
      body: new ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          new ListTile(
            title: new Text(MainLocalizations
                .of(context)
                .get("lostandfound/create/lostorfound")),
            trailing: new DropdownButton<bool>(
              value: _isLost,
              onChanged: (bool newValue) {
                setState(() {
                  _isLost = newValue;
                });
              },
              items: [
                MainLocalizations.of(context).get("lostandfound/lost"),
                MainLocalizations.of(context).get("lostandfound/found")
              ].map((String value) {
                return new DropdownMenuItem<bool>(
                  value: value ==
                          MainLocalizations.of(context).get("lostandfound/lost")
                      ? true
                      : false,
                  child: new Text(value),
                );
              }).toList(),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new TextField(
                  controller: _briefLocationCtrler,
                  maxLength: 20,
                  decoration: new InputDecoration(
                    labelText: MainLocalizations
                        .of(context)
                        .get("lostandfound/create/brieflocation"),
                  ),
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
              const SizedBox(width: 12.0),
              new Expanded(
                flex: 1,
                child: new TextField(
                  controller: _thingsCtrler,
                  maxLength: 15,
                  decoration: new InputDecoration(
                    labelText: MainLocalizations
                        .of(context)
                        .get("lostandfound/create/things"),
                  ),
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ],
          ),
          new _DateTimePicker(
            labelText:
                MainLocalizations.of(context).get("lostandfound/create/time"),
            selectedDate: _date,
            selectedTime: _timeOfDay,
            selectDate: (DateTime date) {
              setState(() {
                _date = date;
              });
            },
            selectTime: (TimeOfDay time) {
              setState(() {
                _timeOfDay = time;
              });
            },
          ),
          new TextField(
            controller: _locationCtrler,
            decoration: new InputDecoration(
              labelText: MainLocalizations
                  .of(context)
                  .get("lostandfound/create/location"),
            ),
            style: Theme.of(context).textTheme.body1,
          ),
          new TextField(
            controller: _detailCtrler,
            maxLines: 5,
            decoration: new InputDecoration(
              labelText: MainLocalizations
                  .of(context)
                  .get("lostandfound/create/detail"),
            ),
            style: Theme.of(context).textTheme.body1,
          ),
          new Divider(
            height: 10.0,
            color: Theme.of(context).canvasColor,
          ),
        ],
      ),
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}

class _DateTimePicker extends StatelessWidget {
  const _DateTimePicker(
      {Key key,
      this.labelText,
      this.selectedDate,
      this.selectedTime,
      this.selectDate,
      this.selectTime})
      : super(key: key);

  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;
  final ValueChanged<TimeOfDay> selectTime;

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: new DateTime(2015, 9),
        lastDate: new DateTime.now());
    if (picked != null && picked != selectedDate) selectDate(picked);
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) selectTime(picked);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.subhead;
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: new _InputDropdown(
            labelText: labelText,
            valueText: new DateFormat.yMMMd(
                    Localizations.localeOf(context).languageCode)
                .format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
        new Expanded(
          flex: 3,
          child: new _InputDropdown(
            valueText: selectedTime.format(context),
            valueStyle: valueStyle,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),
      ],
    );
  }
}
