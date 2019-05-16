import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xmux/globals.dart';

class AcademicToolDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Campus/AcademicTools', context)),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
        children: <Widget>[
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/WolframEngine',
            image: 'res/campus/wolfram.svg',
            route: '/Campus/ACTools/WolframEngine',
          ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/GeoGebra',
            image: 'res/campus/geogebra.svg',
            route: '/Campus/ACTools/GeoGebra',
          ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/ExamResult',
            image: 'res/campus/gpa.svg',
            route: '/Campus/ACTools/ExamResult',
          ),
          if (!Platform.isIOS)
            _AcademicPageCard(
              textUri: 'Campus/AcademicTools/VPN',
              image: 'res/campus/vpn.svg',
              route: '/Campus/ACTools/VPN',
            ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/GPACalculator',
            image: 'res/campus/gpa_calculator.svg',
            route: '/Campus/ACTools/GPACalculator',
          ),
          if (store.state.settingState.enableFunctionsUnderDev)
            _AcademicPageCard(
              textUri: 'Campus/AcademicTools/ECR',
              image: 'res/campus/ecr.svg',
              route: '/Campus/ACTools/ECR',
            ),
        ],
      ),
    );
  }
}

class _AcademicPageCard extends StatelessWidget {
  final String textUri, image, route;

  _AcademicPageCard(
      {@required this.textUri, @required this.image, @required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
      child: RaisedButton(
        color: Theme.of(context).cardColor,
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Hero(
              tag: image,
              child: SvgPicture.asset(
                image,
                height: 66.0,
                width: 66.0,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    i18n('$textUri/Title', context),
                    style: Theme.of(context).textTheme.title,
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.transparent,
                  ),
                  Text(
                    i18n('$textUri/Caption', context),
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        onPressed: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
