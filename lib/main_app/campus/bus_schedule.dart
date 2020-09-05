import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/firebase/firebase.dart';

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
      body: SizedBox.expand(
        child: ExtendedImage.network(
          Firebase.remoteConfigs.staticResources.busScheduleImage,
          mode: ExtendedImageMode.gesture,
          initGestureConfigHandler: (state) => GestureConfig(
            maxScale: 2.0,
            minScale: 0.3,
          ),
        ),
      ),
    );
  }
}
