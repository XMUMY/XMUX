import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/loginapp/login_handler.dart';
import 'package:xmux/translations/translation.dart';

class EPaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PaymentPageState();
}

class _PaymentPageState extends State<EPaymentPage> {
  Map rawData;

  @override
  void initState() {
    LoginHandler
        .ePaymentAuth(mainAppStore.state.personalInfoState.uid,
            mainAppStore.state.settingState.ePaymentPassword)
        .then((r) {
      setState(() {
        this.rawData = r;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("E-Payment"),
      ),
      body: rawData == null
          ? new Center(child: new CircularProgressIndicator())
          : new ListView.builder(
              reverse: false,
              itemCount: rawData["data"].length,
              itemBuilder: (_, int index) {
                return new _PaymentCard(
                    rawData["data"][rawData["data"].length - 1 - index]);
              }),
    );
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
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new MaterialButton(
                        onPressed: paymentData["paid"] == "-"
                            ? () {
                                launch("http://www.barracudacampus.com/s/xmu");
                              }
                            : null,
                        child: new Column(
                          children: <Widget>[
                            new Text("MYR : " + paymentData["amount"]),
                            new Text(
                              MainLocalizations
                                      .of(context)
                                      .get("e-payment/status") +
                                  (paymentData["paid"] == "-"
                                      ? MainLocalizations
                                          .of(context)
                                          .get("e-payment/unpaid")
                                      : MainLocalizations
                                          .of(context)
                                          .get("e-payment/paid")),
                              style: new TextStyle(
                                color: paymentData["paid"] == "-"
                                    ? Colors.red
                                    : Colors.green[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
