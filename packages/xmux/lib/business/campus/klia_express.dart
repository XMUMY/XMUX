import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../foundation/firebase/remote_config.dart';
import '../../foundation/localization/locale_keys.dart';

class KliaExpressPage extends StatelessWidget {
  const KliaExpressPage({super.key});

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
              RemoteConfigs.instance.staticResources.kliaTransitScheduleImage,
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) => GestureConfig(
                maxScale: 2.5,
                minScale: 0.5,
              ),
            ),
            ExtendedImage.network(
              RemoteConfigs.instance.staticResources.kliaExpressScheduleImage,
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
