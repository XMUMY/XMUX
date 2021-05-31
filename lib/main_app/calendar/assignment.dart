import 'dart:math';

import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:moodle/model/assignment.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/empty_error.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/actions/actions.dart';

class AssignmentPage extends StatefulWidget {
  final List<AssignmentCourse> assignments;

  AssignmentPage(this.assignments);

  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  Assignment _selectedAssignment;

  Future<void> _handleUpdate() async {
    var action = UpdateAssignmentsAction();
    store.dispatch(action);
    await action.future;
  }

  ExpansionPanelRadio _buildExpansionPanel(BuildContext context,
      AssignmentCourse course, Iterable<Assignment> assignments) {
    var languageCode = Localizations.localeOf(context).languageCode;

    return ExpansionPanelRadio(
      canTapOnHeader: true,
      headerBuilder: (context, isExpanded) => ListTile(
        title: Text(
          course.fullName,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      body: Column(
        children: <Widget>[
          for (var assignment in assignments)
            OpenContainer(
              closedColor: Theme.of(context).cardColor,
              closedShape: RoundedRectangleBorder(),
              closedBuilder: (context, open) => ListTile(
                dense: true,
                title: Text(assignment.name),
                subtitle: Text(
                  '${DateFormat.yMMMd(languageCode).format(assignment.dueDate)} '
                  '${DateFormat.Hms(languageCode).format(assignment.dueDate)}',
                ),
                onTap: () => MediaQuery.of(context).size.width < 720
                    ? open()
                    : setState(() => _selectedAssignment = assignment),
              ),
              openBuilder: (context, _) => AssignmentDetail(assignment),
            ),
        ],
      ),
      value: course.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var now = DateTime.now();

    Widget list;
    if (widget.assignments.isNotEmpty)
      list = ListView(
        padding: MediaQuery.of(context).padding.copyWith(left: 8, right: 8),
        children: <Widget>[
          Divider(height: 8, color: Colors.transparent),
          ExpansionPanelList.radio(
            children: <ExpansionPanelRadio>[
              for (var course in widget.assignments)
                if (course.assignments.firstWhere((a) => a.dueDate.isAfter(now),
                        orElse: () => null) !=
                    null)
                  _buildExpansionPanel(context, course,
                      course.assignments.where((a) => a.dueDate.isAfter(now))),
            ],
          ),
          Divider(color: Colors.transparent),
          Text(
            LocaleKeys.Calendar_AssignmentsExpired.tr(),
            style: Theme.of(context).textTheme.headline6,
          ),
          Divider(),
          ExpansionPanelList.radio(
            children: <ExpansionPanelRadio>[
              for (var course in widget.assignments)
                if (course.assignments.firstWhere(
                        (element) => element.dueDate.isBefore(now),
                        orElse: () => null) !=
                    null)
                  _buildExpansionPanel(context, course,
                      course.assignments.where((a) => a.dueDate.isBefore(now))),
            ],
          ),
          Divider(height: 8, color: Colors.transparent),
        ],
      );
    else
      list = EmptyErrorList();

    Widget child;
    if (width < 720 || widget.assignments.isEmpty)
      child = list;
    else
      // Show details in right column.
      child = Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: list,
          ),
          Expanded(
            flex: max(width ~/ 350 - 1, 1),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _selectedAssignment == null
                  ? Container()
                  : AssignmentDetail(
                      _selectedAssignment,
                      key: ValueKey(_selectedAssignment),
                      withAppBar: false,
                    ),
            ),
          ),
        ],
      );

    return RefreshIndicator(
      displacement: 40 + Scaffold.of(context).appBarMaxHeight,
      onRefresh: _handleUpdate,
      child: child,
    );
  }
}

class AssignmentDetail extends StatelessWidget {
  final Assignment assignment;

  /// Whether an appbar should be added to details.
  final bool withAppBar;

  AssignmentDetail(this.assignment, {Key key, this.withAppBar = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var padding = withAppBar
        ? const EdgeInsets.all(4)
        : MediaQuery.of(context).padding.copyWith(left: 4, right: 4);

    var languageCode = Localizations.localeOf(context).languageCode;

    var detail = ListView(
      padding: padding,
      children: <Widget>[
        if (assignment.intro.isNotEmpty ||
            assignment.introAttachments.isNotEmpty)
          FloatingCard(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  'Introduction',
                  style: Theme.of(context).textTheme.headline6,
                ),
                HtmlWidget(assignment.intro),

                // Intro attachments.
                Wrap(
                  children: <Widget>[
                    for (var attachment in assignment.introAttachments)
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.insert_drive_file),
                            iconSize: 50,
                            onPressed: () =>
                                launch(moodleApi.withToken(attachment.url)),
                          ),
                          SizedBox(
                            width: 85,
                            child: Text(
                              attachment.name,
                              style: Theme.of(context).textTheme.caption,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                  ],
                )
              ],
            ),
          ),
        FloatingCard(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                LocaleKeys.Calendar_AssignmentsDueDate.tr(),
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(height: 5, color: Colors.transparent),
              Text(
                '${DateFormat.yMMMEd(languageCode).format(assignment.dueDate)} '
                '${DateFormat.Hms(languageCode).format(assignment.dueDate)}',
              ),
              Divider(color: Colors.transparent),
              Text(
                'Allow Submission From',
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(height: 5, color: Colors.transparent),
              Text(
                '${DateFormat.yMMMEd(languageCode).format(assignment.allowSubmissionFromDate)} '
                '${DateFormat.Hms(languageCode).format(assignment.allowSubmissionFromDate)}',
              ),
            ],
          ),
        )
      ],
    );

    if (withAppBar)
      return Scaffold(
        appBar: AppBar(
          title: Text(assignment.name),
        ),
        body: detail,
      );

    return detail;
  }
}
