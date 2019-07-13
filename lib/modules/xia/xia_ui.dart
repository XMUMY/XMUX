part of 'xia.dart';

class XiAPage extends StatefulWidget {
  final XiA _xiA;

  XiAPage(this._xiA);

  @override
  _XiAPageState createState() => _XiAPageState();
}

class _XiAPageState extends State<XiAPage> {
  final _queryController = TextEditingController();
  List<Widget> messages = [];

  void _handleQuery(String query) async {
    _queryController.clear();
    var res = await widget._xiA._dialogflow.queryFromText(query);
    setState(() {
      messages.add(_MessageCard(query, true));
      messages.add(_MessageCard(res, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty)
      messages.add(_MessageCard(i18n('XiA/Intro', context), false));
    return GaussianBlurBox(
      sigma: 3,
      color: Colors.grey.shade200.withOpacity(0),
      centered: true,
      child: Container(
        margin: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(13)),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: messages.length,
                padding: EdgeInsets.all(5),
                itemBuilder: (_, i) => messages[i],
              ),
            ),
            Divider(color: Colors.white, height: 8),
            Material(
              color: Color(0),
              child: Row(
                children: <Widget>[
                  SpinKitRipple(color: Colors.white),
                  Flexible(
                    child: TextField(
                      controller: _queryController,
                      decoration: InputDecoration.collapsed(
                        hintText: i18n('XiA/Hint', context),
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white),
                      onSubmitted: _handleQuery,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  final String message;
  final bool isMe;

  _MessageCard(this.message, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
        textAlign: isMe ? TextAlign.right : TextAlign.start,
      ),
    );
  }
}
