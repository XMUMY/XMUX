import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../global.dart';
import '../../util/screen.dart';
import '../main_page.dart';

class CampusPage extends StatelessWidget implements TopLevelPage {
  const CampusPage({Key? key}) : super(key: key);

  @override
  String get label => LocaleKeys.Campus_Campus.tr();

  @override
  Widget get icon => const Icon(FontAwesomeIcons.university);

  @override
  Widget get activeIcon => const Icon(FontAwesomeIcons.university);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.padBody),
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              LocaleKeys.Campus_Academic.tr(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Divider(height: 3),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              // TODO:
              for (int i = 1; i < 9; i++)
                _Button(
                  title: LocaleKeys.Campus_Geogebra.tr(),
                  routeName: '',
                  svg: 'res/campus/geogebra.svg',
                  onPressed: () {},
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              LocaleKeys.Campus_Tools.tr(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const Divider(height: 3),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  /// Icon to display.
  final Widget? child;

  /// The asset name of SVG icon file.
  final String? svg;

  /// Title for tooltip.
  final String title;

  /// Route name for [Navigator].
  final String routeName;

  final VoidCallback onPressed;

  const _Button({
    Key? key,
    this.child,
    this.svg,
    required this.title,
    required this.routeName,
    required this.onPressed,
  })  : assert(!(child == null && svg == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: <Widget>[
          IconButton(
            icon: child ?? SvgPicture.asset(svg!),
            onPressed: onPressed,
            tooltip: title,
            iconSize: 70,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
