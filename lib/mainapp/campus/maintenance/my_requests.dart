part of 'maintenance.dart';

class MyRequestsPage extends StatefulWidget {
  final Maintenance maintenance;
  final List<MyRequest> myRequests = [];

  MyRequestsPage(this.maintenance);

  @override
  _MyRequestsPageState createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {
  @override
  void initState() {
    if (widget.myRequests.isEmpty)
      widget.maintenance.myRequests.then((requests) =>
          mounted ? setState(() => widget.myRequests.addAll(requests)) : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: widget.myRequests.length,
      itemBuilder: (context, index) {
        var req = widget.myRequests[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  req.title,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text(
                  '${DateFormat.yMMMd().format(req.date)} ${req.usage} ${req.category}',
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
