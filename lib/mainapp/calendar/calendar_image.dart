import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xmux/config.dart';
import 'package:xmux/translations/translation.dart';
import 'package:zoomable_image/zoomable_image.dart';

class CalendarImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title:
              Text(MainLocalizations.of(context).get("Calendar/CalendarImage")),
        ),
        body: ZoomableImage(
          CachedNetworkImageProvider(
            "https://${BackendApiConfig
            .resourceAddress}/image/cal_undergraduate.jpg",
          ),
          maxScale: 1.5,
          placeholder: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
}
