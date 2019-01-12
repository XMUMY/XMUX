import 'package:flutter/material.dart';
import 'package:xmux/modules/emgs/emgs.dart';

class EmgsPage extends StatefulWidget {
  @override
  _EmgsPageState createState() => _EmgsPageState();
}

class _EmgsPageState extends State<EmgsPage> {
  EmgsApplicationResult res;

  void _handleUpdate() async {
    res = await getApplicationStatus('', 'CN');
    setState(() {});
  }

  @override
  void initState() {
    _handleUpdate();
    super.initState();
  }

  Widget _buildResultPage() {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        CircleAvatar(
          child: CircularProgressIndicator(
            value: res.percentage,
          ),
        ),
        Text(res.fullName),
        Text(res.applicationStatus),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMGS'),
      ),
      body: res == null ? CircularProgressIndicator() : _buildResultPage(),
    );
  }
}
