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
            onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => DigitalPassPage(),
                ),
          )
        ],
      ),
    );
  }
}

/// Travelviser digital pass.
class DigitalPassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: QrImage(
        version: 2,
        data: '${store.state.authState.campusID}@xmu.edu.my',
        size: MediaQuery.of(context).size.width / 1.3,
      ),
    );
  }
}
