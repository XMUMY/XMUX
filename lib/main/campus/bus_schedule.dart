import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class BusSchedulePage extends StatelessWidget {
  const BusSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_BusSchedule.tr()),
      ),
      body: SizedBox.expand(
        child: ExtendedImage.network(
          remoteConfigs.staticResources.busScheduleImage,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (state) => GestureConfig(
            maxScale: 2.0,
            minScale: 0.5,
          ),
        ),
      ),
    );
  }
}
