import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'flea_market_page.dart';
import 'model.dart';

class MarketSearchDelegate extends SearchDelegate<int> {
  final DatabaseReference _reference;

  MarketSearchDelegate(this._reference);

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    final searched =
        _reference.orderByChild('name').startAt(query).endAt(query + '\uf8ff');

    return FirebaseAnimatedList(
      query: searched,
      sort: (a, b) => b.key.compareTo(a.key),
      itemBuilder: (ctx, _, __, index) => ItemCard(Item.fromSnapshot(_)),
      defaultChild: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : Container(),
    ];
  }
}
