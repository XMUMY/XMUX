import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.ecrForm == null ? ErrorWidgets.emptyErrorPage : Container(),
    );
  }
}
