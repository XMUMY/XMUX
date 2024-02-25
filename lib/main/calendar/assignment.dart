import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:moodle/moodle.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../component/catalogue_content_layout.dart';
import '../../component/empty_error.dart';
import '../../global.dart';
import '../../redux/action/action.dart';
import '../../redux/state/state.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';

class AssignmentPage extends StatelessWidget implements TabEntry {
  const AssignmentPage({super.key});

  @override
  String get path => 'Assignment';

  @override
  String get label => LocaleKeys.Calendar_Assignments.tr();

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

  const AssignmentList({super.key, required this.assignments});

  @override
  State<AssignmentList> createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList>
    with AutomaticKeepAliveClientMixin {
  final _doing = <ExpansionPanelRadio>[];
  final _expired = <ExpansionPanelRadio>[];

  Assignment? _selectedAssignment;
  bool _isNarrow = false;

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
          style: Theme.of(context).textTheme.titleMedium,
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
                  if (_isNarrow) {
                    open();
                  } else {
                    setState(() => _selectedAssignment = assignment);
                  }
                },
              ),
              openColor: Theme.of(context).canvasColor,
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

    Widget list;
    if (widget.assignments.isNotEmpty) {
      list = ListView(
        primary: _isNarrow,
        padding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: Breakpoint.extraSmall.margin!,
        ),
        children: <Widget>[
          Text(
            LocaleKeys.Calendar_AssignmentsDoing.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          ExpansionPanelList.radio(children: _doing),
          const Divider(color: Colors.transparent),
          Text(
            LocaleKeys.Calendar_AssignmentsExpired.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          ExpansionPanelList.radio(children: _expired),
        ],
      );
    } else {
      list = const EmptyErrorList();
    }

    list = RefreshIndicator(
      onRefresh: _handleUpdate,
      child: list,
    );

    return CatalogueContentLayout(
      catalogueBuilder: (_, isNarrow) {
        _isNarrow = isNarrow;
        return list;
      },
      content: _selectedAssignment != null
          ? AssignmentDetail(
              key: ValueKey(_selectedAssignment),
              assignment: _selectedAssignment!,
              isPage: false,
            )
          : null,
    );
  }
}

class AssignmentDetail extends StatelessWidget {
  final Assignment assignment;

  /// Whether the detail is shown as an independent page.
  final bool isPage;

  const AssignmentDetail({
    super.key,
    required this.assignment,
    this.isPage = true,
  });

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    final detail = BodyPaddingBuilder(
      builder: (context, hPadding) => ListView(
        primary: isPage,
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: hPadding - 4, // -4px card margin.
        ),
        children: [
          if (!isPage)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                assignment.name,
                style: Theme.of(context).textTheme.titleLarge,
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
                      style: Theme.of(context).textTheme.titleLarge,
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
                                  onPressed: () => launchUrlString(
                                    moodle.withToken(attachment.url),
                                  ),
                                ),
                                Text(
                                  attachment.name,
                                  style: Theme.of(context).textTheme.bodySmall,
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
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Divider(height: 5, color: Colors.transparent),
                  Text(
                    '${DateFormat.yMMMEd(languageCode).format(assignment.dueDate)} '
                    '${DateFormat.Hms(languageCode).format(assignment.dueDate)}',
                  ),
                  const Divider(color: Colors.transparent),
                  Text(
                    'Allow Submission From',
                    style: Theme.of(context).textTheme.titleLarge,
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
      ),
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
