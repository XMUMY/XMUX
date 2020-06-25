import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xmux/globals.dart';

class RoomWebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RoomWebViewPageState();
}

class _RoomWebViewPageState extends State<RoomWebViewPage> {
  WebViewController controller;

  void _changeToRooms() {
    if (controller != null) controller.evaluateJavascript("""
      window.location.href="/room_reservations"; 
    """);
  }

  void _changeToMe() {
    if (controller != null) controller.evaluateJavascript("""
      window.location.href="/my_reservations"; 
    """);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n("Tools/RoomReservation", context)),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.table),
            tooltip: 'Reserve Rooms',
            onPressed: _changeToRooms,
          ),
          IconButton(
            icon: Icon(Icons.person),
            tooltip: 'My Reservations',
            onPressed: _changeToMe,
          ),
        ],
      ),
      body: WebView(
        initialUrl: 'http://rooms.xmu.edu.my/user',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (c) => controller = c,
        onPageFinished: (url) {
          if (controller == null) return;
          controller.evaluateJavascript("""
'use strict';
window.xmuxAuth = { id: '${store.state.user.campusId}', 
                    pass: '${store.state.user.password}' };
(()=>{const e=window.document.createElement("script");e.src="https://browser.sentry-cdn.com/4.2.3/bundle.min.js",e.crossOrigin="anonymous",window.document.head.appendChild(e),window.Sentry&&Sentry.init({dsn:"https://36a4aed85e834357bd6fe7fa6ddca5d2@sentry.io/1247594"})})(),(e=>{const t=e.xmuxAuth,s=e.document,o="xmux_user";function n(t=""){const s=sessionStorage.getItem(o);!function(e=""){sessionStorage.setItem(o,e)}(t),s&&s!==t&&(e.location.href="/user/logout")}if(t){const{id:s}=t;n(s),e._xmuxAuth=e.xmuxAuth,delete e.xmuxAuth,Object.defineProperty(e,"xmuxAuth",{get:()=>e._xmuxAuth,set:e=>n(e.id)})}const i=(()=>{const t=s.createElement("script");return t.src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js",s.body.appendChild(t),e.jQuery.noConflict()})();i(".website-head, .header_line, .footer").remove(),i(".horiz-time-slots").css("overflow-x","visible"),i(".time-slots").css({width:"unset",display:"flex"});const r=e.location.pathname;if(r.startsWith("/user")){if(t){const{id:e,pass:s}=t;((e,t)=>{i("#edit-name").val(e),i("#edit-pass").val(t),i("#user-login").submit()})(e,s)}}else r.startsWith("/room_reservations")?i(".panel").each((e,t)=>(e=>{const t=i("<div></div>").css({display:"flex","flex-direction":"row","overflow-x":"scroll"}),s=i(`#\${e} .gcolumns > .hours-column,#\${e} .horiz-time-slots`);s.remove(),t.append(s),i(`#\${e} .gcolumns`).append(t)})(t.id)):"/"===r&&(e.location.href="/user/login")})(window);
""");
        },
      ),
    );
  }
}
