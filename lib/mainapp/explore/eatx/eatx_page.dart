import 'package:flutter/material.dart';
import 'package:xmux/translations/translation.dart';

class EatXPage extends StatefulWidget {
  @override
  _EatXPageState createState() => new _EatXPageState();
}

class _EatXPageState extends State<EatXPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("EatX"),
      ),
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _currentIndex != 0,
            child: TickerMode(
              enabled: _currentIndex == 0,
              child: Scaffold(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text(MainLocalizations.of(context).get("Home")),
              icon: Icon(Icons.home),
              backgroundColor: Colors.pinkAccent),
          BottomNavigationBarItem(
            title: Text(MainLocalizations.of(context).get("Home")),
            icon: Icon(Icons.home),
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        onTap: (int index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
