import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';
import 'package:xmux/redux/redux.dart';
import 'package:xmux/translations/translation.dart';

class AssignmentPage extends StatelessWidget {
  final List<LessonAssignments> assignments;

  AssignmentPage(this.assignments);

  // Handle refresh.
  Future<Null> _handleUpdate() async {
    var action = UpdateAssignmentsAction();
    store.dispatch(action);
    await action.listener;
  }

  @override
  Widget build(BuildContext context) => new RefreshIndicator(
        onRefresh: _handleUpdate,
        child: assignments == null
            ? ErrorWidgets.emptyErrorButton(
                onRefresh: _handleUpdate,
              )
            : ListView.builder(
                itemCount: assignments.length,
                itemBuilder: (_, int index) {
                  return new _AssCard(
                      assignments[assignments.length - 1 - index]);
                }),
      );
}

class _AssCard extends StatelessWidget {
  final LessonAssignments assData;

  _AssCard(this.assData);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      assData.courseFullName,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                  new Column(
                    children: assData.assignments
                        .map((var e) => new _AssButton(e))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AssButton extends StatelessWidget {
  final Assignment _assDetail;
  final DateTime _assTime;

  _AssButton(this._assDetail) : _assTime = _assDetail.timestamp;

  @override
  Widget build(BuildContext context) {
    return new MaterialButton(
      onPressed: () {
        launch("https://l.xmu.edu.my/mod/assign/view.php?id=" +
            _assDetail.id.toString());
      },
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(
            _assDetail.name,
          ),
          new Text(
            new DateFormat.yMMMMEEEEd(
                    Localizations.localeOf(context).languageCode)
                .format(_assTime),
            style: Theme.of(context).textTheme.body1,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                new DateFormat.Hms(Localizations.localeOf(context).languageCode)
                    .format(_assTime),
                style: Theme.of(context).textTheme.body1,
              ),
              _assTime.isAfter(new DateTime.now())
                  ? new Text(
                      " (" +
                          _assTime
                              .difference(new DateTime.now())
                              .inDays
                              .toString() +
                          MainLocalizations.of(context)
                              .get("lostandfound/day") +
                          ")",
                      style: Theme.of(context).textTheme.body1)
                  : new Container(),
            ],
          ),
          new Divider(
            height: 5.0,
          )
        ],
      ),
    );
  }
}
