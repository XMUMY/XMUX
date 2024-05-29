import 'package:moodle/moodle.dart';
import 'package:xmus_client/xmus_client.dart';

import 'foundation/config/config.dart';

/// RPC client.
final rpc = XMUXRpc(apiAddress);

/// Moodle client.
final moodle = MoodleApi(moodleAddress);
