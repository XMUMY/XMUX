import 'package:flutter/material.dart';

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
        title: Text("敬请期待"),
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
          Offstage(
            offstage: _currentIndex != 1,
            child: TickerMode(
              enabled: _currentIndex == 1,
              child: Scaffold(),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: TickerMode(
              enabled: _currentIndex == 2,
              child: Scaffold(),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: TickerMode(
              enabled: _currentIndex == 3,
              child: Scaffold(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              title: Text("首页"),
              icon: Icon(Icons.home),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
            title: Text("餐厅"),
            icon: Icon(Icons.restaurant),
          ),
          BottomNavigationBarItem(
            title: Text("点评"),
            icon: Icon(Icons.comment),
          ),
          BottomNavigationBarItem(
            title: Text("我"),
            icon: Icon(Icons.person),
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
