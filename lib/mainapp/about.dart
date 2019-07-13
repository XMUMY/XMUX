import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(i18n('About', context))),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Hero(
            tag: 'χLogo',
            child: CircleAvatar(
              radius: 40,
              child: Text('X', style: TextStyle(fontSize: 50)),
              backgroundColor: Colors.black,
            ),
          ),
          Divider(height: 10, color: Colors.transparent),
          Text(
            i18n('About/Caption', context),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Text(
            """
Developed by χ Team.
Maintenance by XMUM Student Council.
XMUX app is an open source project licenced by GPLv3.""",
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(5)),
          Text(
            i18n('About/ContactUs/Detail', context),
            textAlign: TextAlign.center,
          ),
          Divider(),
          RaisedButton(
            onPressed: () => launch('mailto:x@xdea.xyz'),
            child: Text(i18n('About/EMailUs', context)),
          ),
          RaisedButton(
            onPressed: () => launch(
                'https://shang.qq.com/wpa/qunwpa?idkey=f07eb500a50900e4b475abc17ceeda9fb648cd7a57110a2710e14cbe6601ec2f'),
            child: Text(i18n('About/JoinQQGroup', context)),
          ),
          Divider(),
          Text(
            '© 2017-2018 χ dev | Build: ${packageInfo.buildNumber}',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
