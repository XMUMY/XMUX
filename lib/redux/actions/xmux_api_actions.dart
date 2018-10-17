part of 'actions.dart';

/// General actions for XMUX API.
abstract class XMUXApiAction extends MainAppAction {
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

  XMUXApiAction({this.params});

  /// Make the action callable.
  ///
  /// It should be implement by different API requests.
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params});

  /// Function for assigning status and timestamp.
  void assign(String status, DateTime timestamp) {
    this.status = status;
    this.timestamp = timestamp;
  }

  @override
  toString() => "MainAppAction/XMUXApiAction: ${this.runtimeType}";
}

class UpdateAcAction extends XMUXApiAction {
  AcData acData;

  @override
  Future<Null> call(XMUXApiAuth auth, {Map<String, dynamic> params}) async {
    var response = await xmuxApi.ac(auth);
    assign(response.status, response.timestamp);
    acData = response.data;
  }

  UpdateAcAction();
}
