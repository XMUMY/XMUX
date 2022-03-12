import 'package:emgs/model.dart';
import 'package:moodle/model/assignment.dart';
import 'package:redux/redux.dart';
import 'package:xmus_client/generated/aaos.pb.dart';
import 'package:xmus_client/generated/google/protobuf/empty.pb.dart';
import 'package:xmus_client/generated/user.pb.dart';

import '../../global.dart';
import '../state/state.dart';

part 'rpc.dart';

abstract class AppAction {
  const AppAction();

  /// Flag for state saving. (Default to [true])
  /// If false, app state will not be save when dispatch this action.
  bool get needSave => true;

  /// Flag for sync state saving. (Default to [false])
  /// If true, app state will be saved sync when dispatch this action.
  /// This flag only available when [needSave] is true.
  bool get syncSave => false;

  @override
  String toString() => 'AppAction: $runtimeType';
}

mixin AwaitableActionMixin<T> on AppAction {
  /// A [Future] of awaitable process.
  Future<T>? future;
}

mixin RedirectableActionMixin on AppAction {
  // Redirect to url after action is done.
  String? redirectTo;
}

abstract class ApiRequestAction extends AppAction
    with AwaitableActionMixin<void> {
  /// Parameters for API request.
  final Map<String, String> params;

  /// Called when [Exception] is caught.
  final void Function(Exception)? onError;

  ApiRequestAction({
    this.params = const {},
    this.onError,
  });

  Future<void> call(Store<AppState> store);
}

class InitializedAction extends AppAction with RedirectableActionMixin {
  @override
  String? get redirectTo => '/';

  @override
  bool get needSave => false;
}

class RestoreAction extends AppAction {
  final AppState state;

  const RestoreAction(this.state);

  @override
  bool get needSave => false;
}

class LoginAction extends AppAction with RedirectableActionMixin {
  final String campusId, password;

  LoginAction(this.campusId, this.password);

  @override
  String? get redirectTo => '/';

  @override
  bool get syncSave => true;
}

class LogoutAction extends RestoreAction with RedirectableActionMixin {
  LogoutAction() : super(AppState(isInitialized: true));

  @override
  String? get redirectTo => '/';

  @override
  bool get needSave => true;

  @override
  bool get syncSave => true;
}

class UpdateEPaymentPasswordAction extends AppAction {
  final String ePaymentPassword;

  UpdateEPaymentPasswordAction(this.ePaymentPassword);
}

class UpdateEmgsApplicationResultAction extends AppAction {
  final EmgsApplicationResult result;

  UpdateEmgsApplicationResultAction(this.result);
}
