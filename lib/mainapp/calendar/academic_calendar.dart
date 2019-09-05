import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:xmux/globals.dart';

class AcademicCalendarPage extends StatelessWidget {
  final isFoundation =
      store.state.authState.campusID.startsWith(RegExp('fia|fis'));

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
                PhotoView(
                  imageProvider: CachedNetworkImageProvider(undergraduate[k]),
                  loadingChild: Center(child: CircularProgressIndicator()),
                  maxScale: 1.5,
                  minScale: 0.3,
                ),
            if (isFoundation)
              for (var k in foundation.keys)
                PhotoView(
                  imageProvider: CachedNetworkImageProvider(foundation[k]),
                  loadingChild: Center(child: CircularProgressIndicator()),
                  maxScale: 1.5,
                  minScale: 0.3,
                ),
          ],
        ),
      ),
    );
  }
}
