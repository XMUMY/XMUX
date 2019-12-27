part of 'attendance.dart';

class _LecturerPage extends StatelessWidget {
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
          onTap: () => Navigator.of(context).push(
            FadePageRoute(child: _LecturerDetailPage(brief: brief)),
          ),
          margin: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Hero(
                  tag: brief.timestamp,
                  child: Text(
                    brief.name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
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

class _LecturerDetailPage extends StatefulWidget {
  final StudentAttendanceBrief brief;

  const _LecturerDetailPage({Key key, this.brief}) : super(key: key);

  @override
  _LecturerDetailPageState createState() => _LecturerDetailPageState();
}

class _LecturerDetailPageState extends State<_LecturerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.brief.timestamp,
          child: Text(widget.brief.name),
        ),
      ),
    );
  }
}
