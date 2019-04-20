import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/ec_registration/ec_registration.dart';
import 'package:xmux/modules/error_widgets/error_widgets.dart';

class ElectiveCourseRegistrationPage extends StatefulWidget {
  final ecr = ElectiveCourseRegistration(
      store.state.authState.campusID, store.state.authState.campusIDPassword);

  @override
  _ElectiveCourseRegistrationPageState createState() =>
      _ElectiveCourseRegistrationPageState();
}

class _ElectiveCourseRegistrationPageState
    extends State<ElectiveCourseRegistrationPage> {
  List<ElectiveCourse> courses;

  Future<Null> loadECRList() async {
    await widget.ecr.ensureLogin();
    courses = await widget.ecr.getList();
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    loadECRList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(i18n('Campus/AcademicTools/ECR/Title', context)),
          backgroundColor: Colors.lightBlue),
      body: courses == null
          ? SpinKitFoldingCube(color: Colors.black38)
          : courses.isEmpty
              ? ErrorWidgets.emptyErrorPage
              : RefreshIndicator(
                  child: buildBody(context), onRefresh: loadECRList),
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length + 1,
      itemBuilder: (ctx, index) {
        if (index == 0)
          return Padding(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              child: Text(i18n('Campus/AcademicTools/ECR/Warning', context)));
        var course = courses[index - 1];
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
          child: RaisedButton(
            padding: const EdgeInsets.all(15.0),
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  course.classification,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Divider(height: 8.0),
                Text('${course.round}  '
                    '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
                    '${course.maxCredit.toString()}'),
                Text('${i18n('Campus/AcademicTools/ECR/StartTime', context)}'
                    '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(course.period.start)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(course.period.start)}\n'
                    '${i18n('Campus/AcademicTools/ECR/EndTime', context)}'
                    '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(course.period.start)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(course.period.end)}  ')
              ],
            ),
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ElectiveCourseRegistrationFormPage(
                        widget.ecr.getForm(course.entry)),
                  ),
                ),
          ),
        );
      },
    );
  }
}

class ElectiveCourseRegistrationFormPage extends StatefulWidget {
  final ElectiveCourseRegistrationForm ecrForm;

  const ElectiveCourseRegistrationFormPage(this.ecrForm);

  @override
  _ElectiveCourseRegistrationFormPageState createState() =>
      _ElectiveCourseRegistrationFormPageState();
}

class _ElectiveCourseRegistrationFormPageState
    extends State<ElectiveCourseRegistrationFormPage> {
  final _scrollController = ScrollController();

  /// Key for info Card.
  final _generalInfoKey = GlobalKey();

  /// Top padding for info card instead of `SafeArea`.
  var _infoCardPadding = 0.0;

  /// Refresh form.
  void onRefresh() async {
    if (widget.ecrForm == null) return;
    await widget.ecrForm.refresh();
    if (mounted) setState(() {});
  }

  /// Add course and refresh.
  void onAdd(String id) async {
    await widget.ecrForm.add(id);
    if (mounted) setState(() {});
  }

  /// Delete course and refresh.
  void onDel(String id, {String name}) async {
    var res = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
                i18n('Campus/AcademicTools/ECR/Form/CancelWarning', context)),
            content: Text(name),
            actions: <Widget>[
              FlatButton(
                child: Text(i18n('Campus/AcademicTools/ECR/Form/Yes', context)),
                onPressed: () => Navigator.of(context).pop(true),
              ),
              FlatButton(
                child: Text(i18n('Campus/AcademicTools/ECR/Form/No', context)),
                onPressed: () => Navigator.of(context).pop(false),
              ),
            ],
          );
        });
    if (!res) return;
    await widget.ecrForm.cancel(id);
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    // Manually refresh when init.
    onRefresh();

    // Add listener to add & remove padding to info card.
    _scrollController.addListener(() {
      var topPadding = MediaQuery.of(context).padding.top;
      RenderBox box = _generalInfoKey.currentContext.findRenderObject();
      var cardPosition = box.localToGlobal(Offset.zero);
      if (cardPosition.dy < topPadding)
        setState(() => _infoCardPadding =
            min(_infoCardPadding + (topPadding - cardPosition.dy), 24));
      else if (cardPosition.dy > topPadding && !topPadding.isNegative)
        setState(() => _infoCardPadding =
            max(_infoCardPadding - (cardPosition.dy - topPadding), 0));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.ecrForm == null
          ? ErrorWidgets.emptyErrorPage
          : widget.ecrForm.data == null
              ? SpinKitFoldingCube(color: Colors.black38)
              : CustomScrollView(
                  controller: _scrollController,
                  slivers: buildSlivers(),
                ),
    );
  }

  List<Widget> buildSlivers() {
    return <Widget>[
      SliverAppBar(
          title: Text('选课'),
          elevation: 0.0,
          forceElevated: true,
          floating: true,
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: onRefresh)
          ]),
      SliverPersistentHeader(
        pinned: true,
        delegate: _SliverGeneralInfoTable(
            topPadding: _infoCardPadding,
            generalInfoKey: _generalInfoKey,
            generalInfo: widget.ecrForm.data.formGeneralInfo),
      ),

      // Registered courses.
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              i18n('Campus/AcademicTools/ECR/Form/Selected', context),
              style: Theme.of(context).textTheme.title,
            ),
            Divider(height: 10.0),
          ],
        ),
      )),
      SliverList(
        delegate: SliverChildBuilderDelegate((ctx, index) {
          var course = widget.ecrForm.data.coursesSelected[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: RaisedButton(
              padding: const EdgeInsets.all(15.0),
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    course.name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Divider(height: 8.0),
                  Text('${course.lecturer}\n'
                      '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
                      '${course.credit}  '
                      '${i18n('Campus/AcademicTools/ECR/Form/Quota', context)}'
                      '${course.numChosen}/${course.quota}'),
                  Text(course.timeAndVenue,
                      style: Theme.of(context).textTheme.caption)
                ],
              ),
              onPressed: course.cancel.isEmpty
                  ? null
                  : () => onDel(course.cancel, name: course.name),
            ),
          );
        }, childCount: widget.ecrForm.data.coursesSelected.length),
      ),

      // Unregistered courses.
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                i18n('Campus/AcademicTools/ECR/Form/Unselected', context),
                style: Theme.of(context).textTheme.title,
              ),
              Divider(height: 10.0),
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((ctx, index) {
          var course = widget.ecrForm.data.coursesList[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: RaisedButton(
              padding: const EdgeInsets.all(15.0),
              color: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    course.name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Divider(height: 8.0),
                  Text('${course.lecturer}\n'
                      '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
                      '${course.credit}  '
                      '${i18n('Campus/AcademicTools/ECR/Form/Quota', context)}'
                      '${course.numChosen}/${course.quota}'),
                  Text(course.timeAndVenue,
                      style: Theme.of(context).textTheme.caption)
                ],
              ),
              onPressed: course.canSelect ? () => onAdd(course.option) : null,
            ),
          );
        }, childCount: widget.ecrForm.data.coursesList.length),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((ctx, index) {
          return Text(index.toString());
        }, childCount: 100),
      ),
    ];
  }
}

class _SliverGeneralInfoTable extends SliverPersistentHeaderDelegate {
  final double topPadding;
  final Key generalInfoKey;
  final FormGeneralInfo generalInfo;

  _SliverGeneralInfoTable(
      {this.topPadding, this.generalInfoKey, this.generalInfo});

  @override
  double get minExtent => topPadding + 70.0;

  @override
  double get maxExtent => topPadding + 70.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var card = Card(
      key: generalInfoKey,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      elevation: topPadding == 0 ? 1.0 : 3.0,
      shape: RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              '${generalInfo.round}: ${generalInfo.stage}',
              style: Theme.of(context).textTheme.subhead,
            ),
            Text(
              '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
              '${generalInfo.maxCredit}  '
              '${i18n('Campus/AcademicTools/ECR/Form/CreditChosen', context)}'
              '${generalInfo.chosenCredit}',
              style: Theme.of(context).textTheme.subtitle,
            ),
          ],
        ),
      ),
    );

    return SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AnimatedContainer(
            height: topPadding,
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
          ),
          card,
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverGeneralInfoTable oldDelegate) {
    return topPadding != oldDelegate.topPadding ||
        generalInfo != oldDelegate.generalInfo;
  }
}
