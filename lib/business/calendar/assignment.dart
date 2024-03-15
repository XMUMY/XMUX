import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:moodle/moodle.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../component/catalogue_content_layout.dart';
import '../../component/empty_error.dart';
import '../../foundation/localization/locale_keys.dart';
import '../../global.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';
import '../redux/store.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  Assignment? _selectedAssignment;

  void onAssignmentSelected(Assignment assignment) {
    setState(() => _selectedAssignment = assignment);
  }

  @override
  Widget build(BuildContext context) {
    final selectedAssignment = _selectedAssignment;

    return StoreConnector<AppState, List<AssignmentCourse>>(
      distinct: true,
      converter: (s) => s.state.queries.assignments,
      builder: (context, assignments) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: CatalogueContentLayout(
            catalogue: AssignmentList(
              assignments: assignments,
              onAssignmentSelected: onAssignmentSelected,
            ),
            content: selectedAssignment != null
                ? AssignmentDetail(assignment: selectedAssignment)
                : null,
          ),
        );
      },
    );
  }
}

class AssignmentList extends StatefulWidget {
  final List<AssignmentCourse> assignments;
  final Function(Assignment)? onAssignmentSelected;

  const AssignmentList({
    super.key,
    required this.assignments,
    this.onAssignmentSelected,
  });

  @override
  State<AssignmentList> createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  final _doing = <ExpansionPanelRadio>[];
  final _expired = <ExpansionPanelRadio>[];

  Future<void> _handleUpdate() async {
    final action = UpdateAssignmentsAction();
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
              useRootNavigator: true,
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
                  if (context.isDualPane) {
                    widget.onAssignmentSelected?.call(assignment);
                  } else {
                    open();
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
  void didChangeDependencies() {
    _updateExpansionPanelRadio();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AssignmentList oldWidget) {
    if (oldWidget.assignments != widget.assignments) {
      _updateExpansionPanelRadio();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Widget list;
    if (widget.assignments.isNotEmpty) {
      list = ListView(
        primary: true,
        padding: CatalogueContentPadding.of(context) +
            const EdgeInsets.symmetric(vertical: 8),
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

    return list;
  }
}

class AssignmentDetail extends StatelessWidget {
  final Assignment assignment;

  const AssignmentDetail({
    super.key,
    required this.assignment,
  });

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    final detail = ListView(
      primary: true,
      padding: CatalogueContentPadding.of(context) +
          const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: -4, // -4px card margin.
          ),
      children: [
        if (context.isUnderCatalogueContentLayout)
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
    );

    if (!context.isUnderCatalogueContentLayout) {
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
