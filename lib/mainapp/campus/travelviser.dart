import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xmux/globals.dart';

class TravelviserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travelviser'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.qrcode),
            onPressed: () => Navigator.of(context)
                .pushNamed('/Campus/Tools/Travelviser/DigitalPass'),
          )
        ],
      ),
      body: Container(),
    );
  }
}

/// Dummy Travelviser digital pass.
class DigitalPassPage extends StatelessWidget {
  List<Widget> _buildStackChildren(BuildContext context) {
    return <Widget>[
      Positioned(
        top: 5.0,
        right: 20.0,
        child: RaisedButton(
          elevation: 0.0,
          color: Colors.blue[700],
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text('Sign Out', style: TextStyle(color: Colors.white)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 2.0),
            child: Text('Digital Pass',
                style:
                    Theme.of(context).textTheme.title.copyWith(fontSize: 20.0)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 2.0, 0.0, 10.0),
            child: Text(
              'Flash QR code to the scanner',
              style:
                  Theme.of(context).textTheme.caption.copyWith(fontSize: 15.0),
            ),
          ),
          Center(
            child: QrImage(
              version: 2,
              data: firebaseUser.email,
              size: MediaQuery.of(context).size.width / 1.3,
            ),
          ),
          Center(
            child: Text(
              firebaseUser.displayName,
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 20.0),
            ),
          ),
          Center(
            child: Text(
              '${firebaseUser.uid} | ${firebaseUser.email}',
              style:
                  Theme.of(context).textTheme.caption.copyWith(fontSize: 15.0),
            ),
          )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.qrcode, color: Colors.blue[700]),
                      Divider(height: 2.0, color: Colors.transparent),
                      Text('QRCODE', style: TextStyle(color: Colors.blue[700])),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.map),
                      Divider(height: 2.0, color: Colors.transparent),
                      Text('MAPS'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.ticketAlt),
                      Divider(height: 2.0, color: Colors.transparent),
                      Text('BOOKINGS'),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: _buildStackChildren(context)),
        ),
      ),
    );
  }
}
