import 'package:grpc/grpc.dart';

class XmuxRpcError implements Exception {
  final GrpcError grpcError;

  final String domain;
  final String reason;
  final String message;

  XmuxRpcError({
    required this.grpcError,
    required this.domain,
    required this.reason,
    required this.message,
  });

  factory XmuxRpcError.parse(GrpcError error) {
    return XmuxRpcError(
      grpcError: error,
      domain: error.details?.first.getField(2) ?? '',
      reason: error.details?.first.getField(1) ?? 'UNKNOWN',
      message: error.message ?? '',
    );
  }
}

extension XmuxRpcErrorConverter<T> on ResponseFuture<T> {
  /// Try to convert [GrpcError] to [XmuxRpcError].
  Future<T> get convertRpcError => catchError(
        (e) {
          try {
            throw XmuxRpcError.parse(e);
          } on XmuxRpcError catch (_) {
            rethrow;
          } catch (_) {
            throw e;
          }
        },
        test: (e) => e is GrpcError,
      );
}
