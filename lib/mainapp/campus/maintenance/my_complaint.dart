part of 'maintenance.dart';

class MyComplaintsPage extends StatefulWidget {
  final Maintenance maintenance;
  final List<MyRequest> myComplaints = [];

  MyComplaintsPage(this.maintenance);

  @override
  _MyComplaintsPageState createState() => _MyComplaintsPageState();
}

class _MyComplaintsPageState extends State<MyComplaintsPage> {
  @override
  void initState() {
    if (widget.myComplaints.isEmpty)
      widget.maintenance.myRequests.then((requests) => mounted
          ? setState(() => widget.myComplaints.addAll(requests))
          : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: widget.myComplaints.length,
      itemBuilder: (context, index) {
        var req = widget.myComplaints[index];
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
    );
  }
}
