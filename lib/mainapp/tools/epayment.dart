import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/redux/actions.dart';
import 'package:xmux/redux/state.dart';
import 'package:xmux/translations/translation.dart';

class EPaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<EPaymentPage> {
  final _passwordController = TextEditingController();
  bool _isProcessing = false;

  List _bills;

  Future<Map<String, dynamic>> ePaymentFetch(
    String password,
  ) async {
    // Get response from backend.
    var response =
        await BackendApiHandler.post(context: context, api: "/bill", body: {
      "id": mainAppStore.state.personalInfoState.uid,
      "pass": password,
    });

    // Check error.
    if (response.statusCode >= 400) return {"error": response.reasonPhrase};

    Map resJson = jsonDecode(response.body);

    return resJson;
  }

  Future<Null> _handleSave(String password, BuildContext context) async {
    // If empty.
    if (password.isEmpty) return;

    setState(() => _isProcessing = true);
    var res = await ePaymentFetch(password);

    // When error.
    if (res.containsKey("error")) {
      Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Error: " + res["error"]),
          ));
      setState(() => _isProcessing = false);
      return;
    }

    mainAppStore.dispatch(UpdateEPaymentPasswordAction(password));
    setState(() {
      _bills = res["data"];
    });
  }

  @override
  void initState() {
    ePaymentFetch(mainAppStore.state.settingState.ePaymentPassword).then((r) {
      setState(() {
        _bills = r["data"];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("Tools/EPayment")),
        ),
        body: StoreConnector<MainAppState, String>(
          converter: (Store<MainAppState> store) =>
              store.state.settingState.ePaymentPassword,
          builder: (context, password) => password == null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Icon(
                        Icons.lock_outline,
                        size: 60.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      child: Text(MainLocalizations
                          .of(context)
                          .get("Tools/EPayment/NeedLogin")),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: MainLocalizations
                                      .of(context)
                                      .get("Tools/EPayment/EPaymentPassword")),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.save),
                            onPressed: _isProcessing
                                ? null
                                : () => _handleSave(
                                    _passwordController.text, context),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : _bills == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      reverse: false,
                      itemCount: _bills.length,
                      itemBuilder: (_, int index) =>
                          _PaymentCard(_bills[_bills.length - 1 - index])),
        ),
      );
}

class _PaymentCard extends StatelessWidget {
  final Map paymentData;

  _PaymentCard(this.paymentData);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    paymentData["item"],
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("MYR : " + paymentData["amount"]),
                        Text(
                          MainLocalizations
                                  .of(context)
                                  .get("Tools/EPayment/Status") +
                              (paymentData["paid"] == "-"
                                  ? MainLocalizations
                                      .of(context)
                                      .get("Tools/EPayment/Unpaid")
                                  : MainLocalizations
                                      .of(context)
                                      .get("Tools/EPayment/Paid")),
                          style: TextStyle(
                            color: paymentData["paid"] == "-"
                                ? Colors.red
                                : Colors.green[300],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
