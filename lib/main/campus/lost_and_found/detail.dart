import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmus_client/generated/lost_found.pb.dart';

import '../../../component/gravatar.dart';
import '../../../component/user_profile.dart';
import '../../../global.dart';
import '../../../util/screen.dart';

class LostAndFoundDetailPage extends StatefulWidget {
  final LostAndFoundBrief brief;

  const LostAndFoundDetailPage({Key? key, required this.brief})
      : super(key: key);

  @override
  State<LostAndFoundDetailPage> createState() => _LostAndFoundDetailPageState();
}

class _LostAndFoundDetailPageState extends State<LostAndFoundDetailPage> {
  LostAndFoundDetail? detail;

  Future<void> handleRefresh() async {
    detail = await rpc.lostAndFoundClient.getDetail(
      GetDetailReq()..id = widget.brief.id,
    );
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    handleRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detail = this.detail;

    // Details.
    Widget details;
    if (detail == null) {
      details = const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SpinKitWave(
            color: Colors.black38,
            size: 20,
          ),
        ),
      );
    } else {
      details = Card(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                detail.type == LostAndFoundType.Lost
                    ? LocaleKeys.Campus_LaFLost.tr()
                    : LocaleKeys.Campus_LaFFound.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                detail.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(height: 5, color: Colors.transparent),
              Text(
                LocaleKeys.Campus_LaFTime.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                '${DateFormat.yMMMEd().format(detail.time.toDateTime().toLocal())} '
                '${DateFormat.Hm().format(detail.time.toDateTime().toLocal())}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(height: 5, color: Colors.transparent),
              Text(
                LocaleKeys.Campus_LaFLocation.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                detail.location,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Divider(),
              Text(detail.description),
              if (detail.contacts.isNotEmpty) ...[
                const Divider(),
                Text(
                  LocaleKeys.Campus_LaFContacts.tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                for (var contact in detail.contacts.entries)
                  Text('${contact.key}  ${contact.value}'),
              ]
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Campus_LaF.tr()),
        actions: <Widget>[
          if (widget.brief.uid == store.state.user.campusId)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () async {
                await rpc.lostAndFoundClient.deleteItem(
                  DeleteItemReq()..id = widget.brief.id,
                );
                if (mounted) Navigator.of(context).pop(true);
              },
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: context.padBody,
          ),
          shrinkWrap: true,
          children: <Widget>[
            UserProfileBuilder(
              uid: widget.brief.uid,
              builder: (context, profile) => Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Hero(
                      tag: widget.brief.hashCode,
                      child: Gravatar(
                        url: profile.avatar,
                        fallbackName: profile.displayName,
                        radius: 20,
                      ),
                    ),
                  ),
                  Text(profile.displayName),
                ],
              ),
            ),
            details,
          ],
        ),
      ),
    );
  }
}
