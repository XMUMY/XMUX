import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/moodle/models/assignment.dart';
import 'package:xmux/redux/actions/actions.dart';

class AssignmentPage extends StatefulWidget {
  final List<Course> assignments;

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
    var list = SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: ExpansionPanelList.radio(
        children: <ExpansionPanelRadio>[
          for (var course in widget.assignments)
            ExpansionPanelRadio(
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) => ListTile(
                title: Text(
                  course.fullName,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              body: Column(
                children: <Widget>[
                  for (var assignment in course.assignments)
                    ListTile(
                      onTap: () => width < 700
                          ? Navigator.of(context).push(FadePageRoute(
                              child: AssignmentDetail(assignment),
                            ))
                          : setState(() => _selectedAssignment = assignment),
                      title: Text(assignment.name),
                      subtitle: Text(
                        '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(assignment.dueDate)} '
                        '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(assignment.dueDate)}',
                      ),
                      dense: true,
                    ),
                ],
              ),
              value: course.id,
            ),
        ],
      ),
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
            child: _selectedAssignment == null
                ? Container()
                : AssignmentDetail(_selectedAssignment, withAppBar: false),
          ),
        ],
      );

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: child,
    );
  }
}

class AssignmentDetail extends StatelessWidget {
  final Assignment assignment;

  /// Whether an appbar should be added to details.
  final bool withAppBar;

  AssignmentDetail(this.assignment, {this.withAppBar = true});

  @override
  Widget build(BuildContext context) {
    var detail = ListView(
      padding: const EdgeInsets.all(5),
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
                'Due Date',
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
