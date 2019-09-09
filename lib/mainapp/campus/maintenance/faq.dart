part of 'maintenance.dart';

class FaqPage extends StatefulWidget {
  final List<FaqQuestion> faqs = [];
  final List<int> pages = [0];

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final controller = ScrollController();
  var _isLoading = false;

  @override
  void initState() {
    if (widget.pages.last == 0)
      Maintenance.getFaq().then((f) {
        widget.pages.add(1);
        widget.faqs.addAll(f);
        if (mounted) setState(() {});
      });

    // Lazy loading pages.
    controller.addListener(() async {
      if (!_isLoading && controller.position.extentAfter < 10) {
        _isLoading = true;
        var newFaqs = await Maintenance.getFaq(page: widget.pages.last + 1);
        if (newFaqs.isEmpty) return;
        widget.pages.add(widget.pages.last + 1);
        setState(() => widget.faqs.addAll(newFaqs));
        _isLoading = false;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.all(10),
      itemCount: widget.faqs.length,
      itemBuilder: (context, index) {
        var faq = widget.faqs[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  faq.title,
                  style: Theme.of(context).textTheme.subhead,
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
        );
      },
    );
  }
}
