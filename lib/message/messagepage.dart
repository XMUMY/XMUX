import 'dart:async';
import 'dart:math';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xmux/init.dart';

final auth = FirebaseAuth.instance;
var reference;
FirebaseUser user;

@override
class Message extends StatelessWidget {
  Message({this.snapshot, this.animation});

  final DataSnapshot snapshot;
  final Animation animation;

  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animation, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                  backgroundImage:
                      new NetworkImage(snapshot.value['senderPhotoUrl'])),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(snapshot.value['senderName'],
                      style: Theme.of(context).textTheme.subhead),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: snapshot.value['imageUrl'] != null
                        ? new Image.network(
                            snapshot.value['imageUrl'],
                            width: 250.0,
                          )
                        : new Text(snapshot.value['text']),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagePage extends StatefulWidget {
  @override
  State createState() => new MessagePageState();
}

class MessagePageState extends State<MessagePage> {
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  String email, pass;

  Future<bool> _ensureLoggedIn() async {
    if (email == null) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text("Please Log in !")));
      return false;
    }
    if (await auth.currentUser() == null) {
      user =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      setState(() {
        reference = FirebaseDatabase.instance.reference().child('messages');
      });
      return true;
    }
    reference = FirebaseDatabase.instance.reference().child('messages');
    if (user == null) user = await auth.currentUser();
    return true;
  }

  @override
  Future initState() async {
    email = globalPersonalInfoState.campusId + "@xmu.edu.my";
    pass = globalPersonalInfoState.password;
    user = await auth.signInWithEmailAndPassword(email: email, password: pass);
    await _ensureLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Messages"),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: new Column(children: <Widget>[
          new Flexible(
            child: reference == null
                ? new Container()
                : new FirebaseAnimatedList(
                    query: reference,
                    sort: (a, b) => b.key.compareTo(a.key),
                    padding: new EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return new Message(
                          snapshot: snapshot, animation: animation);
                    },
                  ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ]));
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.photo_camera),
                  onPressed: () async {
                    if (await _ensureLoggedIn()) {
                      File imageFile = await ImagePicker.pickImage();
                      int random = new Random().nextInt(100000);
                      StorageReference ref = FirebaseStorage.instance
                          .ref()
                          .child("image_$random.jpg");
                      StorageUploadTask uploadTask = ref.put(imageFile);
                      Uri downloadUrl = (await uploadTask.future).downloadUrl;
                      _sendMessage(imageUrl: downloadUrl.toString());
                    }
                  }),
            ),
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                        child: new Text("Send"),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )
                    : new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null,
                      )),
          ]),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border:
                      new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }

  Future<Null> _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    if (await _ensureLoggedIn()) _sendMessage(text: text);
  }

  void _sendMessage({String text, String imageUrl}) {
    reference.push().set({
      'text': text,
      'imageUrl': imageUrl,
      'senderName': user.displayName,
      'senderPhotoUrl': user.photoUrl,
    });
  }
}
