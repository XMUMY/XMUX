import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/mainapp/home/announcements.dart';
import 'package:xmux/mainapp/home/home_slider.dart';
import 'package:xmux/mainapp/home/homepage_handler.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/states/state.dart';
import 'package:xmux/translations/translation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: CircleAvatar(
              radius: 18.0,
              backgroundImage: NetworkImage(firebaseUser?.photoUrl ?? ""),
            ),
            onPressed: () => mainAppStore.dispatch(OpenDrawerAction(true)),
          ),
          title: Text(MainLocalizations.of(context).get("Home")),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await HomePageHandler.updateNews(context: context);
            await HomePageHandler.updateAnnouncements(context: context);
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
            ],
          ),
        ),
      );
}
