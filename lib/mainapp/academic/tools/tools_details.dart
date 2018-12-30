import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/state.dart';

class AcademicToolDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Academic/Tools', context)),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0.0),
        children: <Widget>[
          _AcademicPageCard(
            textUri: 'Academic/Tools/WolframEngine',
            image: 'res/academic/wolfram.svg',
            route: '/Academic/Tools/WolframEngine',
          ),
          _AcademicPageCard(
            textUri: 'Academic/Tools/GeoGebra',
            image: 'res/academic/geogebra.svg',
            route: '/Academic/Tools/GeoGebra',
          ),
          _AcademicPageCard(
            textUri: 'Academic/Tools/GPACalculator',
            image: 'res/academic/gpa_calculator.svg',
            route: '/Academic/Tools/GPACalculator',
          ),
          _AcademicPageCard(
            textUri: 'Academic/Tools/ExamResult',
            image: 'res/academic/gpa.svg',
            route: '/Academic/Tools/ExamResult',
          ),
          StoreConnector<MainAppState, bool>(
            converter: (s) => s.state.settingState.enableFunctionsUnderDev,
            builder: (_, e) => e
                ? _AcademicPageCard(
                    textUri: 'Academic/Tools/VPN',
                    image: 'res/academic/vpn.svg',
                    route: '/Academic/Tools/VPN',
                  )
                : Container(),
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
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
        child: FlatButton(
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
                      i18n(textUri + '/Title', context),
                      style: Theme.of(context).textTheme.title,
                    ),
                    Divider(
                      height: 5.0,
                      color: Theme.of(context).canvasColor,
                    ),
                    Text(
                      i18n(textUri + '/Caption', context),
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
