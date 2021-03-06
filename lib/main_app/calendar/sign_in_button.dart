import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'package:xmus_client/generated/aaos.pb.dart';
import 'package:xmux/components/sketch.dart';
import 'package:xmux/config.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/attendance/attendance.dart';

class SignInButton extends StatefulWidget {
  /// Current Lesson.
  final Timetable_Class _cls;

  /// The lesson can sign in now if satisfy following condition.
  ///
  /// - Date match.
  /// - LessonStart-30min < CurrentTime < LessonStart+30min.
  final bool _canSign;

  final attendanceApi = AttendanceApi(
    address: BackendApiConfig.attendanceAddress,
    uid: store.state.user.campusId,
    password: store.state.user.password,
  );

  SignInButton(this._cls) : this._canSign = _cls.day == DateTime.now().weekday;

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  Future<Null> _handleSignIn() async {
    SystemChrome.setPreferredOrientations([...DeviceOrientation.values]);

    var image = await showDialog<ui.Image>(
      context: context,
      builder: (ctx) => _buildSignatureSketch(ctx),
    );

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    if (image == null) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Cannot get your signature.')));
      return;
    }

    var ip = await WifiInfo().getWifiIP();
    if (ip == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              'Cannot get your address. Please connect to WiFi and try again.')));
      return;
    }

    var bytes = (await image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
    var res = await widget.attendanceApi.attend(widget._cls.cid, ip, bytes);

    if (res.status == AttendStatus.failed)
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(res.message)));
  }

  Widget _buildSignatureSketch(BuildContext ctx) {
    var key = GlobalKey<SketchState>();

    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Stack(children: <Widget>[
            SizedBox.expand(child: Sketch(key: key)),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'Sign your name here | Landscape to get better experience',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: FloatingActionButton(
                child: Icon(Icons.done),
                onPressed: () async =>
                    Navigator.of(ctx).pop(await key.currentState.image),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => widget._canSign
      ? FlatButton(
          onPressed: _handleSignIn,
          child: Text(LocaleKeys.Calendar_AttendanceSignIn.tr()),
        )
      : Container();
}
