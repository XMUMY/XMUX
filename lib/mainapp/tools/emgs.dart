import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/emgs/emgs.dart';
import 'package:xmux/redux/redux.dart';

class EmgsPage extends StatefulWidget {
  @override
  _EmgsPageState createState() => _EmgsPageState();
}

class _EmgsPageState extends State<EmgsPage> {
  EmgsApplicationResult res;

  void _handleUpdate() async {
    if (store.state.acState.info == null) {
      var updateInfoAction = UpdateInfoAction();
      store.dispatch(updateInfoAction);
      await updateInfoAction.listener;
      return;
    }
    res = await getApplicationStatus(store.state.acState.info.idNumber, 'CN');
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
        Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Text(
              '${res.percentage.toInt()}%',
              style: TextStyle(fontSize: 40.0),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: CircularProgressIndicator(
                value: res.percentage,
              ),
            ),
          ],
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Name: ${res.fullName}\n'
                  'Application No.: ${res.applicationNumber}\n'
                  'Type: ${res.applicationType}\n'
                  'Status: ${res.applicationStatus}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Tools/Emgs', context)),
      ),
      body: res == null
          ? Center(child: CircularProgressIndicator())
          : _buildResultPage(),
    );
  }
}
