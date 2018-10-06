import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/translations/translation.dart';

class ChangePersonalInfoPage extends StatelessWidget {
  final _displayNameController =
      TextEditingController(text: firebaseUser?.displayName ?? "User");

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
              MainLocalizations.of(context).get("Settings/ChangePersonalInfo")),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                if (_displayNameController.text.isNotEmpty) {
                  FirebaseAuth.instance.updateProfile(UserUpdateInfo()
                    ..displayName = _displayNameController.text);
                  Navigator.of(context).pop();
                } else
                  Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                MainLocalizations.of(context)
                    .get("Settings/ChangePersonalInfo/Caption"),
                style: Theme.of(context).textTheme.caption,
              ),
              TextField(
                controller: _displayNameController,
                decoration: InputDecoration(
                    hintText: MainLocalizations.of(context)
                        .get("Settings/ChangePersonalInfo/Input")),
                onSubmitted: (t) {
                  if (t.isNotEmpty) {
                    FirebaseAuth.instance
                        .updateProfile(UserUpdateInfo()..displayName = t);
                    Navigator.of(context).pop();
                  } else
                    Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
}
