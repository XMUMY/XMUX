import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'
    if (dart.library.html) 'package:xmux/components/svg_web.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/main_app/main_page.dart';

class CampusPage extends StatelessWidget implements MainPageContentProvider {
  @override
  bool get extendBody => false;

  @override
  bool get extendBodyBehindAppBar => false;

  @override
  AppBar buildAppBar(BuildContext context) => AppBar(
        title: Text(LocaleKeys.Campus.tr()),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      );

  @override
  BottomNavigationBarItem buildBottomNavigationBarItem(BuildContext context) {
    var color = Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).primaryColor
        : Colors.lightBlue;

    if (store.state.settingState.enableBlur) color = color.withOpacity(0.7);

    return BottomNavigationBarItem(
      title: Text(LocaleKeys.Campus.tr()),
      icon: Icon(FontAwesomeIcons.university),
      backgroundColor: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
      children: <Widget>[
        Text(
          ' ' + i18n('Campus/AcademicTools', context),
          style: Theme.of(context).textTheme.headline6,
        ),
        Divider(height: 3),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            _ToolButton(
              svg: 'res/campus/wolfram.svg',
              title: 'Campus/AcademicTools/WolframEngine/Title',
              path: '/Campus/ACTools/WolframEngine',
            ),
            if (P.isMobile)
              _ToolButton(
                svg: 'res/campus/geogebra.svg',
                title: 'GeoGebra',
                path: '/Campus/ACTools/GeoGebra',
              ),
            if (store.state.user.isStudent)
              _ToolButton(
                svg: 'res/campus/gpa.svg',
                title: LocaleKeys.Campus_AcademicTranscript.tr(),
                path: '/Campus/ACTools/Transcript',
              ),
            if (store.state.user.isStudent)
              _ToolButton(
                svg: 'res/campus/gpa_calculator.svg',
                title: 'Campus/AcademicTools/GPACalculator/Title',
                path: '/Campus/ACTools/GPACalculator',
              ),
            if (P.isAndroid)
              _ToolButton(
                svg: 'res/campus/vpn.svg',
                title: 'VPN',
                path: '/Campus/ACTools/VPN',
              ),
            if (P.isVM & store.state.settingState.enableFunctionsUnderDev &&
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
          style: Theme.of(context).textTheme.headline6,
        ),
        Divider(),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            _ToolButton(
              child: Icon(Icons.directions_bus, color: Color(0xFF5DC3F1)),
              title: LocaleKeys.Campus_ToolsBusSchedule.tr(),
              path: '/Campus/Tools/BusSchedule',
            ),
            _ToolButton(
              svg: 'res/campus/klia_express.svg',
              title: LocaleKeys.Campus_ToolsKliaExpress.tr(),
              path: '/Campus/Tools/KliaExpress',
            ),
            if (P.isVM)
              _ToolButton(
                svg: 'res/campus/travelviser.svg',
                title: 'Campus/Tools/Travelviser',
                path: '/Campus/Tools/Travelviser',
              ),
            if (P.isVM)
              _ToolButton(
                child: Icon(
                  FontAwesomeIcons.hammer,
                  color: Color(0xFF5DC3F1),
                  size: 60,
                ),
                title: 'Campus/Tools/Maintenance',
                path: '/Campus/Tools/Maintenance',
              ),
            _ToolButton(
              child: Icon(
                Icons.find_in_page,
                color: Color(0xFF5DC3F1),
                size: 60,
              ),
              title: LocaleKeys.Campus_ToolsLF.tr(),
              path: '/Campus/Tools/LostAndFound',
            ),
          ],
        ),
      ],
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

  _ToolButton({
    Key key,
    this.child,
    this.svg,
    @required this.title,
    @required this.path,
  })  : assert(!(child == null && svg == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          icon: Hero(
            tag: child ?? svg,
            child: child ?? SvgPicture.asset(svg),
          ),
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pushNamed(path),
          tooltip: i18n(title, context),
          iconSize: 70,
        ),
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
