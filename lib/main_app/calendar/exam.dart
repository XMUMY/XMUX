import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';

class ExamsPage extends StatelessWidget {
  final List<Exam> exams;

  ExamsPage(List<Exam> exams) : exams = exams ?? const [];

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
          "${LocaleKeys.Calendar_LastUpdate.tr()} "
          '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(store.state.acState.timestamp)} '
          '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(store.state.acState.timestamp)}',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: exams.isEmpty ? 0 : exams.length + 1,
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
    );

    // Show empty error.
    if (exams.isEmpty)
      body = Stack(children: [
        body,
        EmptyErrorPage(),
      ]);

    return RefreshIndicator(
      displacement: 40 + Scaffold.of(context).appBarMaxHeight,
      onRefresh: _handleUpdate,
      child: body,
    );
  }
}

class _ExamCard extends StatelessWidget {
  final Exam examData;

  _ExamCard(this.examData);

  @override
  Widget build(BuildContext context) {
    return FloatingCard(
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
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
              '${'General_Weekday${examData.date.weekday}'.tr()} '
              '${examData.durationOfDay.start.format(context)} - '
              '${examData.durationOfDay.end.format(context)}'),
          Text(examData.venue),
          Text('${examData.type}, ${examData.status}'),
        ],
      ),
    );
  }
}
