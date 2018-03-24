import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/assignment.dart';
import 'package:xmux/mainapp/calendar/exams.dart';
import 'package:xmux/mainapp/calendar/timetable.dart';
import 'package:xmux/initapp/init.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/translations/translation.dart';
import 'package:zoomable_image/zoomable_image.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: new Scaffold(
          appBar: new AppBar(
            leading: new StoreConnector(
              converter: (store) =>
                  () => store.dispatch(new OpenDrawerAction(true)),
              builder: (context, callback) {
                return new IconButton(
                    icon: new Icon(Icons.view_list), onPressed: callback);
              },
            ),
            title: new Text(MainLocalizations.of(context).get("calendar")),
            actions: <Widget>[
              new IconButton(
                  icon: new Icon(FontAwesomeIcons.calendarAltO),
                  onPressed: () {
                    Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new ZoomableImage(
                                new CachedNetworkImageProvider(
                                    "https://${BackendApiConfig.resourceAddress}/image/cal_undergraduate.jpg"),
                                scale: 1.5),
                          ),
                        );
                  })
            ],
            bottom: new TabBar(isScrollable: false, tabs: <Tab>[
              new Tab(
                text: MainLocalizations.of(context).get("calendar/classes"),
              ),
              new Tab(
                text: MainLocalizations.of(context).get("calendar/exams"),
              ),
              new Tab(
                text: MainLocalizations.of(context).get("calendar/assignments"),
              ),
            ]),
          ),
          body: new StoreConnector(
              builder: (BuildContext context, acState) =>
                  new TabBarView(children: <Widget>[
                    acState.timetable == null
                        ? new EmptyErrorPage()
                        : new TimeTablePage(acState.timetable),
                    acState.exams == null
                        ? new EmptyErrorPage()
                        : new ExamsPage(acState.exams),
                    acState.assignments == null
                        ? new EmptyErrorPage()
                        : new AssignmentPage(acState.assignments),
                  ]),
              converter: (s) => s.state.acState)),
    );
  }
}
