import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/generated/i18n.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/common/translation_mapper.dart' show weekdays;
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

class ExamsPage extends StatelessWidget {
  final List<Exam> exams;

  ExamsPage(this.exams);

  // Handle refresh.
  Future<Null> _handleUpdate() async {
    var act = UpdateAcAction();
    store.dispatch(act);
    await act.listener;
  }

  Widget _buildLastUpdateString(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Text(
          "${S.of(context).Calendar_LastUpdate} "
          '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(store.state.acState.timestamp)} '
          '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(store.state.acState.timestamp)}',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => exams == null
      ? EmptyErrorButton(onRefresh: _handleUpdate)
      : exams.isEmpty
          ? EmptyErrorPage()
          : RefreshIndicator(
              onRefresh: _handleUpdate,
              child: ListView.builder(
                itemCount: exams.length + 1,
                itemBuilder: (_, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 250),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: index == exams.length
                            ? _buildLastUpdateString(context)
                            : _ExamCard(exams[index]),
                      ),
                    ),
                  );
                },
              ),
            );
}

class _ExamCard extends StatelessWidget {
  final Exam examData;

  _ExamCard(this.examData);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                examData.courseName,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Text('${examData.date.toString().substring(0, 10)} '
                '${weekdays(context, examData.date.weekday)} '
                '${examData.durationOfDay.start.format(context)} - '
                '${examData.durationOfDay.end.format(context)}'),
            Text(examData.venue),
            Text('${examData.type}, ${examData.status}'),
          ],
        ),
      ),
    );
  }
}
