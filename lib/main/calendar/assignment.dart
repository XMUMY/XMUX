import 'dart:math';

import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:moodle/model/assignment.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../component/empty_error.dart';
import '../../global.dart';
import '../../redux/action/action.dart';
import '../../redux/state/state.dart';
import '../../util/screen.dart';

class AssignmentPage extends StatelessWidget {
  const AssignmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<AssignmentCourse>>(
      distinct: true,
      converter: (s) => s.state.queries.assignments,
      builder: (context, assignments) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: AssignmentList(assignments: assignments),
        );
      },
    );
  }
}

class AssignmentList extends StatefulWidget {
  final List<AssignmentCourse> assignments;

  const AssignmentList({Key? key, required this.assignments}) : super(key: key);

  @override
  _AssignmentListState createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList>
    with AutomaticKeepAliveClientMixin {
  Assignment? _selectedAssignment;
  final _doing = <ExpansionPanelRadio>[];
  final _expired = <ExpansionPanelRadio>[];

  Future<void> _handleUpdate() async {
    var action = UpdateAssignmentsAction();
    store.dispatch(action);
    await action.future;
  }

  void _updateExpansionPanelRadio() {
    final now = DateTime.now();

    _doing.clear();
    for (var course in widget.assignments) {
      for (var assignment in course.assignments) {
        if (assignment.dueDate.isAfter(now)) {
          _doing.add(_buildExpansionPanelRadio(
            course,
            course.assignments.where((a) => a.dueDate.isAfter(now)),
          ));
          break;
        }
      }
    }

    _expired.clear();
    for (var course in widget.assignments) {
      for (var assignment in course.assignments) {
        if (assignment.dueDate.isBefore(now)) {
          _expired.add(_buildExpansionPanelRadio(
            course,
            course.assignments.where((a) => a.dueDate.isBefore(now)),
          ));
          break;
        }
      }
    }
  }

  ExpansionPanelRadio _buildExpansionPanelRadio(
    AssignmentCourse course,
    Iterable<Assignment> assignments,
  ) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return ExpansionPanelRadio(
      value: course.id,
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
              closedShape: const RoundedRectangleBorder(),
              closedBuilder: (context, open) => ListTile(
                dense: true,
                title: Text(assignment.name),
                subtitle: Text(
                  '${DateFormat.yMMMd(languageCode).format(assignment.dueDate)} '
                  '${DateFormat.Hms(languageCode).format(assignment.dueDate)}',
                ),
                onTap: () {
                  _selectedAssignment = assignment;
                  if (context.isBetween(Breakpoint.extraSmall) ||
                      context.isBetween(Breakpoint.small1)) {
                    open();
                  } else {
                    setState(() {});
                  }
                },
              ),
              openBuilder: (context, _) =>
                  AssignmentDetail(assignment: assignment),
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    _updateExpansionPanelRadio();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AssignmentList oldWidget) {
    _updateExpansionPanelRadio();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget child;
    if (widget.assignments.isNotEmpty) {
      child = ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: <Widget>[
          Text(
            LocaleKeys.Calendar_AssignmentsDoing.tr(),
            style: Theme.of(context).textTheme.headline6,
          ),
          const Divider(),
          ExpansionPanelList.radio(children: _doing),
          const Divider(color: Colors.transparent),
          Text(
            LocaleKeys.Calendar_AssignmentsExpired.tr(),
            style: Theme.of(context).textTheme.headline6,
          ),
          const Divider(),
          ExpansionPanelList.radio(children: _expired),
        ],
      );
    } else {
      child = const EmptyErrorList();
    }

    if (!(context.isBetween(Breakpoint.extraSmall) ||
        context.isBetween(Breakpoint.small1) ||
        widget.assignments.isEmpty)) {
      child = Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: child,
          ),
          Expanded(
            flex: max(MediaQuery.of(context).size.width ~/ 400 - 1, 1),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _selectedAssignment == null
                  ? Container()
                  : AssignmentDetail(
                      key: ValueKey(_selectedAssignment),
                      assignment: _selectedAssignment!,
                      isPage: false,
                    ),
            ),
          ),
        ],
      );
    }

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: child,
    );
  }
}

class AssignmentDetail extends StatelessWidget {
  final Assignment assignment;

  /// Whether the detail is shown as an independent page.
  final bool isPage;

  const AssignmentDetail({
    Key? key,
    required this.assignment,
    this.isPage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    final detail = ListView(
      padding: EdgeInsets.fromLTRB(
          isPage ? context.padBody : 0, 4, isPage ? context.padBody : 16, 4),
      children: <Widget>[
        if (!isPage)
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              assignment.name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (assignment.intro.isNotEmpty ||
            assignment.introAttachments.isNotEmpty)
          Card(
            child: Padding(
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
                        SizedBox(
                          width: 80,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.insert_drive_file),
                                iconSize: 50,
                                onPressed: () =>
                                    launch(moodle.withToken(attachment.url)),
                              ),
                              Text(
                                attachment.name,
                                style: Theme.of(context).textTheme.caption,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Text(
                  LocaleKeys.Calendar_AssignmentsDueDate.tr(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Divider(height: 5, color: Colors.transparent),
                Text(
                  '${DateFormat.yMMMEd(languageCode).format(assignment.dueDate)} '
                  '${DateFormat.Hms(languageCode).format(assignment.dueDate)}',
                ),
                const Divider(color: Colors.transparent),
                Text(
                  'Allow Submission From',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Divider(height: 5, color: Colors.transparent),
                Text(
                  '${DateFormat.yMMMEd(languageCode).format(assignment.allowSubmissionFromDate)} '
                  '${DateFormat.Hms(languageCode).format(assignment.allowSubmissionFromDate)}',
                ),
              ],
            ),
          ),
        )
      ],
    );

    if (isPage) {
      return Scaffold(
        appBar: AppBar(
          title: Text(assignment.name),
        ),
        body: detail,
      );
    }

    return detail;
  }
}
