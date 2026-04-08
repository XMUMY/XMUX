// This is a generated file - do not edit.
//
// Generated from lost_found/v4/lost_found.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $1;

import 'lost_found.pb.dart' as $0;

export 'lost_found.pb.dart';

@$pb.GrpcServiceName('xmux.lost_found.v4.LostAndFound')
class LostAndFoundClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  LostAndFoundClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetBriefsResp> getBriefs(
    $0.GetBriefsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBriefs, request, options: options);
  }

  $grpc.ResponseFuture<$0.LostAndFoundDetail> getDetail(
    $0.GetDetailReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDetail, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> addItem(
    $0.AddItemReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addItem, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteItem(
    $0.DeleteItemReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteItem, request, options: options);
  }

  // method descriptors

  static final _$getBriefs =
      $grpc.ClientMethod<$0.GetBriefsReq, $0.GetBriefsResp>(
          '/xmux.lost_found.v4.LostAndFound/GetBriefs',
          ($0.GetBriefsReq value) => value.writeToBuffer(),
          $0.GetBriefsResp.fromBuffer);
  static final _$getDetail =
      $grpc.ClientMethod<$0.GetDetailReq, $0.LostAndFoundDetail>(
          '/xmux.lost_found.v4.LostAndFound/GetDetail',
          ($0.GetDetailReq value) => value.writeToBuffer(),
          $0.LostAndFoundDetail.fromBuffer);
  static final _$addItem = $grpc.ClientMethod<$0.AddItemReq, $1.Empty>(
      '/xmux.lost_found.v4.LostAndFound/AddItem',
      ($0.AddItemReq value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$deleteItem = $grpc.ClientMethod<$0.DeleteItemReq, $1.Empty>(
      '/xmux.lost_found.v4.LostAndFound/DeleteItem',
      ($0.DeleteItemReq value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
}

@$pb.GrpcServiceName('xmux.lost_found.v4.LostAndFound')
abstract class LostAndFoundServiceBase extends $grpc.Service {
  $core.String get $name => 'xmux.lost_found.v4.LostAndFound';

  LostAndFoundServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetBriefsReq, $0.GetBriefsResp>(
        'GetBriefs',
        getBriefs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBriefsReq.fromBuffer(value),
        ($0.GetBriefsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDetailReq, $0.LostAndFoundDetail>(
        'GetDetail',
        getDetail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDetailReq.fromBuffer(value),
        ($0.LostAndFoundDetail value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddItemReq, $1.Empty>(
        'AddItem',
        addItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddItemReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteItemReq, $1.Empty>(
        'DeleteItem',
        deleteItem_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteItemReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetBriefsResp> getBriefs_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetBriefsReq> $request) async {
    return getBriefs($call, await $request);
  }

  $async.Future<$0.GetBriefsResp> getBriefs(
      $grpc.ServiceCall call, $0.GetBriefsReq request);

  $async.Future<$0.LostAndFoundDetail> getDetail_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetDetailReq> $request) async {
    return getDetail($call, await $request);
  }

  $async.Future<$0.LostAndFoundDetail> getDetail(
      $grpc.ServiceCall call, $0.GetDetailReq request);

  $async.Future<$1.Empty> addItem_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.AddItemReq> $request) async {
    return addItem($call, await $request);
  }

  $async.Future<$1.Empty> addItem(
      $grpc.ServiceCall call, $0.AddItemReq request);

  $async.Future<$1.Empty> deleteItem_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.DeleteItemReq> $request) async {
    return deleteItem($call, await $request);
  }

  $async.Future<$1.Empty> deleteItem(
      $grpc.ServiceCall call, $0.DeleteItemReq request);
}
