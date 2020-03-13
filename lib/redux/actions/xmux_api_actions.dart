part of 'actions.dart';

/// General actions for XMUX API.
abstract class XMUXApiAction extends MainAppAction {
  /// A [Future] of API request process.
  /// It is [null] by default and will be assign by [apiRequestMiddleware].
  Future future;

  /// Called when [Exception] is caught.
  void Function(Exception) onError;

  /// Parameters for API request.
  final Map<String, String> params;

  /// Original API response.
  XmuxApiResponse response;

  XMUXApiAction({this.params});

  /// Make the action callable.
  /// Should be implemented by different API requests.
  Future<Null> call({Map<String, dynamic> params});
}

/// Update timetable of current semester.
class UpdateTimetableAction extends XMUXApiAction {
  GetTimetableResp timetable;

  UpdateTimetableAction();

  @override
  Future<Null> call({Map<String, dynamic> params}) async {
    response = await XmuxApi.instance.timetable;
    timetable = response.data;
  }
}

/// General actions for XMUX API.
abstract class XMUXApiActionV2 extends MainAppAction {
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

  XMUXApiActionV2({this.context, this.onError, this.params});

  /// Function for assigning status and timestamp.
  void assign(v2.XMUXApiResponse response) {
    this.status = response.status;
    this.timestamp = response.timestamp;
  }

  /// Make the action callable.
  ///
  /// It should be implement by different API requests.
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params});

  @override
  toString() => "MainAppAction/XMUXApiActionV2: ${this.runtimeType}";
}

class UpdateAcAction extends XMUXApiActionV2 {
  v2.AcData acData;

  UpdateAcAction({BuildContext context}) : super(context: context);

  @override
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await v2.XMUXApi.instance.ac(auth);
    assign(response);
    acData = response.data;
  }
}

class UpdateAssignmentsAction extends XMUXApiActionV2 {
  v2.MoodleData moodleData;
  String moodleKey;

  @override
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await v2.XMUXApi.instance.moodle(auth);
    assign(response);
    moodleData = response.data;
    moodleKey = response.moodleKey;
  }
}

class UpdateEPaymentRecordsAction extends XMUXApiActionV2 {
  List<v2.BillingRecord> ePaymentRecords;
  final v2.XMUXApiAuth auth;

  UpdateEPaymentRecordsAction(
      {this.auth, BuildContext context, Function onError})
      : super(context: context, onError: onError);

  @override
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await v2.XMUXApi.instance.bill(this.auth ?? auth);
    assign(response);
    ePaymentRecords = response.data;
  }
}

class UpdateCoursesAction extends XMUXApiActionV2 {
  v2.AcData acData;

  @override
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await v2.XMUXApi.instance.acCourses(auth);
    assign(response);
    acData = response.data;
  }
}

class UpdateInfoAction extends XMUXApiActionV2 {
  v2.Info info;

  @override
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await v2.XMUXApi.instance.acInfo(auth);
    assign(response);
    info = response.data;
  }
}

class UpdateHomepageAnnouncementsAction extends XMUXApiActionV2 {
  List<v2.Announcement> announcements;

  UpdateHomepageAnnouncementsAction({BuildContext context, Function onError})
      : super(context: context, onError: onError);

  @override
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await v2.XMUXApi.instance.homepageAnnouncements(auth);
    assign(response);
    announcements = response.data;
  }
}

class UpdateHomepageNewsAction extends XMUXApiActionV2 {
  List<v2.News> news;

  UpdateHomepageNewsAction({BuildContext context, Function onError})
      : super(context: context, onError: onError);

  @override
  Future<Null> call(v2.XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await v2.XMUXApi.instance.homepageNews();
    assign(response);
    news = response.data;
  }
}
