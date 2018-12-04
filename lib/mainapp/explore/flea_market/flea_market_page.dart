import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

import 'model.dart';

class FleaMarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flea Market'),
      ),
      body: FirebaseAnimatedList(
          query: FirebaseDatabase.instance.reference().child('flea_market'),
          itemBuilder: (ctx, _, __, index) =>
              ItemCard(Item.fromJson(Map<String, dynamic>.from(_.value)))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}

class ItemCard extends StatefulWidget {
  final Item item;

  ItemCard(this.item);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  var _elevation = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _elevation = 3.0),
      onTapUp: (_) => setState(() => _elevation = 0.0),
      onTapCancel: () => setState(() => _elevation = 0.0),
      child: Card(
        elevation: _elevation,
        margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        shape: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.ac_unit,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FutureBuilder<XMUXApiResponse<User>>(
                          future: xmuxApi.getUser(widget.item.from),
                          builder: (_, snap) => snap.hasData
                              ? Text(
                                  snap.data.data.name,
                                  style: Theme.of(context).textTheme.subhead,
                                )
                              : Text('Loading'),
                        ),
                        Text(
                          '${DateFormat.Md(Localizations.localeOf(context).languageCode).format(widget.item.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(widget.item.timestamp)}',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'RM120',
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Image.network(
                widget.item.mainPicture,
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.item.name,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
