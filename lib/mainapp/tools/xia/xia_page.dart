import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:xmux/config.dart';

class XiAPage extends StatefulWidget {
  final dialogflow = Dialogflow(token: ApiKeyConfig.dialogflowToken);

  @override
  _XiAPageState createState() => _XiAPageState();
}

class _XiAPageState extends State<XiAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XiA"),
      ),
    );
  }
}
