import 'package:flutter/material.dart';

class ItemEditPage extends StatefulWidget {
  @override
  _ItemEditPageState createState() => _ItemEditPageState();
}

class _ItemEditPageState extends State<ItemEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
