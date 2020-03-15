import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';

class AcademicCalendarPage extends StatelessWidget {
  final isFoundation = store.state.user.campusId.startsWith(RegExp('fia|fis'));

  final undergraduate = firebase
      .remoteConfigs.staticResources.academicCalendarImages.undergraduate;
  final foundation =
      firebase.remoteConfigs.staticResources.academicCalendarImages.foundation;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: isFoundation ? foundation.length : undergraduate.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18n('Calendar/Academic', context)),
          bottom: TabBar(isScrollable: false, tabs: <Tab>[
            if (isFoundation) ...foundation.keys.map((k) => Tab(text: k)),
            if (!isFoundation) ...undergraduate.keys.map((k) => Tab(text: k)),
          ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            if (!isFoundation)
              for (var k in undergraduate.keys)
                ExtendedImage.network(
                  undergraduate[k],
                  mode: ExtendedImageMode.gesture,
                  initGestureConfigHandler: (state) => GestureConfig(
                    maxScale: 1.5,
                    minScale: 0.3,
                  ),
                ),
            if (isFoundation)
              for (var k in foundation.keys)
                ExtendedImage.network(
                  foundation[k],
                  mode: ExtendedImageMode.gesture,
                  initGestureConfigHandler: (state) => GestureConfig(
                    maxScale: 1.5,
                    minScale: 0.3,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
