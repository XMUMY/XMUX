import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:xmux/globals.dart';

class KliaExpressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18n('Campus/Tools/KliaExpress', context)),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: 'Transit'),
            Tab(text: 'Express'),
          ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            PhotoView(
              imageProvider: CachedNetworkImageProvider(firebase
                  .remoteConfigs.staticResources.kliaTransitScheduleImage),
              maxScale: 2.0,
              minScale: 0.3,
            ),
            PhotoView(
              imageProvider: CachedNetworkImageProvider(firebase
                  .remoteConfigs.staticResources.kliaExpressScheduleImage),
              maxScale: 2.0,
              minScale: 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
