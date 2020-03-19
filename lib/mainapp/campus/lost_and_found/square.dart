import 'package:flutter/material.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/modules/api/models/v3_lost_and_found.dart';
import 'package:xmux/modules/api/xmux_api.dart';

class LostAndFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lost & Found'),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: LostAndFoundList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed('/Campus/Tools/LostAndFound/New'),
        child: Icon(Icons.add),
      ),
    );
  }
}

class LostAndFoundList extends StatefulWidget {
  @override
  _LostAndFoundListState createState() => _LostAndFoundListState();
}

class _LostAndFoundListState extends State<LostAndFoundList> {
  var refreshableKey = GlobalKey<RefreshableState>();

  @override
  Widget build(BuildContext context) {
    return Refreshable<List<LostAndFoundBrief>>(
      key: refreshableKey,
      onRefresh: () async =>
          (await XmuxApi.instance.lostAndFoundApi.getBriefs()).data,
      builder: (context, list) {
        return ListView.builder(
          itemBuilder: (context, index) {},
        );
      },
    );
  }
}
