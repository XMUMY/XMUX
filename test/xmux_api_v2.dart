import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:xmux/modules/xmux_api/xmux_api_v2.dart';

class MockConnectivity extends Mock implements Connectivity {
  Stream<ConnectivityResult> _onConnectivityChanged = Stream.empty();

  /// Fires whenever the connectivity state changes.
  Stream<ConnectivityResult> get onConnectivityChanged =>
      _onConnectivityChanged;
}

void main() {
  test('gg', () async {
    var mockConnectivity = MockConnectivity();
    var xmuxApi =
        XMUXApi(['https://api.xmux.cf'], connectivity: mockConnectivity);

    try {
      var ac =
          await xmuxApi.ac(XMUXApiAuth(campusID: 'gg', campusIDPassword: 'gg'));
      expect(ac.status, 'success');
    } on XMUXApiException catch (e) {
      expect(e.message, 'Wrong Campus ID or password');
    }
  });
}
