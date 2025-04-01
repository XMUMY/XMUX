import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../foundation/localization/locale_keys.dart';
import '../../foundation/platform/breakpoint.dart';
import '../../foundation/platform/platform.dart';
import '../redux/store.dart';

class CampusPage extends StatelessWidget {
  const CampusPage({super.key});

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
              if (isNative) // CORS
                _Button(
                  title: 'Wolfram Engine',
                  svg: 'assets/campus/wolfram.svg',
                  onPressed: _push(context, '/campus/wolfram_engine'),
                ),
              if (isMobile) // WebView limit.
                _Button(
                  title: 'GeoGebra',
                  svg: 'assets/campus/geogebra.svg',
                  onPressed: _push(context, '/campus/geogebra'),
                ),
              if (store.state.user.isStudent)
                _Button(
                  title: LocaleKeys.Campus_AcademicTranscript.tr(),
                  svg: 'assets/campus/transcript.svg',
                  onPressed: _push(context, '/campus/transcript'),
                ),
              if (store.state.user.isStudent)
                _Button(
                  title: LocaleKeys.Campus_GPACalculator.tr(),
                  svg: 'assets/campus/gpa_calculator.svg',
                  onPressed: _push(context, '/campus/gpa_calculator'),
                ),
              _Button(
                title: 'VPN',
                svg: 'assets/campus/vpn.svg',
                onPressed: () => launchUrlString('https://webvpn.xmu.edu.cn'),
              ),
              if (isNative && store.state.user.isStudent)
                _Button(
                  title: LocaleKeys.Campus_ECR.tr(),
                  svg: 'assets/campus/ecr.svg',
                  onPressed:
                      _push(context, '/campus/elective_course_registration'),
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
              if (isNative) // CORS
                _Button(
                  title: LocaleKeys.Campus_BusSchedule.tr(),
                  onPressed: _push(context, '/campus/bus_schedule'),
                  child: const Icon(
                    Icons.directions_bus,
                    color: Color(0xFF5DC3F1),
                  ),
                ),
              if (isNative) // CORS
                _Button(
                  title: LocaleKeys.Campus_KliaExpress.tr(),
                  svg: 'assets/campus/klia_express.svg',
                  onPressed: _push(context, '/campus/klia_express'),
                ),
              if (isNative) // CORS
                _Button(
                  title: LocaleKeys.Campus_Emgs.tr(),
                  onPressed: _push(context, '/campus/emgs'),
                  child: const Icon(
                    FontAwesomeIcons.passport,
                    color: Color(0xFF5DC3F1),
                    size: 65,
                  ),
                ),
              if (isNative) // CORS
                _Button(
                  title: LocaleKeys.Campus_Maintenance.tr(),
                  onPressed: _push(context, '/campus/maintenance'),
                  child: const Icon(
                    FontAwesomeIcons.hammer,
                    color: Color(0xFF5DC3F1),
                    size: 65,
                  ),
                ),
              if (isNative) // CORS
                _Button(
                  title: LocaleKeys.Campus_EPayment.tr(),
                  onPressed: _push(context, '/campus/e_payment'),
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Color(0xFF5DC3F1),
                  ),
                ),
              _Button(
                title: LocaleKeys.Campus_LaF.tr(),
                onPressed: _push(context, '/campus/lost_and_found'),
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
    this.child,
    this.svg,
    required this.title,
    required this.onPressed,
  }) : assert(!(child == null && svg == null));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: <Widget>[
          IconButton(
            icon: child ??
                SvgPicture.asset(
                  svg!,
                  height: 65,
                ),
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
