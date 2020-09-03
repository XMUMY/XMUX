import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(createToJson: false)
class XmuxRpcError implements Exception {
  @JsonKey(name: 'id', nullable: false)
  final String service;
  final int code;
  final String status;
  final String detail;

  XmuxRpcError(this.service, this.code, this.status, this.detail);

  factory XmuxRpcError.fromJson(Map<String, dynamic> json) =>
      _$XmuxRpcErrorFromJson(json);

  factory XmuxRpcError.parse(GrpcError error) {
    return XmuxRpcError.fromJson(jsonDecode(error.message));
  }
}

extension XmuxRpcErrorConverter<T> on ResponseFuture<T> {
  /// Try to convert [GrpcError] to [XmuxRpcError].
  Future<T> get convertRpcError => this.catchError((e) {
        try {
          throw XmuxRpcError.parse(e);
        } on XmuxRpcError catch (_) {
          rethrow;
        } catch (_) {
          throw e;
        }
      }, test: (e) => e is GrpcError);
}
