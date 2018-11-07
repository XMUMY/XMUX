part of 'actions.dart';

/// General actions for XMUX API.
abstract class XMUXApiAction extends MainAppAction {
  /// Context for displaying snack bar.
  /// Only available when [onError] is *null*;
  final BuildContext context;

  /// A listener for listening API request process.
  /// It is *null* by default and will be assign by *apiRequestMiddleware*.
  Future listener;

  /// Function called on error.
  final Function onError;

  /// Parameters for API request.
  final Map<String, String> params;

  /// The statue of API request.
  /// Will be assigned after API request.
  String status;

  /// Server-side timestamp.
  /// Will be assigned after API request.
  DateTime timestamp;

  XMUXApiAction({this.context, this.onError, this.params});

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

  UpdateAcAction({BuildContext context}) : super(context: context);

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.ac(auth);
    assign(response);
    acData = response.data;
  }
}

class UpdateAssignmentsAction extends XMUXApiAction {
  MoodleData moodleData;
  String moodleKey;

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.moodle(auth);
    assign(response);
    moodleData = response.data;
    moodleKey = response.moodleKey;
  }
}

class UpdateEPaymentRecordsAction extends XMUXApiAction {
  List<BillingRecord> ePaymentRecords;
  final XMUXApiAuth auth;

  UpdateEPaymentRecordsAction(
      {this.auth, BuildContext context, Function onError})
      : super(context: context, onError: onError);

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.bill(this.auth ?? auth);
    assign(response);
    ePaymentRecords = response.data;
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
