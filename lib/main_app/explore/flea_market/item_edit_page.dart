import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image/image.dart' as Im;
import 'package:image_picker/image_picker.dart';
import 'package:xmux/globals.dart';

import 'model.dart';
import 'picture.dart';

enum ItemEditResult { succeed, failed, deleted }

class ItemEditPage extends StatefulWidget {
  final Item item;

  const ItemEditPage(this.item);

  /// Static method for compressing image using another isolate.
  static List<int> _compressImage(File f) {
    var image = Im.decodeImage(f.readAsBytesSync());
    image = Im.copyResize(image, width: 1080);
    var bytes = Im.encodeJpg(image, quality: 55);
    return bytes;
  }

  @override
  _ItemEditPageState createState() => _ItemEditPageState(item);
}

class _ItemEditPageState extends State<ItemEditPage> {
  final TextEditingController _nameController;
  final TextEditingController _descriptionController;
  final TextEditingController _priceController;

  final _formKey = GlobalKey<FormState>();
  final _priceFormKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Picture> _pictures;
  bool _isProcessing = false;

  _ItemEditPageState(Item item)
      : this._nameController = TextEditingController(text: item?.name ?? null),
        this._descriptionController =
            TextEditingController(text: item?.description ?? null),
        this._priceController = TextEditingController(
            text: item?.price?.value?.toStringAsFixed(2) ?? null),
        this._pictures =
            item?.photos?.map((p) => Picture.network(p))?.toList() ?? [];

  void _handlePictureAdd() async {
    var imageFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    var picture = Picture.file(
      File(imageFile.path),
      onDelete: (p) => setState(() => _pictures.remove(p)),
    );
    setState(() => _pictures.add(picture));
  }

  void _handleSubmit() async {
    // Validate
    if (!_formKey.currentState.validate() ||
        !_priceFormKey.currentState.validate()) return;
    if (_pictures.isEmpty) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(i18n('FleaMarket/Edit/Pictures/EmptyError', context))));
      return;
    }

    // Lock data.
    var name = _nameController.text;
    var description = _descriptionController.text;
    var priceValue = double.parse(_priceController.text);
    var timestamp = DateTime.now();
    setState(() => _isProcessing = true);

    // Upload pictures.
    var storageRef = FirebaseStorage.instance.ref().child(
        '/flea_market/${FirebaseAuth.instance.currentUser.uid.toLowerCase()}-${timestamp.toIso8601String()}');

    // Process picture compression in parallel.
    Future<String> pictureTask(int index) async {
      // Compress image file using another isolate.
      var bytes = await compute<File, List<int>>(
          ItemEditPage._compressImage, _pictures[index].file);
      // Upload & get link.
      var snap = await storageRef.child('$index').putData(bytes).onComplete;
      return await snap.ref.getDownloadURL();
    }

    List<Future<String>> pictureTasks = [];
    for (var i = 0; i < _pictures.length; i++) pictureTasks.add(pictureTask(i));
    List<String> pictureUrls = await Future.wait(pictureTasks);

    // Upload item details.
    var item = Item(
      FirebaseAuth.instance.currentUser.uid.toLowerCase(),
      name,
      description,
      Price(priceValue, 'RM'),
      timestamp,
      pictureUrls,
    ).toJson();
    await FirebaseDatabase.instance
        .reference()
        .child('/flea_market')
        .push()
        .set(item);

    Navigator.of(context).pop(ItemEditResult.succeed);
  }

  void _handleUpdate() async {
    // Validate
    if (!_formKey.currentState.validate() ||
        !_priceFormKey.currentState.validate()) return;

    // Lock data.
    var name = _nameController.text;
    var description = _descriptionController.text;
    var priceValue = double.parse(_priceController.text);
    var timestamp = DateTime.now();
    setState(() => _isProcessing = true);

    // Update item details.
    var item = Item(
      widget.item.from,
      name,
      description,
      Price(priceValue, 'RM'),
      timestamp,
      widget.item.photos,
    ).toJson();
    await FirebaseDatabase.instance
        .reference()
        .child('/flea_market/${widget.item.key}')
        .update(item);

    Navigator.of(context).pop(ItemEditResult.succeed);
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

  String _priceValidator(String p) {
    if (p.isNotEmpty)
      try {
        double.parse(p);
      } catch (e) {
        return '格式不正确，清检查。';
      }
    else
      _priceController.text = '0.00';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(i18n('FleaMarket/Edit', context)),
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          widget.item != null
              ? IconButton(icon: Icon(Icons.delete), onPressed: _handleRemove)
              : Container(),
          _isProcessing
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: SpinKitFadingFour(color: Colors.white, size: 30))
              : IconButton(
                  icon: Icon(Icons.done),
                  onPressed:
                      widget.item == null ? _handleSubmit : _handleUpdate,
                  tooltip: i18n('FleaMarket/Edit/Finish', context),
                ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // Build title & description.
          Card(
            shape: RoundedRectangleBorder(),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: i18n('FleaMarket/Edit/Name', context),
                      ),
                      style: Theme.of(context).textTheme.subtitle1,
                      validator: (s) => s.isEmpty
                          ? i18n('FleaMarket/Edit/MustFill', context)
                          : null,
                    ),
                    Divider(height: 6),
                    TextFormField(
                      controller: _descriptionController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: i18n('FleaMarket/Edit/Description', context),
                      ),
                      style: Theme.of(context).textTheme.subtitle1,
                      maxLines: 5,
                      validator: (s) => s.isEmpty
                          ? i18n('FleaMarket/Edit/MustFill', context)
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Build pictures.
          Card(
            shape: RoundedRectangleBorder(),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          i18n('FleaMarket/Edit/Pictures', context),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed:
                            widget.item == null ? _handlePictureAdd : null,
                        tooltip: i18n('FleaMarket/Edit/Pictures/Add', context),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 110,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemCount: _pictures.length,
                    itemBuilder: (_, index) => _pictures[index],
                  ),
                ),
              ],
            ),
          ),

          // Build pictures.
          Card(
            shape: RoundedRectangleBorder(),
            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Form(
              key: _priceFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                    child: Text(
                      i18n('FleaMarket/Edit/Price', context),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: i18n('FleaMarket/Edit/Price/Value', context),
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                        child: Icon(Icons.attach_money),
                      ),
                    ),
                    validator: _priceValidator,
                  ),
//                  TextFormField(
//                    keyboardType: TextInputType.number,
//                    decoration: InputDecoration(
//                      labelText: '原价',
//                      border: InputBorder.none,
//                      icon: Padding(
//                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
//                        child: Icon(Icons.store),
//                      ),
//                    ),
//                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
