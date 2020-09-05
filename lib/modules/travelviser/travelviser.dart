library travelviser;

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'exceptions.dart';
import 'models.dart';

export 'exceptions.dart';
export 'models.dart';

/// The travelviser API address.
const API_ADDRESS = 'http://api.transoluxion.com';
const HEADERS = {'User-Agent': 'okhttp/3.11.0'};

class Travelviser {
  /// Email for API & Amazon Cognito.
  final String email;

  /// Cached user.
  TravelviserUser _user;

  Travelviser(this.email);

  Future<TravelviserUser> get user async => _user ?? await getUser();

  Future<String> book(Route route, Trip trip, {DateTime date}) async {
    var user = await this.user;
    var wayPoints = await getWayPoints(route);

    // Compute recent date that match the route.
    if (date == null) {
      final today = DateTime.now();
      if (today.weekday >= route.dayOfWeek) throw WrongDateException();
      date = today.add(Duration(days: route.dayOfWeek - today.weekday));
    }

    var res =
        await http.post('$API_ADDRESS/booking.php', headers: HEADERS, body: {
      'process': '1',
      'id_organization': user.organizationId.toString(),
      'id_passenger': user.id.toString(),
      'id_route': route.id.toString(),
      'id_trip': trip.id.toString(),
      'id_embark': wayPoints.first.id.toString(),
      'id_disembark': wayPoints.last.id.toString(),
      'dt_ticket': date.toString().substring(0, 10)
    });
    Map<String, dynamic> resJson = jsonDecode(res.body);

    if (resJson['cd_result'] != 1)
      throw InvalidBookingException(resJson['tx_result']);
    return resJson['tx_result'];
  }

  Future<List<BookingRecord>> getBookingRecords({int id}) async {
    var user = await this.user;
    var res =
        await http.post('$API_ADDRESS/booking.php', headers: HEADERS, body: {
      'process': '2',
      'id_organization': user.organizationId.toString(),
      'id_passenger': id?.toString() ?? user.id.toString()
    });
    if (res.body == '[{"id":0,"id_trip":0,"id_batch":0,"dt_ticket":0}]')
      return [];
    return (jsonDecode(res.body) as List)
        .map((r) => BookingRecord.fromJson(r))
        .toList();
  }

  Future<List<Route>> getRoutes({int companyId}) async {
    var user = await this.user;
    var res =
        await http.post('$API_ADDRESS/route.php', headers: HEADERS, body: {
      'process': '5',
      'id_company': companyId?.toString() ?? user.organizationId.toString(),
    });
    if (res.body == '[{"id":0,"name":"Route","id_company":0}]') return [];
    return (jsonDecode(res.body) as List)
        .map((r) => Route.fromJson(r))
        .toList();
  }

  Future<List<Trip>> getTrips(Route route) async {
    var res = await http.post('$API_ADDRESS/trip_setup.php',
        headers: HEADERS,
        body: {
          'process': '7',
          'id_route': route.id.toString(),
          'open_type': '2'
        });
    if (res.body.contains('No trip')) return [];
    return (jsonDecode(res.body) as List).map((t) => Trip.fromJson(t)).toList();
  }

  Future<TravelviserUser> getUser({String email}) async {
    var res = await http.post('$API_ADDRESS/user.php',
        headers: HEADERS,
        body: {'process': '16', 'email': email ?? this.email});
    if (res.body == '""') throw UserNotFoundException();
    _user = TravelviserUser.fromJson(jsonDecode(res.body)[0]);
    return _user;
  }

  Future<List<WayPoint>> getWayPoints(Route route) async {
    var res = await http.post('$API_ADDRESS/route.php',
        headers: HEADERS,
        body: {'process': '6', 'id_route': route.id.toString()});
    if (res.body == '[{"id":0,"name":"Waypoint","latitude":0,"longitude":0}]')
      return [];
    return (jsonDecode(res.body) as List)
        .map((w) => WayPoint.fromJson(w))
        .toList();
  }

  Future<Null> register({String email, String name}) async {
    if (email == null) email = this.email;
    await http.post('$API_ADDRESS/user.php', headers: HEADERS, body: {
      'process': '17',
      'email': email,
      'name': name ?? email.split('@').first,
      'student_id': email.split('@').first
    });
  }
}
