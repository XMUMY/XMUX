import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/blur_box.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/explore/chat_room_page.dart';
import 'package:xmux/mainapp/explore/flea_market/flea_market_page.dart';
import 'package:xmux/redux/redux.dart';

class ExplorePage extends StatelessWidget {
  Widget buildLayout(BuildContext context, BoxConstraints constraints) {
    return Stack(
      children: <Widget>[
        FlareActor('res/animations/stars.flr',
            alignment: Alignment.topCenter,
            fit: constraints.maxHeight / constraints.maxWidth > 16 / 9
                ? BoxFit.fitHeight
                : BoxFit.fitWidth,
            animation: 'idle'),
        Positioned(
          left: 20.0,
          top: 50.0,
          child: Text(
            i18n('Explore', context),
            style: TextStyle(fontSize: 50.0, color: Colors.white70),
          ),
        ),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.8),
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.find_in_page, color: Colors.white70),
              title: Text(
                i18n('lostandfound', context),
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.white),
              ),
              onTap: () => Navigator.of(context, rootNavigator: true)
                  .pushNamed("/Explore/LostAndFound"),
            ),
            ListTile(
              leading: Icon(Icons.chat, color: Colors.white70),
              title: Text(
                i18n('About/Feedback', context),
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.white),
              ),
              onTap: () => Navigator.of(context, rootNavigator: true).push(
                  new MaterialPageRoute(
                      builder: (_) => new GlobalChatroomPage())),
            ),
            ListTile(
              leading: Icon(Icons.store, color: Colors.white70),
              title: Text(
                i18n('FleaMarket', context),
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .copyWith(color: Colors.white),
              ),
              onTap: () => Navigator.of(context, rootNavigator: true).push(
                  new MaterialPageRoute(builder: (_) => new FleaMarketPage())),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: buildLayout),
      floatingActionButton: StoreConnector<MainAppState, bool>(
        converter: (s) => s.state.settingState.enableFunctionsUnderDev,
        builder: (_, v) => (v == true)
            ? FloatingActionButton(
                child: Icon(Icons.android),
                onPressed: () => showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  transitionDuration: Duration(milliseconds: 400),
                  barrierColor: Colors.black12.withOpacity(0.2),
                  pageBuilder: (context, _, __) => xiA.page,
                  transitionBuilder: (context, animation, _, child) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: GaussianBlurBox(
                        sigma: (animation.value * 30).round() / 10,
                        centered: true,
                        child: FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.95,
                              end: 1.0,
                            ).animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeIn,
                                reverseCurve: Curves.fastOutSlowIn)),
                            child: child,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(),
      ),
    );
  }
}
