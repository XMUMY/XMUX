import 'package:flutter/material.dart';
import 'package:xmux/translations/translation.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("About")),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: ListView(
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              child: Text(
                "X",
                style: TextStyle(fontSize: 50.0),
              ),
              backgroundColor: Colors.black,
            ),
            Divider(),
            Text(
              "XMUX is a powerful app for everyone in XMUM.\nIf you have any questions or suggesstions please contact us.\n Email:x@xdea.xyz\nQQ Group:585779547",
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
}
