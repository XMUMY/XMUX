import 'package:flutter/material.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v3.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<StudentAttendanceBrief> briefs;

  Future<Null> _handleUpdate() async {
    var resp = await XMUXApi.instance.getStudentAttendanceBriefs(
        Authorization.basic(
            store.state.user.campusId, store.state.user.password));
    briefs = resp.data;
    setState(() {});
  }

  @override
  void initState() {
    _handleUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
