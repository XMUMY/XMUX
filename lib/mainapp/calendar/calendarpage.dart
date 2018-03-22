import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xmux/config.dart';
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
              converter: (store) {
                return () => store.dispatch(new OpenDrawerAction(true));
              },
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
                        ? new _ErrorPage()
                        : new ClassesPage(acState.timetable),
                    acState.exams == null
                        ? new _ErrorPage()
                        : new ExamsPage(acState.exams),
                    acState.assignments == null
                        ? new _ErrorPage()
                        : new AssignmentPage(acState.assignments),
                  ]),
              converter: (s) => s.state.acState)),
    );
  }
}

class _ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Card(
        color: Colors.white,
        child: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.error,
                size: 60.0,
                color: Theme.of(context).errorColor,
              ),
              new Divider(
                height: 20.0,
                color: Theme.of(context).cardColor,
              ),
              new Text(
                "Oh ! Nothing is here !\n\nPlease check:\n You are logined successfully.\nYour have connected to internet.",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
