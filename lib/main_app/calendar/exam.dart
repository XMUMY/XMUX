import 'dart:async';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/rpc/clients/aaos.pb.dart';
import 'package:xmux/redux/redux.dart';

class ExamsPage extends StatelessWidget {
  final List<Exams_Exam> _exams;
  final DateTime _lastUpdate;

  ExamsPage(Exams exams)
      : _exams = exams.exams,
        _lastUpdate = exams.lastUpdate.toDateTime().toLocal();

  // Handle refresh.
  Future<Null> _handleUpdate() async {
    var action = UpdateExamsAction();
    store.dispatch(action);
    await action.future;
  }

  @override
  Widget build(BuildContext context) {
    var languageCode = Localizations.localeOf(context).languageCode;
    var lastUpdateText = Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          "${LocaleKeys.Calendar_LastUpdate.tr()} "
          '${DateFormat.yMMMd(languageCode).format(_lastUpdate)} '
          '${DateFormat.Hms(languageCode).format(_lastUpdate)}',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );

    Widget body;
    if (_exams.isNotEmpty)
      body = ListView.builder(
        itemCount: _exams.length + 1,
        itemBuilder: (_, int index) {
          var child = index == _exams.length
              ? lastUpdateText
              : Center(
                  child: SizedBox(
                    width: min(MediaQuery.of(context).size.width, 600),
                    child: _ExamCard(_exams[index]),
                  ),
                );

          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 250),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: child,
              ),
            ),
          );
        },
      );
    else
      body = EmptyErrorList();

    return RefreshIndicator(
      displacement: 40 + Scaffold.of(context).appBarMaxHeight,
      onRefresh: _handleUpdate,
      child: Scrollbar(child: body),
    );
  }
}

class _ExamCard extends StatelessWidget {
  final Exams_Exam _exam;

  _ExamCard(this._exam);

  @override
  Widget build(BuildContext context) {
    var languageCode = Localizations.localeOf(context).languageCode;
    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              _exam.courseName,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Text(
            '${DateFormat.yMMMd(languageCode).format(_exam.begin.toDateTime().toLocal())} '
            '${'General_Weekday${_exam.begin.toDateTime().toLocal().weekday}'.tr()} '
            '${TimeOfDay.fromDateTime(_exam.begin.toDateTime().toLocal()).format(context)} - '
            '${TimeOfDay.fromDateTime(_exam.end.toDateTime().toLocal()).format(context)} ',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Divider(height: 5, color: Colors.transparent),
          Text(_exam.venue),
          Text('${_exam.type}, ${_exam.status}'),
        ],
      ),
    );
  }
}
