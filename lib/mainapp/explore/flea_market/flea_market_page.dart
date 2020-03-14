import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/api/models/v3_user.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

import 'item_detail_page.dart';
import 'item_edit_page.dart';
import 'model.dart';
import 'search.dart';

class FleaMarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = FirebaseDatabase.instance.reference().child('flea_market');

    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('FleaMarket', context)),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, semanticLabel: 'Search'),
            onPressed: () => showSearch(
                context: context, delegate: MarketSearchDelegate(query)),
          ),
        ],
      ),
      body: FirebaseAnimatedList(
        query: query,
        sort: (a, b) => b.key.compareTo(a.key),
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
  Profile user;

  @override
  void initState() {
    // Get user by UID.
    XmuxApi.instance
        .getProfile(uid: widget.item.from)
        .then((u) => setState(() => user = u.data))
        .catchError(
            (e) => Scaffold.of(context).showSnackBar(
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
              widget.item, user?.name ?? '...', user?.avatar ?? ''))),
      onTapDown: (_) => setState(() => _elevation = 3),
      onTapUp: (_) => setState(() => _elevation = 0),
      onTapCancel: () => setState(() => _elevation = 0),
      child: Card(
        elevation: _elevation,
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        shape: RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  // Build user avatar.
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: user != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(
                                XMUXApi.convertAvatarUrl(
                                    user.avatar, store.state.user.moodleKey)),
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
                                user.displayName,
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
                    padding: const EdgeInsets.all(15),
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
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.item.photos.length,
                  itemBuilder: (_, index) => index == 0
                      ? Padding(
                          padding: const EdgeInsets.all(1),
                          child: Hero(
                            tag: widget.item.key,
                            child: Image.network(widget.item.photos[index]),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(1),
                          child: Image.network(widget.item.photos[index]),
                        ),
                ),
              ),

              // Build title.
              Padding(
                padding: const EdgeInsets.all(8),
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
