import 'package:aaos/ecr.dart';
import 'package:aaos/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../component/empty_error.dart';
import '../../component/floating_card.dart';
import '../../global.dart';
import '../../util/screen.dart';

class ElectiveCourseRegistrationPage extends StatefulWidget {
  const ElectiveCourseRegistrationPage({super.key});

  @override
  State<ElectiveCourseRegistrationPage> createState() =>
      _ElectiveCourseRegistrationPageState();
}

class _ElectiveCourseRegistrationPageState
    extends State<ElectiveCourseRegistrationPage> {
  final ecr = ElectiveCourseRegistration(
    store.state.user.campusId,
    store.state.user.password,
  );

  List<ElectiveSession>? sessions;

  Future<void> loadSessions() async {
    await ecr.ensureSignedIn();
    sessions = await ecr.sessions;
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    loadSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sessions = this.sessions;

    Widget body = const EmptyErrorList();
    if (sessions != null && sessions.isNotEmpty) {
      body = ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        itemCount: sessions.length,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 6),
            child: _buildCardBody(sessions[index]),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Campus_ECR.tr())),
      body: sessions == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadSessions,
              child: body,
            ),
    );
  }

  Widget _buildCardBody(ElectiveSession session) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          session.classification,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Divider(height: 8),
        Text(
          '${session.round}  '
          '${LocaleKeys.Campus_ECRMaxCredit.tr()}'
          '${session.maxCredit.toString()}\n'
          '${LocaleKeys.Campus_ECRStartTime.tr()}'
          '${DateFormat.yMMMd(languageCode).format(session.period.start)} ${DateFormat.Hm(languageCode).format(session.period.start)}\n'
          '${LocaleKeys.Campus_ECREndTime.tr()}'
          '${DateFormat.yMMMd(languageCode).format(session.period.end)} ${DateFormat.Hm(languageCode).format(session.period.end)}',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (session.registered.isNotEmpty)
              TextButton(
                child: Text(LocaleKeys.Campus_ECRRegisteredCourses.tr()),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => _RegisteredCoursesPage(
                      ecr: ecr,
                      entry: session.registered,
                    ),
                  ),
                ),
              ),
            if (session.entry.startsWith('/student/index.php?c=Xk&'))
              TextButton(
                child: Text(LocaleKeys.Campus_ECREditRegistration.tr()),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => _EditRegistrationPage(
                      ecr: ecr,
                      entry: session.entry,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _RegisteredCoursesPage extends StatefulWidget {
  final ElectiveCourseRegistration ecr;
  final String entry;

  const _RegisteredCoursesPage({
    required this.ecr,
    required this.entry,
  });

  @override
  State<_RegisteredCoursesPage> createState() => _RegisteredCoursesPageState();
}

class _RegisteredCoursesPageState extends State<_RegisteredCoursesPage> {
  List<CourseRegistered>? courses;

  Future<void> loadRegistered() async {
    final ecr = widget.ecr;
    await ecr.ensureSignedIn();
    courses = await ecr.getRegistered(widget.entry);
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    loadRegistered();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final courses = this.courses;

    Widget body = const EmptyErrorList();
    if (courses != null && courses.isNotEmpty) {
      body = ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        itemCount: courses.length,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: _buildCardBody(courses[index]),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.Campus_ECRRegisteredCourses.tr())),
      body: courses == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadRegistered,
              child: body,
            ),
    );
  }

  Widget _buildCardBody(CourseRegistered course) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          course.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Divider(height: 8),
        Text(
          'Week ${course.week} '
          'Credit: ${course.credit}\n'
          'Lecturer: ${course.lecturer}\n'
          '${course.timeAndVenue}',
        ),
      ],
    );
  }
}

class _EditRegistrationPage extends StatefulWidget {
  final ElectiveCourseRegistration ecr;
  final String entry;

  const _EditRegistrationPage({
    required this.ecr,
    required this.entry,
  });

  @override
  State<_EditRegistrationPage> createState() => _EditRegistrationPageState();
}

class _EditRegistrationPageState extends State<_EditRegistrationPage> {
  late final ElectiveCourseRegistrationForm form;

  /// Refresh form.
  Future<void> refresh() async {
    await form.refresh();
    if (mounted) setState(() {});
  }

  /// Add course and refresh.
  void add(String id) async {
    setState(() => form.data = null);
    await form.add(id);
    if (mounted) setState(() {});
  }

  /// Drop course and refresh.
  void drop(String id, {String? name}) async {
    final resp = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Drop $name'),
            actions: <Widget>[
              TextButton(
                child: Text(MaterialLocalizations.of(context).okButtonLabel),
                onPressed: () => Navigator.of(context).pop(true),
              ),
              TextButton(
                child: Text(
                  MaterialLocalizations.of(context).cancelButtonLabel,
                ),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ],
          );
        });
    if (resp != true) return;
    setState(() => form.data = null);
    await form.drop(id);
    if (mounted) setState(() {});
  }

  /// Listen for full courses.
  void listen(CourseUnselected course) {
    if (!store.state.settings.enableDevFunctions) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        form.listen(course).then((_) {
          setState(() {});
          Navigator.of(ctx).pop();
        });
        return AlertDialog(
          title: const Text('Grabbing...'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                form.cancel();
                Navigator.of(ctx).pop();
              },
              child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    form = widget.ecr.getForm(widget.entry)!;
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = form.data;

    Widget body = const Center(child: CircularProgressIndicator());
    if (data != null) {
      body = RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: context.padBody,
          ),
          children: [
            Text(
              LocaleKeys.Campus_ECRRegisteredCourses.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            for (final course in data.coursesSelected)
              FloatingCard(
                onTap: () => drop(course.cancel, name: course.name),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Divider(height: 8),
                    Text(
                      'Week ${course.week} '
                      'Credit: ${course.credit} '
                      'Quota:${course.numChosen}/${course.quota}\n'
                      'Lecturer: ${course.lecturer}\n'
                      '${course.timeAndVenue}',
                    ),
                  ],
                ),
              ),
            const Divider(color: Colors.transparent),
            // Unselected courses.
            Text(
              LocaleKeys.Campus_ECR.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Divider(),
            for (final course in data.coursesList)
              FloatingCard(
                onTap: () => add(course.option),
                onLongPress: () => listen(course),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Divider(height: 8),
                    Text(
                      'Week ${course.week} '
                      'Credit: ${course.credit} '
                      'Quota:${course.numChosen}/${course.quota}\n'
                      'Lecturer: ${course.lecturer}\n'
                      '${course.timeAndVenue}',
                    ),
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data == null
              ? LocaleKeys.Campus_ECREditRegistration.tr()
              : '${data.formGeneralInfo.stage} (${data.formGeneralInfo.chosenCredit}/${data.formGeneralInfo.maxCredit})',
        ),
      ),
      body: body,
    );
  }
}
