import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:xmux/globals.dart';

class AcademicCalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(i18n('Calendar/Academic', context))),
        body: PhotoView(
          imageProvider: CachedNetworkImageProvider(
              firebase.remoteConfigs.staticResources.academicCalendarImage),
          loadingChild: Center(child: CircularProgressIndicator()),
          maxScale: 1.5,
          minScale: 0.3,
        ),
      );
}
