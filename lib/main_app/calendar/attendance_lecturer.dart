part of 'attendance.dart';

class _LecturerPage extends StatelessWidget {
  Future<List<StudentAttendanceBrief>> _handleUpdate() async {
    var resp = await XmuxApi.instance.getStudentAttendanceBriefs();
    return resp.data;
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
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ),
              Text('${brief.cid} '
                  '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(brief.timestamp.toLocal())} '
                  '${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(brief.timestamp.toLocal())}'),
              Text(
                  '${S.of(context).Calendar_AttendanceRate}: ${brief.attended}/${brief.total}  '
                  '(${(brief.attended / brief.total * 100).toStringAsFixed(2)}%)')
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

class _LecturerDetailPage extends StatelessWidget {
  final StudentAttendanceBrief brief;
  final detailKey = GlobalKey<RefreshableState<StudentAttendanceDetail>>();

  _LecturerDetailPage({Key key, this.brief}) : super(key: key);

  Future<StudentAttendanceDetail> _handleUpdate() async {
    var resp = await XmuxApi.instance
        .getStudentAttendanceDetail(brief.cid, brief.timestamp);
    return resp.data;
  }

  Future<void> _updateStatus(StudentAttendanceStatus status) async {
    await XmuxApi.instance.updateStudentAttendance(
        brief.cid,
        brief.timestamp,
        status,
        detailKey.currentState.data.students
            .where((s) => s.selected)
            .map((s) => s.uid)
            .toList());
    await detailKey.currentState.refresh();
  }

  Widget buildDataTable(BuildContext context, StudentAttendanceDetail detail) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(label: Text('Campus ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Status')),
      ],
      rows: detail.students
          .map((s) => DataRow(
                selected: s.selected,
                onSelectChanged: (selected) => s.selected = selected,
                cells: [
                  DataCell(Text(s.uid)),
                  DataCell(Text(s.name)),
                  DataCell(Text(s.status.toString().split('.').last))
                ],
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Hero(
          tag: brief.timestamp,
          child: Text(brief.name),
        ),
        actions: <Widget>[
          Center(
            child: Text(
                DateFormat.MEd(Localizations.localeOf(context).languageCode)
                    .format(brief.timestamp)),
          ),
          VerticalDivider(width: 5)
        ],
      ),
      body: Refreshable<StudentAttendanceDetail>(
        key: detailKey,
        onRefresh: _handleUpdate,
        builder: (context, detail) => Observer(
          builder: (context) => Scaffold(
            body: Scrollbar(
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Observer(
                      builder: (context) => buildDataTable(context, detail),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: SpeedDial(
              visible: detail.students.selectedCount != 0,
              child: Text('${detail.students.selectedCount}/${brief.total}'),
              children: <SpeedDialChild>[
                SpeedDialChild(
                  label: S.of(context).Calendar_AttendanceMarkAttended,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,
                  onTap: () => _updateStatus(StudentAttendanceStatus.attended),
                ),
                SpeedDialChild(
                  label: S.of(context).Calendar_AttendanceMarkAbsent,
                  child: Icon(Icons.cancel),
                  backgroundColor: Colors.red,
                  onTap: () => _updateStatus(StudentAttendanceStatus.failed),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
