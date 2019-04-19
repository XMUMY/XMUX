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
          : courses.isEmpty ? ErrorWidgets.emptyErrorPage : buildBody(context),
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
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  course.classification,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Divider(height: 8.0),
                Text('${course.round} '
                    '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
                    '${course.maxCredit.toString()}'),
                Text('${i18n('Campus/AcademicTools/ECR/Time', context)}'
                    '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(course.period.start)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(course.period.start)} '
                    '- ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(course.period.start)} ${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(course.period.end)}  ')
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
  final _generalInfoKey = GlobalKey();

  var _infoCardIsPrimary = false;

  @override
  void initState() {
    widget.ecrForm?.refresh()?.then((_) {
      if (mounted) setState(() {});
    });

    _scrollController.addListener(() {
      final topPadding = MediaQuery.of(context).padding.top;
      RenderBox box = _generalInfoKey.currentContext.findRenderObject();
      var pos = box.localToGlobal(Offset.zero);
      if (pos.dy < topPadding && !_infoCardIsPrimary)
        setState(() => _infoCardIsPrimary = true);
      else if (pos.dy > topPadding && _infoCardIsPrimary)
        setState(() => _infoCardIsPrimary = false);
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
          floating: true),
      SliverPersistentHeader(
        pinned: true,
        delegate: _SliverGeneralInfoTable(
            primary: _infoCardIsPrimary,
            generalInfoKey: _generalInfoKey,
            generalInfo: widget.ecrForm.data.formGeneralInfo),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '已注册的课程',
                style: Theme.of(context).textTheme.title,
              ),
              Divider(height: 10.0),
            ],
          ),
        ),
      ),
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
                      Text('${course.timeAndVenue} '
                          '${i18n('Campus/AcademicTools/ECR/MaxCredit', context)}'
                          '${course.credit.toString()}'),
                    ],
                  ),
                  onPressed: () {}));
        }, childCount: widget.ecrForm.data.coursesSelected.length),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '可注册的课程',
                style: Theme.of(context).textTheme.title,
              ),
              Divider(height: 10.0),
            ],
          ),
        ),
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
  final bool primary;
  final Key generalInfoKey;
  final FormGeneralInfo generalInfo;

  _SliverGeneralInfoTable(
      {this.primary, this.generalInfoKey, this.generalInfo});

  @override
  double get minExtent => primary ? 76.0 : 60.0;

  @override
  double get maxExtent => primary ? 76.0 : 60.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var card = Card(
      key: generalInfoKey,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text('${generalInfo.round}: ${generalInfo.stage}'),
            Text(
                'Max Credit: ${generalInfo.maxCredit} Chosen: ${generalInfo.chosenCredit}'),
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
            height: primary ? MediaQuery.of(context).padding.top : 0.0,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
          ),
          card,
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverGeneralInfoTable oldDelegate) {
    return primary != oldDelegate.primary ||
        generalInfo != oldDelegate.generalInfo;
  }
}
