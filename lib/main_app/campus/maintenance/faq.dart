part of 'maintenance.dart';

class FaqPage extends StatelessWidget {
  final List<int> pages = [0];

  @override
  Widget build(BuildContext context) {
    return LazyLoadingList<FaqQuestion>(
      onRefresh: () async {
        pages
          ..clear()
          ..addAll([0, 1]);
        return await Maintenance.getFaq();
      },
      onLoadMore: (faqs) async {
        var newFaqs = await Maintenance.getFaq(page: pages.last + 1);
        if (newFaqs.isEmpty) return null;
        pages.add(pages.last + 1);
        return newFaqs;
      },
      builder: (context, faq, i) => Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                faq.title,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text(
                DateFormat.yMMMd().format(faq.date),
                style: Theme.of(context).textTheme.caption,
              ),
              Divider(height: 8),
              Text(faq.answer)
            ],
          ),
        ),
      ),
    );
  }
}
