import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/moodle/models/upcoming_event.dart';

class UpcomingEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var languageCode = Localizations.localeOf(context).languageCode;

    return Refreshable<List<UpcomingEvent>>(
      onRefresh: () async => await moodleApi.upcomingEvents,
      isEmpty: (data) => data.isEmpty,
      builder: (context, data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            var event = data[index];

            var card = FloatingCard(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Divider(height: 5, color: Colors.transparent),
                  Text(
                    '${DateFormat.yMMMd(languageCode).format(event.timeStart)} '
                    '${DateFormat.Hms(languageCode).format(event.timeStart)}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(height: 5),
                  Html(data: event.description),
                ],
              ),
            );

            var child = Center(
              child: SizedBox(
                width: min(MediaQuery.of(context).size.width, 600),
                child: card,
              ),
            );

            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: child,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
