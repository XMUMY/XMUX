import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:lottie/lottie.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';

class VPNPage extends StatefulWidget {
  @override
  _VPNPageState createState() => _VPNPageState();
}

class _VPNPageState extends State<VPNPage> with TickerProviderStateMixin {
  var currentState = FlutterVpnState.disconnected;
  StreamSubscription _stateSubscription;
  AnimationController _lottieController;

  Color get color {
    switch (currentState) {
      case FlutterVpnState.disconnected:
        return Theme.of(context).textTheme.bodyText1.color;
      case FlutterVpnState.connecting:
        return Colors.orangeAccent;
      case FlutterVpnState.connected:
        return Colors.greenAccent;
      case FlutterVpnState.disconnecting:
        return Colors.orangeAccent;
      default:
        return Colors.red;
    }
  }

  @override
  void initState() {
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      lowerBound: 0,
      upperBound: 0.8,
    );
    FlutterVpn.currentState.then((s) {
      if (mounted) setState(() => currentState = s);
      if (s == FlutterVpnState.connected) _lottieController.forward();
    });
    FlutterVpn.prepare();
    _stateSubscription = FlutterVpn.onStateChanged
        .listen((s) => setState(() => currentState = s));
    super.initState();
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VPN'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Animation & Icon.
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2.9,
                child: LottieBuilder.asset(
                  'res/animations/vpn.json',
                  controller: _lottieController,
                  reverse: false,
                  onLoaded: (c) {
                    if (currentState == FlutterVpnState.connected)
                      _lottieController.forward();
                  },
                ),
              ),
              Hero(
                tag: 'res/campus/vpn.svg',
                child: SvgPicture.asset(
                  'res/campus/vpn.svg',
                  height: 66,
                  width: 66,
                  color: color,
                ),
              ),
            ],
          ),
          Divider(height: 10, color: Colors.transparent),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                i18n('Campus/AcademicTools/VPN/State/${currentState.index}',
                    context),
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: color),
              ),
            ),
          ),
          Divider(color: Colors.transparent),
          Text(
            LocaleKeys.Campus_AcademicVPNWarning.tr(),
            textAlign: TextAlign.center,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: RaisedButton(
                    onPressed: currentState == FlutterVpnState.connected
                        ? null
                        : () {
                            _lottieController.forward();
                            FlutterVpn.simpleConnect(
                              'ikev2.xmu.edu.my',
                              store.state.user.campusId,
                              store.state.user.password,
                            );
                          },
                    child: Text(LocaleKeys.Campus_AcademicVPNConnect.tr()),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
                  child: RaisedButton(
                    onPressed: () {
                      FlutterVpn.disconnect();
                      _lottieController.reverse();
                    },
                    child: Text(LocaleKeys.Campus_AcademicVPNDisconnect.tr()),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
