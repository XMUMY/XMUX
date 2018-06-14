import 'package:flutter/material.dart';
import 'package:xmux/translations/translation.dart';

class PublicTalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Public Talks"),
        bottom: TabBar(isScrollable: false, tabs: <Tab>[
          Tab(
            text: MainLocalizations.of(context).get("Calendar/Classes"),
          ),
          Tab(
            text: MainLocalizations.of(context).get("Calendar/Exams"),
          ),
        ]),
      ),
    );
  }
}
