import 'package:logger/logger.dart';
import 'package:moodle/moodle.dart';
import 'package:xmus_client/xmus_client.dart';

import 'foundation/config/config.dart';

/// Global logger.
final log = Logger();

/// RPC client.
final rpc = XMUXRpc(apiAddress);

/// Moodle client.
final moodle = MoodleApi(moodleAddress);
