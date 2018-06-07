import 'package:flutter/material.dart';
import 'package:xmux/config.dart';
import 'package:xmux/translations/translation.dart';

class WolframResult extends StatelessWidget {
  final String inputString;

  WolframResult(this.inputString);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations
              .of(context)
              .get("Academic/Tools/WolframEngine/Result")),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(1.0),
          children: <Widget>[
            Stack(
              children: <Widget>[
                LinearProgressIndicator(),
                Image.network(
                    "http://api.wolframalpha.com/v1/simple?appid=${WolframConfig.appID}&i=${Uri.encodeComponent(inputString)}&fontsize=18&width=${MediaQuery.of(context).size.width}"),
              ],
            )
          ],
        ),
      );
}
