import 'package:flutter/material.dart' hide Route;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travelviser_dart/travelviser_dart.dart';
import 'package:tuple/tuple.dart';
import 'package:xmux/components/animated_insertion.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/globals.dart';

class TravelviserPage extends StatefulWidget {
  final travelviser = Travelviser(firebaseUser.email);

  @override
  _TravelviserPageState createState() => _TravelviserPageState();
}

class _TravelviserPageState extends State<TravelviserPage> {
  bool registered = true;
  List<BookingRecord> _bookingRecords;

  // Separated booking records.
  List<BookingRecord> _bookedRecords;
  List<BookingRecord> _expiredRecords;

  Future<Null> refresh() async {
    try {
      await widget.travelviser.user;
    } catch (e) {
      if (mounted) setState(() => registered = false);
      return;
    }
    _bookingRecords = await widget.travelviser.getBookingRecords();
    _bookedRecords = _bookingRecords
            ?.where((r) => r.dateTime.isAfter(DateTime.now()))
            ?.toList() ??
        [];
    _expiredRecords = _bookingRecords
            ?.where((r) => r.dateTime.isBefore(DateTime.now()))
            ?.toList() ??
        [];
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    refresh();
    super.initState();
  }

  Widget _buildBookedRecord(BuildContext context, BookingRecord record) {
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
                '${DateFormat.yMd(Localizations.localeOf(context).languageCode).format(dateTime)} ${DateFormat.E(Localizations.localeOf(context).languageCode).format(dateTime)} ${timeOfDay.format(context)}\n'
                '${i18n('Campus/Tools/Travelviser/From', context)} ${record.from}\n'
                '${i18n('Campus/Tools/Travelviser/To', context)} ${record.to}')
          ],
        ),
      ),
    );
  }

  Widget _buildExpiredRecord(BuildContext context, BookingRecord record) {
    var dateTime = record.dateTime;
    var timeOfDay = TimeOfDay.fromDateTime(dateTime);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${record.route} ${record.boardingDate == null ? '' : ' ${i18n('Campus/Tools/Travelviser/Boarded', context)}'}',
            style: Theme.of(context).textTheme.subhead,
          ),
          Divider(height: 5.0, color: Colors.transparent),
          Text(
              '${DateFormat.yMd(Localizations.localeOf(context).languageCode).format(dateTime)} ${DateFormat.E(Localizations.localeOf(context).languageCode).format(dateTime)} ${timeOfDay.format(context)}\n'
              '${i18n('Campus/Tools/Travelviser/From', context)} ${record.from}\n'
              '${i18n('Campus/Tools/Travelviser/To', context)} ${record.to}'),
        ],
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
            tooltip: i18n('Campus/Tools/Travelviser/DigitalPass', context),
          )
        ],
      ),
      body: !registered
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.warning,
                  size: 50.0,
                  color: Colors.red,
                ),
                Divider(height: 30.0, color: Colors.transparent),
                Text(
                  i18n('Campus/Tools/Travelviser/NotRegistered', context),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : _bookingRecords == null
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView(
                    padding: const EdgeInsets.all(12.0),
                    children: <Widget>[
                      Text(
                          ' ${i18n('Campus/Tools/Travelviser/Booked', context)}',
                          style: Theme.of(context).textTheme.title),
                      Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: _bookedRecords.length,
                        itemBuilder: (_, index) => AnimatedInsertion(
                          (_, animation) => FadeTransition(
                              opacity: animation,
                              child: _buildBookedRecord(
                                  context, _bookedRecords[index])),
                        ),
                      ),
                      Divider(color: Colors.transparent),
                      Text(
                          ' ${i18n('Campus/Tools/Travelviser/Expired', context)}',
                          style: Theme.of(context).textTheme.title),
                      Divider(),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: _expiredRecords.length,
                        itemBuilder: (ctx, index) => _buildExpiredRecord(
                            context, _expiredRecords[index]),
                        separatorBuilder: (_, __) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(height: 3.0)),
                      ),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        tooltip: i18n('Campus/Tools/Travelviser/New', context),
        child: Icon(Icons.add),
        onPressed: registered
            ? () async {
                var result = await Navigator.of(context).push<bool>(
                  FadePageRoute(
                      child: TravelviserBookingPage(widget.travelviser),
                      fullscreenDialog: true),
                );
                if (result) refresh();
              }
            : null,
      ),
    );
  }
}

class TravelviserBookingPage extends StatefulWidget {
  final Travelviser travelviser;

  const TravelviserBookingPage(this.travelviser);

  @override
  _TravelviserBookingPageState createState() => _TravelviserBookingPageState();
}

class _TravelviserBookingPageState extends State<TravelviserBookingPage> {
  List<Route> routes;
  Map<Route, List<Trip>> trips = {};

  bool _roundTrip = true;
  Route _selectedRoute;
  Trip _selectedTrip;

  bool _isBooking = false;

  bool get canBook => !_isBooking && routes != null && routes.isNotEmpty;

  /// Load tickets.
  Future<Null> load() async {
    routes = await widget.travelviser.getRoutes();
    if (_selectedRoute == null && routes.isNotEmpty)
      _selectedRoute = routes.first;

    trips = Map.fromIterables(routes,
        await Future.wait(routes.map((r) => widget.travelviser.getTrips(r))));
    _selectedTrip = trips[_selectedRoute].first;
    if (mounted) setState(() {});
  }

  Future<Null> handleBooking(BuildContext context) async {
    setState(() => _isBooking = true);
    Set<Tuple2<Route, Trip>> bookingQueue = {
      Tuple2(_selectedRoute, _selectedTrip)
    };

    // Get another route & trip if is round trip.
    if (_roundTrip)
      try {
        var anotherRoute = routes
            .where((r) =>
                r != _selectedRoute &&
                r.name.startsWith(_selectedRoute.name.split(']').first))
            .first;
        var anotherTrip = trips[anotherRoute].first;
        bookingQueue.add(Tuple2(anotherRoute, anotherTrip));
      } on StateError catch (_) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              i18n('Campus/Tools/Travelviser/New/RoundTrip/Error', context)),
          action: SnackBarAction(
              label: i18n(
                  'Campus/Tools/Travelviser/New/RoundTrip/Separately', context),
              onPressed: () => setState(() => _roundTrip = false)),
        ));
        setState(() => _isBooking = false);
        return;
      }

    // Book
    try {
      await Future.wait(
          bookingQueue.map((e) => widget.travelviser.book(e.item1, e.item2)));
    } on WrongDateException catch (_) {
      if (!mounted) return;
      Scaffold.of(context).showSnackBar(SnackBar(
        content:
            Text(i18n('Campus/Tools/Travelviser/New/InvalidTime', context)),
      ));
      setState(() => _isBooking = false);
      return;
    } on InvalidBookingException catch (e) {
      if (!mounted) return;
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      setState(() => _isBooking = false);
      return;
    }

    Navigator.of(context).pop(true);
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  List<Widget> buildSelections(BuildContext context) {
    return [
      DropdownButton(
        value: _selectedRoute,
        items: routes
            .map((route) =>
                DropdownMenuItem(child: Text(route.name), value: route))
            .toList(),
        onChanged: (route) => setState(() {
          _selectedTrip = trips[route].first;
          _selectedRoute = route;
        }),
      ),
      CheckboxListTile(
        title: Text(i18n('Campus/Tools/Travelviser/New/RoundTrip', context)),
        subtitle: Text(
            i18n('Campus/Tools/Travelviser/New/RoundTrip/Caption', context)),
        value: _roundTrip,
        onChanged: (v) => setState(() => _roundTrip = v),
      ),
      if (trips.isNotEmpty && !_roundTrip)
        ListTile(
          title:
              Text(i18n('Campus/Tools/Travelviser/New/SelectShift', context)),
          trailing: DropdownButton(
            value: _selectedTrip,
            items: trips[_selectedRoute]
                .map((trip) =>
                    DropdownMenuItem(child: Text(trip.title), value: trip))
                .toList(),
            onChanged: (trip) => setState(() => _selectedTrip = trip),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(i18n('Campus/Tools/Travelviser/New', context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title),
            ),
            Divider(height: 20.0, color: Colors.transparent),
            if (routes == null) Center(child: CircularProgressIndicator()),
            if (routes?.isEmpty ?? false) EmptyErrorPage(),
            if (routes != null && routes.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(children: buildSelections(context)),
              ),
            Divider(height: 40.0, color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'x',
                  backgroundColor: Theme.of(context).canvasColor,
                  child:
                      Icon(Icons.close, color: Theme.of(context).accentColor),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                if (routes?.isNotEmpty ?? true)
                  FloatingActionButton(
                    disabledElevation: 0.0,
                    child: Icon(Icons.check),
                    onPressed: canBook ? () => handleBooking(context) : null,
                  )
              ],
            )
          ],
        );
      }),
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
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.qrcode, color: Colors.blue[700]),
                      Divider(height: 5.0, color: Colors.transparent),
                      Text('QRCODE', style: TextStyle(color: Colors.blue[700])),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.map),
                      Divider(height: 5.0, color: Colors.transparent),
                      Text('MAPS'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.ticketAlt),
                      Divider(height: 5.0, color: Colors.transparent),
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
