part of 'attendance.dart';

class _LecturerPage extends StatelessWidget {
  Future<List<StudentAttendanceBrief>> _handleUpdate() async {
    var resp = await XMUXApi.instance.getStudentAttendanceBriefs(
        Authorization.basic(
            store.state.user.campusId, store.state.user.password));
    return [
      StudentAttendanceBrief(
          'CST101', 'Principles of Computer Composition', DateTime.now(), 5, 4)
    ];
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
              Text('${brief.cid} '
                  '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(brief.timestamp)} '
                  '${DateFormat.Hm(Localizations.localeOf(context).languageCode).format(brief.timestamp)}'),
              Text('Attendance: ${brief.attended}/${brief.total}  '
                  '(${brief.attended / brief.total * 100}%)')
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

  _LecturerDetailPage({Key key, this.brief}) : super(key: key);

  Future<StudentAttendanceDetail> _handleUpdate() async {
//    var resp = await XMUXApi.instance.getStudentAttendanceDetail(
//        Authorization.basic(
//            store.state.user.campusId, store.state.user.password),
//        widget.brief.cid,
//        widget.brief.timestamp);
    return StudentAttendanceDetail(
        'CST101', 'AdvancedMath1', DateTime.now(), 5, 4, [
      for (var i = 0; i < 20; i++)
        StudentAttendance(
          'CST1709001',
          'Jack',
          StudentAttendanceStatus.attended,
        )
    ]);
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
            floatingActionButton: detail.students.selectedCount == 0
                ? null
                : FloatingActionButton.extended(
                    icon: Icon(Icons.add),
                    label:
                        Text('${detail.students.selectedCount}/${brief.total}'),
                    onPressed: () {},
                  ),
          ),
        ),
      ),
    );
  }
}
