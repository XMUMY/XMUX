import 'package:flutter/material.dart';
import 'my_question_page.dart' as myQPage;
import 'submit_form_page.dart';
import 'faq_page.dart';
import 'package:xmux/globals.dart';

class MaintenancePage extends StatefulWidget {

  @override
  _MaintenancePageState createState() => new _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Campus/Tools/Maintenance', context)),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.question_answer),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FaqPage(store.state.authState.campusID, store.state.authState.campusIDPassword)));
            },
          )
        ],
        bottom: TabBar(
          tabs: <Tab>[
            Tab(
              text: i18n('Campus/Tools/Maintenance/FormPage', context),
            ),
            Tab(
              text: i18n('Campus/Tools/Maintenance/MyComplaint', context),
            ),
          ],
          controller: controller,
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          SubmitFormPage(store.state.authState.campusID, store.state.authState.campusIDPassword),
          myQPage.MyQuestionsPage(store.state.authState.campusID, store.state.authState.campusIDPassword),
        ],
      ),
    );
  }
}
