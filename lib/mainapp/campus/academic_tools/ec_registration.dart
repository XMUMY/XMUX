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
      appBar: AppBar(title: Text('选课')),
      body: courses == null
          ? SpinKitFoldingCube(color: Colors.black38)
          : courses.isEmpty ? ErrorWidgets.emptyErrorPage : buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (ctx, index) {
        var course = courses[index];
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
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Row(
                  children: <Widget>[
                    Text('Max Credit:${course.maxCredit.toString()}   '),
                    Text(course.round)
                  ],
                ),
                Text(
                  'From ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(course.period.start)} '
                      'To ${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(course.period.start)}',
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
            onPressed: () {},
          ),
        );
      },
    );
  }
}
