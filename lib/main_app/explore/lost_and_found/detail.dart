import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:xmux/translations/translation.dart';

class LostAndFoundDetailPage extends StatelessWidget {
  final DataSnapshot dataSnapshot;

  LostAndFoundDetailPage(this.dataSnapshot);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:
            new Text(MainLocalizations.of(context).get("lostandfound/details")),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: new Column(
              children: <Widget>[
                new CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      new NetworkImage(dataSnapshot.value['senderPhotoUrl']),
                ),
                new Divider(
                  height: 20,
                  color: Theme.of(context).canvasColor,
                ),
                new Text(
                  dataSnapshot.value['senderName'],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                new Divider(
                  height: 20,
                  color: Theme.of(context).canvasColor,
                ),
                new Card(
                  child: new Padding(
                    padding: const EdgeInsets.all(10),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text(
                              MainLocalizations.of(context)
                                  .get("lostandfound/description"),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        new Divider(),
                        new Text(MainLocalizations.of(context)
                                .get("lostandfound/time") +
                            DateTime.parse(dataSnapshot.value['time'])
                                .toString()
                                .substring(0, 19)),
                        new Text(MainLocalizations.of(context)
                                .get("lostandfound/location") +
                            dataSnapshot.value['location']),
                        new Text(MainLocalizations.of(context)
                                .get("lostandfound/things") +
                            dataSnapshot.value['brief']),
                        Text(
                            'Contact: ${dataSnapshot.value['uid']}@xmu.edu.my'),
                        new Divider(),
                        new Text(dataSnapshot.value['details']),
                      ],
                    ),
                  ),
                ),
                new Divider(
                  height: 20,
                  color: Theme.of(context).canvasColor,
                ),
                dataSnapshot.value['uid'] ==
                        FirebaseAuth.instance.currentUser.uid
                    ? new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                            color: Theme.of(context).canvasColor,
                            onPressed: () {
                              Navigator.pop(context);
                              FirebaseDatabase.instance
                                  .reference()
                                  .child('lostandfound')
                                  .child(dataSnapshot.key)
                                  .remove();
                            },
                            child: new Text(
                              MainLocalizations.of(context)
                                  .get("lostandfound/delete"),
                              style: Theme.of(context)
                                  .textTheme
                                  .button
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        ],
                      )
                    : new Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
