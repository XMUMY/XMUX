import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:xmux/globals.dart';

class BusSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Campus/Tools/BusSchedule', context)),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
      ),
      body: PhotoView(
        imageProvider: CachedNetworkImageProvider(
            firebase.remoteConfigs.staticResources.busScheduleImage),
        maxScale: 2.0,
        minScale: 0.3,
      ),
    );
  }
}
