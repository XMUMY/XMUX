import 'package:grpc/grpc_web.dart' as grpc;
import 'package:grpc/service_api.dart';

/// Create client channel using gRPC web API.
ClientChannel createClientChannel(String address) =>
    grpc.GrpcWebClientChannel.xhr(Uri.parse(address));
