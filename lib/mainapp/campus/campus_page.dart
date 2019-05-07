import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/redux.dart';

class CampusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: StoreConnector<MainAppState, VoidCallback>(
          converter: (store) => () => store.dispatch(OpenDrawerAction(true)),
          builder: (context, callback) =>
              IconButton(icon: Icon(Icons.view_list), onPressed: callback),
        ),
        title: Text(i18n('Campus', context)),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text(
                ' ' + i18n('Campus/AcademicTools', context),
                style: Theme.of(context).textTheme.title,
              ),
            ),
            FlatButton(
              child: Text(i18n('Campus/More', context)),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/Campus/ACTools/Details'),
            ),
          ]),
          Divider(
            height: 3.0,
          ),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: <Widget>[
              _ToolsButton(
                  icon: 'res/academic/wolfram.svg',
                  title: 'Campus/AcademicTools/WolframEngine/Title',
                  path: '/Campus/ACTools/WolframEngine'),
              _ToolsButton(
                  icon: 'res/academic/geogebra.svg',
                  title: 'Campus/AcademicTools/GeoGebra/Title',
                  path: '/Campus/ACTools/GeoGebra'),
              _ToolsButton(
                  icon: 'res/academic/gpa.svg',
                  title: 'Campus/AcademicTools/ExamResult/Title',
                  path: '/Campus/ACTools/ExamResult'),
              _ToolsButton(
                  icon: 'res/academic/vpn.svg',
                  title: 'Campus/AcademicTools/VPN/Title',
                  path: '/Campus/ACTools/VPN'),
            ],
          ),
          Row(children: <Widget>[
            Expanded(
              child: Text(
                ' ' + i18n('Campus/Tools', context),
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ]),
          Wrap(
            alignment: WrapAlignment.spaceAround,
            children: <Widget>[
              _ToolsButton(
                  icon: 'res/academic/ecr.svg',
                  title: 'Campus/Tools/BusSchedule',
                  path: '/Campus/Tools/BusSchedule'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ToolsButton extends StatelessWidget {
  /// The asset name of *SVG* file of icon.
  /// The asset name also used as tag for hero animation.
  final String icon;

  /// Title for tooltip.
  final String title;

  /// Path for `Navigator`.
  final String path;

  _ToolsButton(
      {Key key, @required this.icon, @required this.title, @required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Hero(tag: icon, child: SvgPicture.asset(icon)),
        onPressed: () => Navigator.of(context).pushNamed(path),
        tooltip: i18n(title, context),
        iconSize: MediaQuery.of(context).size.width / 6,
      );
}
