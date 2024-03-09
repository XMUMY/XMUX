import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:maintenance/maintenance.dart';

import '../../../foundation/localization/locale_keys.dart';
import '../../redux/store.dart';
import 'faq.dart';
import 'form.dart';
import 'my_requests.dart';

class MaintenancePage extends StatelessWidget {
  final maintenanceApi = Maintenance(
    store.state.user.campusId,
    store.state.user.password,
  );

  MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.Campus_Maintenance.tr()),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: LocaleKeys.Campus_MaintenanceMyRequests.tr()),
              const Tab(text: 'FAQ'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MyRequestsPage(maintenanceApi: maintenanceApi),
            const FaqList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  RequestFormPage(maintenanceApi: maintenanceApi),
            ));
          },
        ),
      ),
    );
  }
}
