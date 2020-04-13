import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/components/user_profile.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/calendar/timetable.dart';
import 'package:xmux/mainapp/home/announcements.dart';
import 'package:xmux/mainapp/home/home_slider.dart';
import 'package:xmux/modules/api/xmux_api.dart' show TimetableClass;
import 'package:xmux/redux/redux.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: StoreConnector<MainAppState, String>(
            converter: (s) =>
                s.state.user.profile?.avatar ??
                firebase.remoteConfigs.staticResources.defaultAvatar,
            builder: (context, s) => UserAvatar(
              url: s,
              radius: 18,
              heroTag: null,
            ),
          ),
          onPressed: () => store.dispatch(OpenDrawerAction(true)),
        ),
        title: Text(i18n('Home', context)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          var newsAction = UpdateHomepageNewsAction(context: context);
          var announcementsAction =
              UpdateHomepageAnnouncementsAction(context: context);
          store.dispatch(newsAction);
          store.dispatch(announcementsAction);
          await newsAction.listener;
          await announcementsAction.listener;
        },
        child: ListView(
          children: <Widget>[
            // Slider
            Container(
              child: HomeSlider(),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 18 * 9,
            ),

            // Announcements (if have)
            StoreConnector<MainAppState, List>(
              converter: (store) => store.state.uiState.announcements,
              builder: (_, announcements) => HomeAnnouncements(announcements),
            ),

            StoreConnector<MainAppState, List<TimetableClass>>(
              converter: (s) => s.state.queryState.timetable?.timetable ?? null,
              builder: (_, lessons) {
                if (lessons == null || lessons.isEmpty) return Container();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '   ${i18n('Home/NextClass', context)}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    LessonCard(TimeTablePage.sortTimetable(lessons)[0])
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
