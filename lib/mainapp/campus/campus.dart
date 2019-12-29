import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
        children: <Widget>[
          Text(
            ' ' + i18n('Campus/AcademicTools', context),
            style: Theme.of(context).textTheme.title,
          ),
          Divider(height: 3),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: <Widget>[
              _ToolButton(
                  svg: 'res/campus/wolfram.svg',
                  title: 'Campus/AcademicTools/WolframEngine/Title',
                  path: '/Campus/ACTools/WolframEngine'),
              _ToolButton(
                  svg: 'res/campus/geogebra.svg',
                  title: 'Campus/AcademicTools/GeoGebra/Title',
                  path: '/Campus/ACTools/GeoGebra'),
              if (store.state.user.isStudent)
                _ToolButton(
                    svg: 'res/campus/gpa.svg',
                    title: 'Campus/AcademicTools/ExamResult/Title',
                    path: '/Campus/ACTools/ExamResult'),
              if (store.state.user.isStudent)
                _ToolButton(
                    svg: 'res/campus/gpa_calculator.svg',
                    title: 'Campus/AcademicTools/GPACalculator/Title',
                    path: '/Campus/ACTools/GPACalculator'),
              if (!kIsWeb && !Platform.isIOS)
                _ToolButton(
                    svg: 'res/campus/vpn.svg',
                    title: 'Campus/AcademicTools/VPN/Title',
                    path: '/Campus/ACTools/VPN'),
              if (store.state.settingState.enableFunctionsUnderDev &&
                  store.state.user.isStudent)
                _ToolButton(
                  svg: 'res/campus/ecr.svg',
                  title: 'Campus/AcademicTools/ECR/Title',
                  path: '/Campus/ACTools/ECR',
                ),
            ],
          ),
          Text(
            ' ' + i18n('Campus/Tools', context),
            style: Theme.of(context).textTheme.title,
          ),
          Divider(),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: <Widget>[
              _ToolButton(
                  child: Icon(Icons.directions_bus, color: Color(0xFF5DC3F1)),
                  title: 'Campus/Tools/BusSchedule',
                  path: '/Campus/Tools/BusSchedule'),
              _ToolButton(
                  svg: 'res/campus/klia_express.svg',
                  title: 'Campus/Tools/KliaExpress',
                  path: '/Campus/Tools/KliaExpress'),
              _ToolButton(
                  svg: 'res/campus/travelviser.svg',
                  title: 'Campus/Tools/Travelviser',
                  path: '/Campus/Tools/Travelviser'),
              _ToolButton(
                  child: Icon(
                    FontAwesomeIcons.hammer,
                    color: Color(0xFF5DC3F1),
                    size: 60,
                  ),
                  title: 'Campus/Tools/Maintenance',
                  path: '/Campus/Tools/Maintenance'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ToolButton extends StatelessWidget {
  /// Icon to display.
  /// The icon name also used as tag for hero animation.
  final Widget child;

  /// The asset name of *SVG* file of icon.
  /// The asset name also used as tag for hero animation.
  final String svg;

  /// Title for tooltip.
  final String title;

  /// Path for `Navigator`.
  final String path;

  _ToolButton(
      {Key key,
      this.child,
      this.svg,
      @required this.title,
      @required this.path})
      : assert(!(child == null && svg == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Hero(tag: child ?? svg, child: child ?? SvgPicture.asset(svg)),
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pushNamed(path),
          tooltip: i18n(title, context),
          iconSize: 70,
        ),
        IntrinsicHeight(),
        Container(
          width: 85,
          margin: const EdgeInsets.only(bottom: 5),
          child: Text(
            i18n(title, context),
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
