///
//  Generated code. Do not modify.
//  source: lost_found.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'lost_found.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'lost_found.pb.dart';

class LostAndFoundClient extends $grpc.Client {
  static final _$getBriefs =
      $grpc.ClientMethod<$0.GetBriefsReq, $0.GetBriefsResp>(
          '/xmux.lost_found.v4.LostAndFound/GetBriefs',
          ($0.GetBriefsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetBriefsResp.fromBuffer(value));
  static final _$getDetail =
      $grpc.ClientMethod<$0.GetDetailReq, $0.LostAndFoundDetail>(
          '/xmux.lost_found.v4.LostAndFound/GetDetail',
          ($0.GetDetailReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.LostAndFoundDetail.fromBuffer(value));
  static final _$addItem = $grpc.ClientMethod<$0.AddItemReq, $1.Empty>(
      '/xmux.lost_found.v4.LostAndFound/AddItem',
      ($0.AddItemReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteItem = $grpc.ClientMethod<$0.DeleteItemReq, $1.Empty>(
      '/xmux.lost_found.v4.LostAndFound/DeleteItem',
      ($0.DeleteItemReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  LostAndFoundClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetBriefsResp> getBriefs($0.GetBriefsReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBriefs, request, options: options);
  }

  $grpc.ResponseFuture<$0.LostAndFoundDetail> getDetail($0.GetDetailReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDetail, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> addItem($0.AddItemReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addItem, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteItem($0.DeleteItemReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteItem, request, options: options);
  }
}

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
      $grpc.ServiceCall call, $async.Future<$0.GetBriefsReq> request) async {
    return getBriefs(call, await request);
  }

  $async.Future<$0.LostAndFoundDetail> getDetail_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetDetailReq> request) async {
    return getDetail(call, await request);
  }

  $async.Future<$1.Empty> addItem_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AddItemReq> request) async {
    return addItem(call, await request);
  }

  $async.Future<$1.Empty> deleteItem_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DeleteItemReq> request) async {
    return deleteItem(call, await request);
  }

  $async.Future<$0.GetBriefsResp> getBriefs(
      $grpc.ServiceCall call, $0.GetBriefsReq request);
  $async.Future<$0.LostAndFoundDetail> getDetail(
      $grpc.ServiceCall call, $0.GetDetailReq request);
  $async.Future<$1.Empty> addItem(
      $grpc.ServiceCall call, $0.AddItemReq request);
  $async.Future<$1.Empty> deleteItem(
      $grpc.ServiceCall call, $0.DeleteItemReq request);
}
