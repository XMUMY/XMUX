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
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
        children: <Widget>[
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/WolframEngine',
            image: 'res/academic/wolfram.svg',
            route: '/Campus/AcademicTools/WolframEngine',
          ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/GeoGebra',
            image: 'res/academic/geogebra.svg',
            route: '/Campus/AcademicTools/GeoGebra',
          ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/ExamResult',
            image: 'res/academic/gpa.svg',
            route: '/Campus/AcademicTools/ExamResult',
          ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/VPN',
            image: 'res/academic/vpn.svg',
            route: '/Campus/AcademicTools/VPN',
          ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/GPACalculator',
            image: 'res/academic/gpa_calculator.svg',
            route: '/Campus/AcademicTools/GPACalculator',
          ),
          _AcademicPageCard(
            textUri: 'Campus/AcademicTools/ECR',
            image: 'res/academic/ecr.svg',
            route: '/Campus/AcademicTools/ECR',
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
