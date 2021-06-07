import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../global.dart';
import '../../util/platform.dart';
import '../../util/screen.dart';
import '../main_page.dart';
import 'bus_schedule.dart';
import 'geogebra.dart';
import 'klia_express.dart';
import 'transcript.dart';
import 'wolfram.dart';

class CampusPage extends StatelessWidget implements TopLevelPage {
  const CampusPage({Key? key}) : super(key: key);

  @override
  String get label => LocaleKeys.Campus_Campus.tr();

  @override
  Widget get icon => const Icon(FontAwesomeIcons.university);

  @override
  Widget get activeIcon => const Icon(FontAwesomeIcons.university);

  VoidCallback _push(BuildContext context, Widget page) {
    return () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
  }

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
              if (!isWeb) // CORS
                _Button(
                  title: 'Wolfram Engine',
                  svg: 'res/campus/wolfram.svg',
                  onPressed: _push(context, const WolframPage()),
                ),
              if (isMobile) // WebView limit.
                _Button(
                  title: 'GeoGebra',
                  svg: 'res/campus/geogebra.svg',
                  onPressed: _push(context, const GeoGebraPage()),
                ),
              _Button(
                title: LocaleKeys.Campus_AcademicTranscript.tr(),
                svg: 'res/campus/transcript.svg',
                onPressed: _push(context, const TranscriptPage()),
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
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              if (!isWeb) // CORS
                _Button(
                  title: LocaleKeys.Campus_BusSchedule.tr(),
                  child: const Icon(
                    Icons.directions_bus,
                    color: Color(0xFF5DC3F1),
                  ),
                  onPressed: _push(context, const BusSchedulePage()),
                ),
              _Button(
                title: LocaleKeys.Campus_KliaExpress.tr(),
                svg: 'res/campus/klia_express.svg',
                onPressed: _push(context, const KliaExpressPage()),
              ),
            ],
          ),
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

  final VoidCallback onPressed;

  const _Button({
    Key? key,
    this.child,
    this.svg,
    required this.title,
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
            iconSize: 65,
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
