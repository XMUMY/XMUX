import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class KliaExpressPage extends StatelessWidget {
  const KliaExpressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.Campus_KliaExpress.tr()),
          bottom: const TabBar(tabs: <Widget>[
            Tab(text: 'Transit'),
            Tab(text: 'Express'),
          ]),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            ExtendedImage.network(
              remoteConfigs.staticResources.kliaTransitScheduleImage,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) => GestureConfig(
                maxScale: 2.5,
                minScale: 0.5,
              ),
            ),
            ExtendedImage.network(
              remoteConfigs.staticResources.kliaExpressScheduleImage,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) => GestureConfig(
                maxScale: 2.5,
                minScale: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
