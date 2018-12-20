import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

import 'item_detail_page.dart';
import 'item_edit_page.dart';
import 'model.dart';

class FleaMarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('FleaMarket', context)),
        backgroundColor: Colors.deepOrange,
      ),
      body: FirebaseAnimatedList(
        query: FirebaseDatabase.instance.reference().child('flea_market'),
        itemBuilder: (ctx, _, __, index) => ItemCard(Item.fromSnapshot(_)),
        defaultChild: Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ItemEditPage(null))),
        tooltip: i18n('FleaMarket/New', context),
      ),
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
  /// Float the card on tap.
  var _elevation = 0.0;

  /// User to get name and avatar.
  User user;

  @override
  void initState() {
    // Get user by UID.
    xmuxApi
        .getUser(widget.item.from)
        .then((u) => setState(() => user = u.data))
        .catchError(
            (DioError e) => Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(e.response.data['error']))),
            test: (e) => e is DioError)
        .catchError(
          (e) => Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(e.toString()))),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ItemDetailPage(
              widget.item, user?.name ?? '...', user?.photoUrl ?? ''))),
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
                  // Build user avatar.
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: user != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                xmuxApi.convertAvatarUrl(user.photoUrl,
                                    store.state.authState.moodleKey)),
                          )
                        : SpinKitPulse(color: Colors.white),
                  ),

                  // Build user name and timestamp.
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        user != null
                            ? Text(
                                user.name,
                                style: Theme.of(context).textTheme.subhead,
                              )
                            : Text('...'),
                        Text(
                          '${DateFormat.Md(Localizations.localeOf(context).languageCode).format(widget.item.timestamp)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(widget.item.timestamp)}',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),

                  // Build price.
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${widget.item.price.currencies} ${widget.item.price.value.toStringAsFixed(2)}',
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.red),
                    ),
                  ),
                ],
              ),

              // Build slidable photos.
              Container(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.item.photos.length,
                  itemBuilder: (_, index) => index == 0
                      ? Hero(
                          tag: widget.item.key,
                          child: Image.network(widget.item.photos[index]),
                        )
                      : Image.network(widget.item.photos[index]),
                ),
              ),

              // Build title.
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
