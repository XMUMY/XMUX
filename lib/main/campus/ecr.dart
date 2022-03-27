import 'package:aaos/ecr.dart';
import 'package:aaos/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../component/empty_error.dart';
import '../../global.dart';
import '../../util/screen.dart';

class ElectiveCourseRegistrationPage extends StatefulWidget {
  const ElectiveCourseRegistrationPage({Key? key}) : super(key: key);

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
                child: Text(
                  LocaleKeys.Campus_ECRRegisteredCourses.tr(),
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisteredCoursesPage(
                      ecr: ecr,
                      entry: session.registered,
                    ),
                  ),
                ),
              ),
            if (session.entry.startsWith('/'))
              TextButton(
                child: Text('Entry'),
                onPressed: () {},
              ),
          ],
        ),
      ],
    );
  }
}

class RegisteredCoursesPage extends StatefulWidget {
  final ElectiveCourseRegistration ecr;
  final String entry;

  const RegisteredCoursesPage({
    Key? key,
    required this.ecr,
    required this.entry,
  }) : super(key: key);

  @override
  State<RegisteredCoursesPage> createState() => _RegisteredCoursesPageState();
}

class _RegisteredCoursesPageState extends State<RegisteredCoursesPage> {
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

// class ElectiveCourseRegistrationFormPage extends StatefulWidget {
//   final ElectiveCourseRegistrationForm ecrForm;

//   const ElectiveCourseRegistrationFormPage(this.ecrForm);

//   @override
//   _ElectiveCourseRegistrationFormPageState createState() =>
//       _ElectiveCourseRegistrationFormPageState();
// }

// class _ElectiveCourseRegistrationFormPageState
//     extends State<ElectiveCourseRegistrationFormPage> {
//   final _scrollController = ScrollController();

//   /// Key for info Card.
//   final _generalInfoKey = GlobalKey();

//   /// Top padding for info card instead of `SafeArea`.
//   var _infoCardPadding = 0.0;

//   /// Refresh form.
//   void onRefresh() async {
//     if (widget.ecrForm == null) return;
//     await widget.ecrForm.refresh();
//     if (mounted) setState(() {});
//   }

//   /// Add course and refresh.
//   void onAdd(String id) async {
//     await widget.ecrForm.add(id);
//     if (mounted) setState(() {});
//   }

//   /// Delete course and refresh.
//   void onDel(String id, {String name}) async {
//     var res = await showDialog<bool>(
//         context: context,
//         barrierDismissible: false,
//         builder: (ctx) {
//           return AlertDialog(
//             title: Text(
//                 i18n('Campus/AcademicTools/ECR/Form/CancelWarning', context)),
//             content: Text(name),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text(i18n('Campus/AcademicTools/ECR/Form/Yes', context)),
//                 onPressed: () => Navigator.of(context).pop(true),
//               ),
//               FlatButton(
//                 child: Text(i18n('Campus/AcademicTools/ECR/Form/No', context)),
//                 onPressed: () => Navigator.of(context).pop(false),
//               ),
//             ],
//           );
//         });
//     if (!res) return;
//     await widget.ecrForm.cancel(id);
//     if (mounted) setState(() {});
//   }

//   /// When listening for full courses.
//   void onListen(CourseUnselected course) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (ctx) {
//         if (!widget.ecrForm.isListening) {
//           widget.ecrForm.listen(course, () {
//             widget.ecrForm.cancelListener();
//             Navigator.of(ctx).pop();
//           });
//         }
//         return AlertDialog(
//           title: Text(i18n('Campus/AcademicTools/ECR/Form/Listening', context)),
//           content: Text(
//               i18n('Campus/AcademicTools/ECR/Form/ListeningInfo', context)),
//           actions: <Widget>[
//             FlatButton(
//               onPressed: () {
//                 widget.ecrForm.cancelListener();
//                 Navigator.of(ctx).pop();
//               },
//               child:
//                   Text(i18n('Campus/AcademicTools/ECR/Form/Cancel', context)),
//             )
//           ],
//         );
//       },
//     );
//   }

//   @override
//   void initState() {
//     // Manually refresh when init.
//     onRefresh();

//     // Add listener to add & remove padding to info card.
//     _scrollController.addListener(() {
//       var topPadding = MediaQuery.of(context).padding.top;
//       RenderBox box = _generalInfoKey.currentContext.findRenderObject();
//       var cardPosition = box.localToGlobal(Offset.zero);
//       if (cardPosition.dy < topPadding)
//         setState(() => _infoCardPadding =
//             min(_infoCardPadding + (topPadding - cardPosition.dy), 24));
//       else if (cardPosition.dy > topPadding && !topPadding.isNegative)
//         setState(() => _infoCardPadding =
//             max(_infoCardPadding - (cardPosition.dy - topPadding), 0));
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.ecrForm == null
//           ? EmptyErrorPage()
//           : widget.ecrForm.data == null
//               ? SpinKitFoldingCube(color: Colors.black38)
//               : CustomScrollView(
//                   controller: _scrollController,
//                   slivers: buildSlivers(),
//                 ),
//     );
//   }

//   List<Widget> buildSlivers() {
//     return <Widget>[
//       SliverAppBar(
//           title: Text(i18n('Campus/AcademicTools/ECR/Title', context)),
//           elevation: 0,
//           forceElevated: true,
//           floating: true,
//           backgroundColor: Colors.lightBlue,
//           actions: <Widget>[
//             IconButton(icon: Icon(Icons.refresh), onPressed: onRefresh)
//           ]),
//       SliverPersistentHeader(
//         pinned: true,
//         delegate: _SliverGeneralInfoTable(
//             topPadding: _infoCardPadding,
//             generalInfoKey: _generalInfoKey,
//             generalInfo: widget.ecrForm.data.formGeneralInfo),
//       ),

//       // Registered courses.
//       SliverToBoxAdapter(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               i18n('Campus/AcademicTools/ECR/Form/Selected', context),
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             Divider(height: 10),
//           ],
//         ),
//       )),
//       SliverList(
//         delegate: SliverChildBuilderDelegate((ctx, index) {
//           var course = widget.ecrForm.data.coursesSelected[index];
//           return Padding(
//             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//             child: RaisedButton(
//               padding: const EdgeInsets.all(15),
//               color: Theme.of(context).cardColor,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     course.name,
//                     style: Theme.of(context).textTheme.subtitle1,
//                   ),
//                   Divider(height: 8),
//                   Text('${course.lecturer}\n'
//                       '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
//                       '${course.credit}  '
//                       '${i18n('Campus/AcademicTools/ECR/Form/Quota', context)}'
//                       '${course.numChosen}/${course.quota}'),
//                   Text(course.timeAndVenue,
//                       style: Theme.of(context).textTheme.caption)
//                 ],
//               ),
//               onPressed: course.cancel.isEmpty
//                   ? null
//                   : () => onDel(course.cancel, name: course.name),
//             ),
//           );
//         }, childCount: widget.ecrForm.data.coursesSelected.length),
//       ),

//       // Unregistered courses.
//       SliverToBoxAdapter(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text(
//                 i18n('Campus/AcademicTools/ECR/Form/Unselected', context),
//                 style: Theme.of(context).textTheme.headline6,
//               ),
//               Divider(height: 10),
//             ],
//           ),
//         ),
//       ),
//       SliverList(
//         delegate: SliverChildBuilderDelegate((ctx, index) {
//           var course = widget.ecrForm.data.coursesList[index];
//           return Padding(
//             padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//             child: RaisedButton(
//               padding: const EdgeInsets.all(15),
//               color: Theme.of(context).cardColor,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7)),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     course.name,
//                     style: Theme.of(context).textTheme.subtitle1,
//                   ),
//                   Divider(height: 8),
//                   Text('${course.lecturer}\n'
//                       '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
//                       '${course.credit}  '
//                       '${i18n('Campus/AcademicTools/ECR/Form/Quota', context)}'
//                       '${course.numChosen}/${course.quota}'),
//                   Text(course.timeAndVenue,
//                       style: Theme.of(context).textTheme.caption)
//                 ],
//               ),
//               onPressed: course.canSelect
//                   ? () => onAdd(course.option)
//                   : course.canListen
//                       ? () => onListen(course)
//                       : null,
//             ),
//           );
//         }, childCount: widget.ecrForm.data.coursesList.length),
//       ),
//     ];
//   }
// }

// class _SliverGeneralInfoTable extends SliverPersistentHeaderDelegate {
//   final double topPadding;
//   final Key generalInfoKey;
//   final FormGeneralInfo generalInfo;

//   _SliverGeneralInfoTable(
//       {this.topPadding, this.generalInfoKey, this.generalInfo});

//   @override
//   double get minExtent => topPadding + 70;

//   @override
//   double get maxExtent => topPadding + 70;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     var card = Card(
//       key: generalInfoKey,
//       margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//       elevation: topPadding == 0 ? 1 : 3,
//       shape: RoundedRectangleBorder(),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           children: <Widget>[
//             Text(
//               '${generalInfo.round}: ${generalInfo.stage}',
//               style: Theme.of(context).textTheme.subtitle1,
//             ),
//             Text(
//               '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
//               '${generalInfo.maxCredit}  '
//               '${i18n('Campus/AcademicTools/ECR/Form/CreditChosen', context)}'
//               '${generalInfo.chosenCredit}',
//               style: Theme.of(context).textTheme.subtitle2,
//             ),
//           ],
//         ),
//       ),
//     );

//     return SizedBox.expand(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           AnimatedContainer(
//             height: topPadding,
//             duration: const Duration(milliseconds: 200),
//             decoration: BoxDecoration(color: Theme.of(context).cardColor),
//           ),
//           card,
//         ],
//       ),
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverGeneralInfoTable oldDelegate) {
//     return topPadding != oldDelegate.topPadding ||
//         generalInfo != oldDelegate.generalInfo;
//   }
// }
