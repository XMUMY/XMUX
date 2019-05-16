import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travelviser_dart/travelviser_dart.dart';
import 'package:xmux/components/empty_error_button.dart';
import 'package:xmux/globals.dart';

class TravelviserPage extends StatefulWidget {
  final travelviser = Travelviser(firebaseUser.email, '');

  @override
  _TravelviserPageState createState() => _TravelviserPageState();
}

class _TravelviserPageState extends State<TravelviserPage> {
  List<BookingRecord> _bookingRecords;

  Future<Null> refresh() async {
    try {
      await widget.travelviser.user;
    } catch (e) {
      return;
    }
    _bookingRecords = await widget.travelviser.getBookingRecords();
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  Widget _buildRecord(BuildContext context, BookingRecord record) {
    var dateTime = record.dateTime;
    var timeOfDay = TimeOfDay.fromDateTime(dateTime);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              record.route,
              style: Theme.of(context).textTheme.subhead,
            ),
            Divider(),
            Text(
                '${DateFormat.yMd().format(dateTime)} ${DateFormat.E().format(dateTime)} ${timeOfDay.format(context)}\n'
                'From ${record.from}\n'
                'To ${record.to}')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travelviser'),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).primaryColor
            : Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.qrcode),
            onPressed: () => Navigator.of(context)
                .pushNamed('/Campus/Tools/Travelviser/DigitalPass'),
            tooltip: 'Digital Pass',
          )
        ],
      ),
      body: _bookingRecords == null
          ? Center(child: CircularProgressIndicator())
          : _bookingRecords.isEmpty
              ? EmptyErrorButton(onRefresh: refresh)
              : RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: _bookingRecords.length,
                    itemBuilder: (ctx, index) =>
                        _buildRecord(context, _bookingRecords[index]),
                  ),
                ),
    );
  }
}

/// Dummy Travelviser digital pass.
class DigitalPassPage extends StatelessWidget {
  List<Widget> _buildStackChildren(BuildContext context) {
    return <Widget>[
      Positioned(
        top: 5.0,
        right: 18.0,
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
