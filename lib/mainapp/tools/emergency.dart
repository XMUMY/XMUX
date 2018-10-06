import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/translations/translation.dart';

class EmergencyPage extends StatelessWidget {
  Widget _buildCard(BuildContext context, List<Widget> children) => Card(
        margin: EdgeInsets.all(5.0),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(children: children),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MainLocalizations.of(context).get("Tools/Emergency")),
          backgroundColor: Colors.red,
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.error_outline,
                size: 60.0,
                color: Colors.red,
              ),
            ),
            Text(
              MainLocalizations.of(context).get("Tools/Emergency/Caption"),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            _buildCard(
              context,
              <Widget>[
                Text(MainLocalizations.of(context)
                    .get("Tools/Emergency/XMUMSecurityHotline")),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("019-295-9998"),
                      textColor: Colors.white,
                      color: Colors.orange,
                      highlightColor: Colors.pinkAccent,
                      onPressed: () => launch("tel:0192959998"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    RaisedButton(
                      child: Text("019-348-9999"),
                      textColor: Colors.white,
                      color: Colors.orange,
                      highlightColor: Colors.pinkAccent,
                      onPressed: () => launch("tel:0193489999"),
                    ),
                  ],
                ),
              ],
            ),
            _buildCard(
              context,
              <Widget>[
                Text(MainLocalizations.of(context)
                    .get("Tools/Emergency/EmergencyContactAfterOfficeHour")),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("017-746-8876"),
                      textColor: Colors.white,
                      color: Colors.orange,
                      highlightColor: Colors.pinkAccent,
                      onPressed: () => launch("tel:017-746-8876"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    RaisedButton(
                      child: Text("019-806-7551"),
                      textColor: Colors.white,
                      color: Colors.orange,
                      highlightColor: Colors.pinkAccent,
                      onPressed: () => launch("tel:019-806-7551"),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildCard(
                    context,
                    <Widget>[
                      Text(MainLocalizations.of(context)
                          .get("Tools/Emergency/PoliceSergeantSafie")),
                      Text(
                        MainLocalizations.of(context)
                            .get("Tools/Emergency/PoliceSergeantSafie/Caption"),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("017-393-3095"),
                            textColor: Colors.white,
                            color: Colors.orange,
                            highlightColor: Colors.pinkAccent,
                            onPressed: () => launch("tel:0173933095"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildCard(
                    context,
                    <Widget>[
                      Text(MainLocalizations.of(context)
                          .get("Tools/Emergency/LCorporalFadil")),
                      Text(
                        MainLocalizations.of(context)
                            .get("Tools/Emergency/LCorporalFadil/Caption"),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("016-958-7781"),
                            textColor: Colors.white,
                            color: Colors.orange,
                            highlightColor: Colors.pinkAccent,
                            onPressed: () => launch("tel:0169587781"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildCard(
                    context,
                    <Widget>[
                      Text(MainLocalizations.of(context)
                          .get("Tools/Emergency/Police")),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("999"),
                            textColor: Colors.white,
                            color: Colors.orange,
                            highlightColor: Colors.pinkAccent,
                            onPressed: () => launch("tel:999"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _buildCard(
                    context,
                    <Widget>[
                      Text(MainLocalizations.of(context)
                          .get("Tools/Emergency/FireAlarm")),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("994"),
                            textColor: Colors.white,
                            color: Colors.orange,
                            highlightColor: Colors.pinkAccent,
                            onPressed: () => launch("tel:994"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildCard(
                    context,
                    <Widget>[
                      Text(MainLocalizations.of(context)
                          .get("Tools/Emergency/LostKey")),
                      Text(
                        MainLocalizations.of(context)
                            .get("Tools/Emergency/LostKey/Caption"),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("016-6310-3574"),
                            textColor: Colors.white,
                            color: Colors.orange,
                            highlightColor: Colors.pinkAccent,
                            onPressed: () => launch("tel:016-6310-3574"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
