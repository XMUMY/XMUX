import 'package:easy_localization/easy_localization.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../foundation/firebase/remote_config.dart';
import '../../foundation/localization/locale_keys.dart';
import '../redux/store.dart';

class AcademicCalendarPage extends StatelessWidget {
  final isFoundation = store.state.user.isFoundation;
  final undergraduate = RemoteConfigs
      .instance.staticResources.academicCalendarImages.undergraduate;
  final foundation =
      RemoteConfigs.instance.staticResources.academicCalendarImages.foundation;

  AcademicCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: isFoundation ? foundation.length : undergraduate.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.Calendar_Academic.tr()),
          bottom: TabBar(isScrollable: false, tabs: <Tab>[
            if (isFoundation) ...foundation.keys.map((k) => Tab(text: k)),
            if (!isFoundation) ...undergraduate.keys.map((k) => Tab(text: k)),
          ]),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            if (!isFoundation)
              for (var v in undergraduate.values)
                ExtendedImage.network(
                  v,
                  mode: ExtendedImageMode.gesture,
                  initGestureConfigHandler: (state) => GestureConfig(
                    maxScale: 1.8,
                    minScale: 0.5,
                  ),
                ),
            if (isFoundation)
              for (var v in foundation.values)
                ExtendedImage.network(
                  v,
                  mode: ExtendedImageMode.gesture,
                  initGestureConfigHandler: (state) => GestureConfig(
                    maxScale: 1.8,
                    minScale: 0.5,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
