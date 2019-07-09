import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/attendance/attendance.dart';

class SignInHistoryPage extends StatefulWidget {
  final api = AttendanceApi(BackendApiConfig.signInAddress);

  @override
  _SignInHistoryPageState createState() => _SignInHistoryPageState();
}

class _SignInHistoryPageState extends State<SignInHistoryPage> {
  List<AttendanceRecord> history;

  Future<Null> update() async {
    history = await widget.api.getHistory(store.state.authState.campusID);
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    update();
    super.initState();
  }

  Widget buildCard(int index) {
    var record = history[index];
    var course = store.state.acState.timetable.firstWhere(
        (c) => c.courseCode.toUpperCase() == record.cid,
        orElse: () => null);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
                '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(record.timestamp)} '
                '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(record.timestamp)}'),
            Text(course?.courseName ?? 'Unknown'),
            Text(record.message)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendace'),
      ),
      body: history == null
          ? CircularProgressIndicator()
          : history.isEmpty
              ? EmptyErrorPage()
              : RefreshIndicator(
                  onRefresh: update,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: history.length,
                    itemBuilder: (_, index) => buildCard(index),
                  ),
                ),
    );
  }
}
