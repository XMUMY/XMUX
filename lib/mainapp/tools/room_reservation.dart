import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/translations/translation.dart';

class RoomWebviewPage extends StatefulWidget {
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  State<StatefulWidget> createState() => _RoomWebviewPageState();
}

class _RoomWebviewPageState extends State<RoomWebviewPage> {
  StreamSubscription urlListener;

  void _changeToRooms() {
    widget.flutterWebviewPlugin.evalJavascript("""
      window.location.href="/room_reservations"; 
    """);
  }

  void _changeToMe() {
    widget.flutterWebviewPlugin.evalJavascript("""
      window.location.href="/my_reservations"; 
    """);
  }

  @override
  void initState() {
    urlListener = widget.flutterWebviewPlugin.onUrlChanged.listen((url) {
      widget.flutterWebviewPlugin.evalJavascript("""
        window.xmuxAuth = { id: '${mainAppStore.state.authState.campusID}', 
                            pass: '${mainAppStore.state.authState.campusIDPassword}' };
      """);
      widget.flutterWebviewPlugin.evalJavascript("""
        'use strict'; (() => {
            const el = document.createElement('script')
            el.src = '//${BackendApiConfig.resourceAddress}/js/inject/rooms-common.js'
            document.body.appendChild(el)
          })();
      """);
    });
    super.initState();
  }

  @override
  void dispose() {
    urlListener.cancel();
    widget.flutterWebviewPlugin.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WebviewScaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("roomreservation")),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.table),
              onPressed: _changeToRooms,
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: _changeToMe,
            ),
          ],
        ),
        url: "http://rooms.xmu.edu.my/user",
      );
}
