import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'model.dart';

class ItemEditPage extends StatefulWidget {
  final Item item;

  const ItemEditPage(this.item);

  @override
  _ItemEditPageState createState() => _ItemEditPageState(item);
}

class _ItemEditPageState extends State<ItemEditPage> {
  final TextEditingController _nameController;
  final TextEditingController _descriptionController;

  List<Image> _pictures;

  _ItemEditPageState(Item item)
      : this._nameController = TextEditingController(text: item?.name ?? null),
        this._descriptionController =
            TextEditingController(text: item?.description ?? null),
        this._pictures =
            item?.photos?.map((p) => Image.network(p))?.toList() ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item edit'),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          widget.item != null
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await FirebaseDatabase.instance
                        .reference()
                        .child('/flea_market/${widget.item.key}')
                        .remove();
                    Navigator.of(context).pop();
                  })
              : Container(),
          IconButton(icon: Icon(Icons.done), onPressed: () {}),
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
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          var image = await ImagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            _pictures += [Image.file(image)];
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  height: 110.0,
                  child: ListView(
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
