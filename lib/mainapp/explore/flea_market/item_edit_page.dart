import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xmux/globals.dart';

import 'model.dart';
import 'picture.dart';

enum ItemEditResult { succeed, failed, deleted }

class ItemEditPage extends StatefulWidget {
  final Item item;

  const ItemEditPage(this.item);

  @override
  _ItemEditPageState createState() => _ItemEditPageState(item);
}

class _ItemEditPageState extends State<ItemEditPage> {
  final TextEditingController _nameController;
  final TextEditingController _descriptionController;

  List<Picture> _pictures;

  _ItemEditPageState(Item item)
      : this._nameController = TextEditingController(text: item?.name ?? null),
        this._descriptionController =
            TextEditingController(text: item?.description ?? null),
        this._pictures =
            item?.photos?.map((p) => Picture.network(p))?.toList() ?? [];

  void _handlePictureAdd() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    var picture = Picture.file(
      imageFile,
      onDelete: (p) {
        _pictures.remove(p);
        setState(() => _pictures = List.from(_pictures));
      },
    );
    setState(() => _pictures += [picture]);
  }

  void _handleSubmit() async {
    var timestamp = DateTime.now();
    List<String> pictureUrls = [];

    var storageRef = FirebaseStorage.instance.ref().child(
        '/flea_market/${firebaseUser.uid.toLowerCase()}-${timestamp.toIso8601String()}');
    for (var i = 0; i < _pictures.length; i++) {
      var snap =
          await storageRef.child('$i').putFile(_pictures[i].file).onComplete;
      pictureUrls.add(await snap.ref.getDownloadURL());
    }

    var item = Item(
      widget.item?.from ?? firebaseUser.uid.toLowerCase(),
      _nameController.text,
      _descriptionController.text,
      timestamp,
      pictureUrls,
    ).toJson();

    await FirebaseDatabase.instance
        .reference()
        .child('/flea_market')
        .push()
        .set(item);

    Navigator.of(context).pop();
  }

  void _handleRemove() async {
    var storageRef = FirebaseStorage.instance.ref().child(
        '/flea_market/${widget.item.from}-${widget.item.timestamp.toIso8601String()}');
    for (var i = 0; i < _pictures.length; i++) storageRef.child('$i').delete();

    await FirebaseDatabase.instance
        .reference()
        .child('/flea_market/${widget.item.key}')
        .remove();
    Navigator.of(context).pop(ItemEditResult.deleted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item edit'),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          widget.item != null
              ? IconButton(icon: Icon(Icons.delete), onPressed: _handleRemove)
              : Container(),
          IconButton(icon: Icon(Icons.done), onPressed: _handleSubmit),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // Build title & description.
          Card(
            shape: RoundedRectangleBorder(),
            margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '标题',
                    ),
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Divider(height: 6.0),
                  TextFormField(
                    controller: _descriptionController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '描述一下宝贝转手的原因',
                    ),
                    style: Theme.of(context).textTheme.body1,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),

          // Build pictures.
          Card(
            shape: RoundedRectangleBorder(),
            margin: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Pictures',
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.add), onPressed: _handlePictureAdd)
                    ],
                  ),
                ),
                Container(
                  height: 110.0,
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    scrollDirection: Axis.horizontal,
                    children: _pictures,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
