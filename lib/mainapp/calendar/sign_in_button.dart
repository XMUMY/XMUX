import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/sketch/sketch.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

class SignInButton extends StatefulWidget {
  final Lesson _theClass;
  final bool _canSign;

  SignInButton(this._theClass)
      : this._canSign = _theClass.dayOfWeek == DateTime.now().weekday - 1;

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  Future<Null> _handleSignIn() async {
    var key = GlobalKey<SketchState>();
    await showDialog(
      context: context,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Stack(
              children: <Widget>[
                SizedBox.expand(child: Sketch(key: key)),
                Positioned(
                  right: 5.0,
                  bottom: 5.0,
                  child: FloatingActionButton(
                    child: Icon(Icons.save),
                    onPressed: () async {
                      var im = await key.currentState.image;
                      var dir = (await getTemporaryDirectory()).path;
                      var bytes =
                          await im.toByteData(format: ui.ImageByteFormat.png);
                      File('$dir/test.png')
                          .writeAsBytesSync(bytes.buffer.asUint8List());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget._canSign
      ? FlatButton(
          onPressed: widget._canSign ? () => _handleSignIn() : null,
          child: Text(i18n('Calendar/SignIn', context)),
        )
      : Container();
}
