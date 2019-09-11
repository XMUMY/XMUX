part of 'maintenance.dart';

class MyComplaintsPage extends StatefulWidget {
  final Maintenance maintenance;

  MyComplaintsPage(this.maintenance);

  @override
  _MyComplaintsPageState createState() => _MyComplaintsPageState();
}

class _MyComplaintsPageState extends State<MyComplaintsPage> {
  List<MyRequest> myComplaints;

  Future<Null> _handleUpdate() async {
    var myRequests = await widget.maintenance.myRequests;
    if (mounted) setState(() => myComplaints = myRequests);
  }

  @override
  void initState() {
    _handleUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (myComplaints == null) return Center(child: CircularProgressIndicator());
    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: myComplaints.length,
        itemBuilder: (context, index) {
          var req = myComplaints[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${req.title}',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  Text(
                    '${req.id} ${DateFormat.yMMMd().format(req.date)} '
                    '${req.usage} ${req.category}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Divider(height: 8),
                  Text(req.answer)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
