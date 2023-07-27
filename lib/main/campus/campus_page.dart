import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../global.dart';
import '../../util/platform.dart';
import '../../util/screen.dart';
import '../main_page.dart';

class CampusPage extends StatelessWidget implements TopLevelPage {
  const CampusPage({Key? key}) : super(key: key);

  @override
  String get path => 'Campus';

  @override
  String get label => LocaleKeys.Campus_Campus.tr();

  @override
  Widget get icon => const Icon(Icons.school);

  @override
  Widget get activeIcon => const Icon(Icons.school);

  VoidCallback _push(BuildContext context, String page) {
    return () => context.go(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.padBody),
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              LocaleKeys.Campus_Academic.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Divider(height: 3),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              if (isVM) // CORS
                _Button(
                  title: 'Wolfram Engine',
                  svg: 'res/campus/wolfram.svg',
                  onPressed: _push(context, '/Campus/WolframEngine'),
                ),
              if (isMobile) // WebView limit.
                _Button(
                  title: 'GeoGebra',
                  svg: 'res/campus/geogebra.svg',
                  onPressed: _push(context, '/Campus/GeoGebra'),
                ),
              if (store.state.user.isStudent)
                _Button(
                  title: LocaleKeys.Campus_AcademicTranscript.tr(),
                  svg: 'res/campus/transcript.svg',
                  onPressed: _push(context, '/Campus/Transcript'),
                ),
              if (store.state.user.isStudent)
                _Button(
                  title: LocaleKeys.Campus_GPACalculator.tr(),
                  svg: 'res/campus/gpa_calculator.svg',
                  onPressed: _push(context, '/Campus/GPACalculator'),
                ),
              _Button(
                title: 'VPN',
                svg: 'res/campus/vpn.svg',
                onPressed: () => launchUrlString('https://webvpn.xmu.edu.cn'),
              ),
              if (isVM && store.state.user.isStudent)
                _Button(
                  title: LocaleKeys.Campus_ECR.tr(),
                  svg: 'res/campus/ecr.svg',
                  onPressed: _push(context, '/Campus/ECR'),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              LocaleKeys.Campus_Tools.tr(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const Divider(height: 3),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              if (isVM) // CORS
                _Button(
                  title: LocaleKeys.Campus_BusSchedule.tr(),
                  onPressed: _push(context, '/Campus/BusSchedule'),
                  child: const Icon(
                    Icons.directions_bus,
                    color: Color(0xFF5DC3F1),
                  ),
                ),
              if (isVM) // CORS
                _Button(
                  title: LocaleKeys.Campus_KliaExpress.tr(),
                  svg: 'res/campus/klia_express.svg',
                  onPressed: _push(context, '/Campus/KliaExpress'),
                ),
              if (isVM) // CORS
                _Button(
                  title: LocaleKeys.Campus_Emgs.tr(),
                  onPressed: _push(context, '/Campus/Emgs'),
                  child: const Icon(
                    FontAwesomeIcons.passport,
                    color: Color(0xFF5DC3F1),
                    size: 50,
                  ),
                ),
              if (isVM) // CORS
                _Button(
                  title: LocaleKeys.Campus_Maintenance.tr(),
                  onPressed: _push(context, '/Campus/Maintenance'),
                  child: const Icon(
                    FontAwesomeIcons.hammer,
                    color: Color(0xFF5DC3F1),
                    size: 50,
                  ),
                ),
              if (isVM) // CORS
                _Button(
                  title: LocaleKeys.Campus_EPayment.tr(),
                  onPressed: _push(context, '/Campus/EPayment'),
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Color(0xFF5DC3F1),
                  ),
                ),
              _Button(
                title: LocaleKeys.Campus_LaF.tr(),
                onPressed: _push(context, '/Campus/LostAndFound'),
                child: const Icon(
                  Icons.find_in_page,
                  color: Color(0xFF5DC3F1),
                ),
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
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
