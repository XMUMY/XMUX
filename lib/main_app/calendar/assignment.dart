import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';
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

  @override
  Widget build(BuildContext context) {
    if (widget.assignments == null)
      return EmptyErrorButton(onRefresh: _handleUpdate);
    if (widget.assignments.isEmpty) return EmptyErrorPage();

    var width = MediaQuery.of(context).size.width;
    var now = DateTime.now();

    ExpansionPanelRadio buildExpansionPanel(
      AssignmentCourse course, {
      bool showBefore = true,
      showAfter = true,
    }) {
      var assignments = course.assignments
          .where((a) =>
              (showBefore && a.dueDate.isBefore(now)) ||
              (showAfter && a.dueDate.isAfter(now)))
          .toList();

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
                  onTap: () => width < 700
                      ? open()
                      : setState(() => _selectedAssignment = assignment),
                  title: Text(assignment.name),
                  subtitle: Text(
                    '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(assignment.dueDate)} '
                    '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(assignment.dueDate)}',
                  ),
                  dense: true,
                ),
                openBuilder: (context, _) => AssignmentDetail(assignment),
              ),
          ],
        ),
        value: course.id,
      );
    }

    var list = ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        /// App bar padding.
        SizedBox(height: Scaffold.of(context).appBarMaxHeight),

        ExpansionPanelList.radio(
          children: <ExpansionPanelRadio>[
            for (var course in widget.assignments)
              if (course.assignments.firstWhere(
                      (element) => element.dueDate.isAfter(now),
                      orElse: () => null) !=
                  null)
                buildExpansionPanel(course, showBefore: false),
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
                buildExpansionPanel(course, showAfter: false),
          ],
        ),

        /// Bottom navigation padding.
        SizedBox(height: kBottomNavigationBarHeight),
      ],
    );

    Widget child;
    if (width < 700)
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
            flex: width > 1000 ? 3 : 2,
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
    var detail = ListView(
      padding: const EdgeInsets.all(8),
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
                Html(data: assignment.intro),

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
                          Container(
                            width: 85,
                            margin: const EdgeInsets.only(bottom: 5),
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
                '${DateFormat.yMMMEd(Localizations.localeOf(context).languageCode).format(assignment.dueDate)} '
                '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(assignment.dueDate)}',
              ),
              Divider(height: 5, color: Colors.transparent),
              Text(
                'Allow Submission From',
                style: Theme.of(context).textTheme.headline6,
              ),
              Divider(height: 5, color: Colors.transparent),
              Text(
                '${DateFormat.yMMMEd(Localizations.localeOf(context).languageCode).format(assignment.allowSubmissionFromDate)} '
                '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(assignment.allowSubmissionFromDate)}',
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
