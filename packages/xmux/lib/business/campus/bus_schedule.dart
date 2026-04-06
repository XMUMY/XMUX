import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../foundation/firebase/remote_config.dart';
import '../../foundation/localization/locale_keys.dart';

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
          RemoteConfigs.instance.staticResources.busScheduleImage,
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
