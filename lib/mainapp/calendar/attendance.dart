import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v3.dart';

class AttendancePage extends StatelessWidget {
  Future<List<StudentAttendanceBrief>> _handleUpdate() async {
    var resp = await XMUXApi.instance.getStudentAttendanceBriefs(
        Authorization.basic(
            store.state.user.campusId, store.state.user.password));
    return [StudentAttendanceBrief("CST101", "name", DateTime.now(), 5, 4)];
  }

  Widget buildList(BuildContext context, List<StudentAttendanceBrief> briefs) {
    return ListView.builder(
      itemCount: briefs.length,
      itemBuilder: (context, index) {
        var brief = briefs[index];

        var card = FloatingCard(
          margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  brief.name,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              Text(brief.cid),
              Text(
                  '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(brief.timestamp)}'),
              Text('Attendance: ${brief.attended}/${brief.total}')
            ],
          ),
        );

        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 250),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(child: card),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Refreshable(
      builder: buildList,
      onRefresh: _handleUpdate,
      isEmpty: (list) => list.isEmpty,
    );
  }
}
