part of 'maintenance.dart';

class MyComplaintsPage extends StatelessWidget {
  final Maintenance maintenance;

  MyComplaintsPage(this.maintenance);

  Future<List<MyRequest>> _handleUpdate() async => await maintenance.myRequests;

  @override
  Widget build(BuildContext context) {
    return Refreshable<List<MyRequest>>(
      onRefresh: _handleUpdate,
      builder: (context, myComplaints) => ListView.builder(
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
                    style: Theme.of(context).textTheme.subtitle1,
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
