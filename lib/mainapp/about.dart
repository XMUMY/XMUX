import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/config.dart';
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
            child: Text(
              'χ',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline5.copyWith(fontSize: 60),
            ),
          ),
          Divider(height: 25, color: Colors.transparent),
          Text(
            i18n('About/Caption', context),
            textAlign: TextAlign.center,
          ),
          Divider(),
          Text(
            """
XMUX is Developed by χ Team and maintenanced by XMUM Student Council. Feel free to contact us if you are interested in contributing to this project.
XMUX client is an open source project licenced by GPLv3. The code can be found at github.com/XMUMY/XMUX""",
            textAlign: TextAlign.center,
          ),
          Divider(color: Colors.transparent),
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
            '© 2017-2020 XMUX Project.\n'
            'Ver: ${packageInfo.version} | ${packageInfo.buildNumber}',
            textAlign: TextAlign.center,
          ),
          if (int.parse(packageInfo.buildNumber) <
              firebase.remoteConfigs.versions.latestBuildReleased)
            Text.rich(
              TextSpan(
                text:
                    'New version available: ${firebase.remoteConfigs.versions.latestVersionReleased}\n'
                    'Tap to upgrade.',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => launch('${BackendApiConfig.websiteAddress}'),
              ),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Theme.of(context).errorColor),
            )
        ],
      ),
    );
  }
}
