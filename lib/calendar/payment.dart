import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final Map rawData;

  PaymentPage(this.rawData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        reverse: false,
        itemCount: rawData["data"].length,
        itemBuilder: (_, int index) {
          return new _PaymentCard(
              rawData["data"][rawData["data"].length - 1 - index]);
        });
  }
}

class _PaymentCard extends StatelessWidget {
  final Map paymentData;

  _PaymentCard(this.paymentData);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      paymentData["item"],
                      style: Theme
                          .of(context)
                          .textTheme
                          .subhead
                          .copyWith(color: Colors.black54),
                    ),
                  ),
                  new Text("MYR : " + paymentData["amount"]),
                  new Text(
                    "Status : " +
                        (paymentData["paid"] == "-" ? "Unpaid" : "Paid"),
                    style: new TextStyle(
                      color: paymentData["paid"] == "-"
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
