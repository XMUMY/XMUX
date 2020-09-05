import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/lazy_loading_list.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/maintenance/maintenance.dart';

part 'faq.dart';
part 'my_complaint.dart';
part 'request_form.dart';

class MaintenancePage extends StatelessWidget {
  final maintenance =
      Maintenance(store.state.user.campusId, store.state.user.password);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(i18n('Campus/Tools/Maintenance', context)),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: i18n('Campus/Tools/Maintenance/MyRequests', context)),
              Tab(text: 'FAQ'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MyComplaintsPage(maintenance),
            FaqPage(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context).push(FadePageRoute(
            child: RequestFormPage(maintenance),
            fullscreenDialog: true,
          )),
        ),
      ),
    );
  }
}
