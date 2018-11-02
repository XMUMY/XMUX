import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('About', context)),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          CircleAvatar(
            radius: 40.0,
            child: Text('X', style: TextStyle(fontSize: 50.0)),
            backgroundColor: Colors.black,
          ),
          Divider(),
          Text(
            i18n('About/Caption', context),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          Text(
            i18n('About/ContactUs/Detail', context),
            textAlign: TextAlign.center,
          ),
          Divider(),
          RaisedButton(
            onPressed: () => launch('mailto:x@xdea.xyz'),
            child: Text(i18n('About/EMailUs', context)),
            color: Theme.of(context).cardColor,
          ),
          RaisedButton(
            onPressed: () => launch(
                'https://shang.qq.com/wpa/qunwpa?idkey=f07eb500a50900e4b475abc17ceeda9fb648cd7a57110a2710e14cbe6601ec2f'),
            child: Text(i18n('About/JoinQQGroup', context)),
            color: Theme.of(context).cardColor,
          ),
          Divider(),
          Text(
            '© 2017-2018 χ dev | Build: ' + packageInfo.buildNumber,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
