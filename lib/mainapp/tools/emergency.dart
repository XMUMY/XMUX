import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xmux/globals.dart';

class EmergencyPage extends StatelessWidget {
  Widget _buildCard(BuildContext context, List<Widget> children) => Card(
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: children),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n('Tools/Emergency', context)),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.error_outline,
              size: 60,
              color: Colors.red,
            ),
          ),
          Text(
            i18n('Tools/Emergency/Caption', context),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          _buildCard(
            context,
            <Widget>[
              Text(i18n('Tools/Emergency/XMUMSecurityHotline', context)),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('019-295-9998'),
                    textColor: Colors.white,
                    color: Colors.orange,
                    highlightColor: Colors.pinkAccent,
                    onPressed: () => launch('tel:0192959998'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  RaisedButton(
                    child: Text('019-348-9999'),
                    textColor: Colors.white,
                    color: Colors.orange,
                    highlightColor: Colors.pinkAccent,
                    onPressed: () => launch('tel:0193489999'),
                  ),
                ],
              ),
            ],
          ),
          _buildCard(
            context,
            <Widget>[
              Text(i18n(
                  'Tools/Emergency/EmergencyContactAfterOfficeHour', context)),
              Divider(),
              Wrap(
                  spacing: 10.0,
                  children: <String, String>{
                    'Ms. KUNG': '017-5117483',
                    'Ms. MAYBELLINE': '011-36895790',
                    'Ms. TEY': '018-2050552',
                    'Ms. DENISE': '018-9584237',
                    'Ms. LEE': '016-9087407',
                    'Mr. YAN': '017-2327860',
                    'Mr. POTTER': '017-7468876',
                    'Mr. IVAN': '018-2855466',
                    'Dr. ALEX': '019-6102628'
                  }
                      .entries
                      .map((m) => RaisedButton(
                            child: Text(m.key),
                            textColor: Colors.white,
                            color: Colors.orange,
                            highlightColor: Colors.pinkAccent,
                            onPressed: () => launch('tel:${m.value}'),
                          ))
                      .toList()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: _buildCard(
                  context,
                  <Widget>[
                    Text(i18n('Tools/Emergency/PoliceSergeantSafie', context)),
                    Text(
                      i18n('Tools/Emergency/PoliceSergeantSafie/Caption',
                          context),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('017-393-3095'),
                          textColor: Colors.white,
                          color: Colors.orange,
                          highlightColor: Colors.pinkAccent,
                          onPressed: () => launch('tel:0173933095'),
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
                    Text(i18n('Tools/Emergency/LCorporalFadil', context)),
                    Text(
                      i18n('Tools/Emergency/LCorporalFadil/Caption', context),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('016-958-7781'),
                          textColor: Colors.white,
                          color: Colors.orange,
                          highlightColor: Colors.pinkAccent,
                          onPressed: () => launch('tel:0169587781'),
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
                    Text(i18n('Tools/Emergency/Police', context)),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('999'),
                          textColor: Colors.white,
                          color: Colors.orange,
                          highlightColor: Colors.pinkAccent,
                          onPressed: () => launch('tel:999'),
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
                    Text(i18n('Tools/Emergency/FireAlarm', context)),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('994'),
                          textColor: Colors.white,
                          color: Colors.orange,
                          highlightColor: Colors.pinkAccent,
                          onPressed: () => launch('tel:994'),
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
}
