import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/service_api.dart';

/// Create client channel using gRPC native API.
ClientChannel createClientChannel(String address) =>
    grpc.ClientChannel(Uri.parse(address).host);
