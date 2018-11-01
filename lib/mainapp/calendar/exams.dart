import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class ExamsPage extends StatelessWidget {
  final List<Exam> exams;

  ExamsPage(this.exams);

  // Handle refresh.
  Future<Null> _handleUpdate() async {
    var act = UpdateAcAction();
    store.dispatch(act);
    await act.listener;
  }

  Widget _buildLastUpdateString(BuildContext context) => Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            MainLocalizations.of(context).get("Calendar/LastUpdate") +
                DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
                    .format(store.state.acState.timestamp) +
                " " +
                DateFormat.Hms(Localizations.localeOf(context).languageCode)
                    .format(store.state.acState.timestamp),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => exams == null
      ? ErrorWidgets.emptyErrorButton(onRefresh: _handleUpdate)
      : exams.isEmpty
          ? ErrorWidgets.emptyErrorPage
          : RefreshIndicator(
              onRefresh: _handleUpdate,
              child: ListView.builder(
                itemCount: exams.length + 1,
                itemBuilder: (_, int index) {
                  if (index == exams.length)
                    // Build last update string.
                    return _buildLastUpdateString(context);
                  else
                    // Build exam card.
                    return _ExamCard(exams[index]);
                },
              ),
            );
}

class _ExamCard extends StatelessWidget {
  final Exam examData;

  _ExamCard(this.examData);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        examData.courseName,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                    Text(examData.date.toString().substring(0, 10) +
                        " " +
                        MainLocalizations.of(context)
                            .get('Weekdays/${examData.date.weekday}') +
                        " " +
                        examData.durationOfDay.start.format(context) +
                        '-' +
                        examData.durationOfDay.end.format(context)),
                    Text(examData.venue),
                    Text(examData.type),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
