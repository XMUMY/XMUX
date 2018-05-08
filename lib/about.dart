import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
              MainLocalizations.of(context).get("About/Caption"),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            Text(
              "If you have any questions or suggesstions please contact us.\n Email: x@xdea.xyz\nQQ Group: 585779547",
              textAlign: TextAlign.center,
            ),
            Divider(),
            RaisedButton(
              onPressed: () => launch(
                    "mailto:x@xdea.xyz",
                  ),
              child: Text("Mail to us"),
              color: Theme.of(context).cardColor,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            RaisedButton(
              onPressed: () => launch(
                    "https://shang.qq.com/wpa/qunwpa?idkey=f07eb500a50900e4b475abc17ceeda9fb648cd7a57110a2710e14cbe6601ec2f",
                  ),
              child: Text("Join QQ Group"),
              color: Theme.of(context).cardColor,
            ),
            Divider(),
            Text(
              "© 2017-2018 X Dev",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
