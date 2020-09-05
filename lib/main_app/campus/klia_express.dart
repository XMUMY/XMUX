import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';

class KliaExpressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18n('Campus/Tools/KliaExpress', context)),
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).primaryColor
              : Colors.lightBlue,
          bottom: TabBar(tabs: <Widget>[
            Tab(text: 'Transit'),
            Tab(text: 'Express'),
          ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            ExtendedImage.network(
              Firebase.remoteConfigs.staticResources.kliaTransitScheduleImage,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) => GestureConfig(
                maxScale: 2.5,
                minScale: 0.3,
              ),
            ),
            ExtendedImage.network(
              Firebase.remoteConfigs.staticResources.kliaExpressScheduleImage,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) => GestureConfig(
                maxScale: 2.5,
                minScale: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
