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
        body: Builder(
          builder: (_) => new ZoomableImage(
              new CachedNetworkImageProvider(
                "https://${BackendApiConfig
            .resourceAddress}/image/cal_undergraduate.jpg",
                errorListener: () => Scaffold
                    .of(context)
                    .showSnackBar(SnackBar(content: Text("Failed to load."))),
              ),
              scale: 1.5),
        ),
      );
}
