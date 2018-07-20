import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:xmux/config.dart';
import 'package:xmux/translations/translation.dart';

class CalendarImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title:
              Text(MainLocalizations.of(context).get("Calendar/CalendarImage")),
        ),
        body: PhotoView(
          imageProvider: CachedNetworkImageProvider(
            "https://${BackendApiConfig
            .resourceAddress}/image/cal_undergraduate.jpg",
          ),
          loadingChild: Center(
            child: CircularProgressIndicator(),
          ),
          maxScale: 1.5,
          minScale: 0.3,
        ),
      );
}
