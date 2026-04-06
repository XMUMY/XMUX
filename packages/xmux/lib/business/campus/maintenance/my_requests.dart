import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maintenance/maintenance.dart';

import '../../../foundation/platform/breakpoint.dart';

class MyRequestsPage extends StatefulWidget {
  final Maintenance maintenanceApi;

  const MyRequestsPage({super.key, required this.maintenanceApi});

  @override
  State<MyRequestsPage> createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage>
    with AutomaticKeepAliveClientMixin {
  List<MyRequest>? myRequests;

  Future<void> _handleUpdate() async {
    myRequests = await widget.maintenanceApi.myRequests;
    if (mounted) setState(() {});
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _handleUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final myRequests = this.myRequests;
    if (myRequests == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: context.padBody),
        itemCount: myRequests.length,
        itemBuilder: (context, index) {
          final req = myRequests[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    req.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${req.id} ${DateFormat.yMMMd().format(req.date)} '
                    '${req.usage} ${req.category}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Divider(),
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
