import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../config.dart';
import 'client.dart';

class WsClient extends ChatClient {
  late WebSocketChannel _channel;

  @override
  void setupStream() {
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://$apiAddress/chat/v1/stream'),
    );
  }

  @override
  void disposeStream() {
    _channel.sink.close();
  }
}
