part of 'xia.dart';

class XiAPage extends StatefulWidget {
  @override
  _XiAPageState createState() => _XiAPageState();
}

class _XiAPageState extends State<XiAPage> {
  @override
  Widget build(BuildContext context) {
    return new BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: new Container(
        width: 200.0,
        height: 200.0,
        decoration:
            new BoxDecoration(color: Colors.grey.shade200.withOpacity(0.0)),
        child: new Center(
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: new Text(
              'XiA',
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
