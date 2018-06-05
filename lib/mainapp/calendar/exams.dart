import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/calendar_handler.dart';
import 'package:xmux/translations/translation.dart';

class ExamsPage extends StatelessWidget {
  final List exams;

  ExamsPage(this.exams);

  // Handle refresh.
  Future<Null> _handleUpdate() async {
    await CalendarHandler.acUpdate();
  }

  Widget _buildLastUpdateString(BuildContext context) => Center(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            MainLocalizations.of(context).get("Calendar/LastUpdate") +
                DateFormat
                    .yMMMd(Localizations.localeOf(context).languageCode)
                    .format(DateTime.fromMillisecondsSinceEpoch(
                        mainAppStore.state.acState.timestamp)) +
                " " +
                DateFormat
                    .Hms(Localizations.localeOf(context).languageCode)
                    .format(DateTime.fromMillisecondsSinceEpoch(
                        mainAppStore.state.acState.timestamp)),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => exams == null
      ? errorWidgets.emptyErrorButton(onRefresh: _handleUpdate)
      : exams.isEmpty
          ? errorWidgets.emptyErrorPage
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
  final Map examData;

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
                        examData["Course Name"],
                        style: Theme
                            .of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.black54),
                      ),
                    ),
                    Text(examData["Exam Date"] +
                        " " +
                        examData["Exam Day"] +
                        " " +
                        examData["Exam Time"]),
                    Text(examData["Exam Venue"]),
                    Text(examData["Exam Type"]),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
