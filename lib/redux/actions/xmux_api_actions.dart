part of 'actions.dart';

/// General actions for XMUX API.
abstract class XMUXApiAction extends MainAppAction {
  /// Context for displaying snack bar.
  final BuildContext context;

  /// A listener for listening API request process.
  /// It is *null* by default and will be assign by *apiRequestMiddleware*.
  Future listener;

  /// Parameters for API request.
  final Map<String, String> params;

  /// The statue of API request.
  /// Will be assigned after API request.
  String status;

  /// Server-side timestamp.
  /// Will be assigned after API request.
  DateTime timestamp;

  XMUXApiAction({this.params, this.context});

  /// Function for assigning status and timestamp.
  void assign(XMUXApiResponse response) {
    this.status = response.status;
    this.timestamp = response.timestamp;
  }

  /// Make the action callable.
  ///
  /// It should be implement by different API requests.
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params});

  @override
  toString() => "MainAppAction/XMUXApiAction: ${this.runtimeType}";
}

class UpdateAcAction extends XMUXApiAction {
  AcData acData;

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.ac(auth);
    assign(response);
    acData = response.data;
  }
}

class UpdateAssignmentsAction extends XMUXApiAction {
  MoodleData moodleData;

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.moodle(auth);
    assign(response);
    moodleData = response.data;
  }
}

class UpdateBillAction extends XMUXApiAction {
  List<BillingRecord> billData;

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.bill(auth);
    assign(response);
    billData = response.data;
  }
}

class UpdateCoursesAction extends XMUXApiAction {
  AcData acData;

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.acCourses(auth);
    assign(response);
    acData = response.data;
  }
}
