///
//  Generated code. Do not modify.
//  source: user.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'google/protobuf/empty.pb.dart' as $0;
import 'user.pb.dart' as $1;

export 'user.pb.dart';

class UserClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.Empty, $1.LoginResp>(
      '/xmux.core.user.v4.User/Login',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LoginResp.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$1.RegisterReq, $1.LoginResp>(
      '/xmux.core.user.v4.User/Register',
      ($1.RegisterReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LoginResp.fromBuffer(value));
  static final _$getProfile = $grpc.ClientMethod<$1.GetProfileReq, $1.Profile>(
      '/xmux.core.user.v4.User/GetProfile',
      ($1.GetProfileReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Profile.fromBuffer(value));
  static final _$refreshDevice =
      $grpc.ClientMethod<$1.RefreshDeviceReq, $0.Empty>(
          '/xmux.core.user.v4.User/RefreshDevice',
          ($1.RefreshDeviceReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getDevices = $grpc.ClientMethod<$0.Empty, $1.GetDevicesResp>(
      '/xmux.core.user.v4.User/GetDevices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetDevicesResp.fromBuffer(value));
  static final _$revokeDevices = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/xmux.core.user.v4.User/RevokeDevices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  UserClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.LoginResp> login($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$login, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.LoginResp> register($1.RegisterReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$register, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Profile> getProfile($1.GetProfileReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getProfile, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> refreshDevice($1.RefreshDeviceReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$refreshDevice, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.GetDevicesResp> getDevices($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getDevices, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Empty> revokeDevices($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$revokeDevices, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'xmux.core.user.v4.User';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.LoginResp>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.LoginResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RegisterReq, $1.LoginResp>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RegisterReq.fromBuffer(value),
        ($1.LoginResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetProfileReq, $1.Profile>(
        'GetProfile',
        getProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetProfileReq.fromBuffer(value),
        ($1.Profile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RefreshDeviceReq, $0.Empty>(
        'RefreshDevice',
        refreshDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RefreshDeviceReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.GetDevicesResp>(
        'GetDevices',
        getDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.GetDevicesResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'RevokeDevices',
        revokeDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.LoginResp> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return login(call, await request);
  }

  $async.Future<$1.LoginResp> register_Pre(
      $grpc.ServiceCall call, $async.Future<$1.RegisterReq> request) async {
    return register(call, await request);
  }

  $async.Future<$1.Profile> getProfile_Pre(
      $grpc.ServiceCall call, $async.Future<$1.GetProfileReq> request) async {
    return getProfile(call, await request);
  }

  $async.Future<$0.Empty> refreshDevice_Pre($grpc.ServiceCall call,
      $async.Future<$1.RefreshDeviceReq> request) async {
    return refreshDevice(call, await request);
  }

  $async.Future<$1.GetDevicesResp> getDevices_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getDevices(call, await request);
  }

  $async.Future<$0.Empty> revokeDevices_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return revokeDevices(call, await request);
  }

  $async.Future<$1.LoginResp> login($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.LoginResp> register(
      $grpc.ServiceCall call, $1.RegisterReq request);

  $async.Future<$1.Profile> getProfile(
      $grpc.ServiceCall call, $1.GetProfileReq request);

  $async.Future<$0.Empty> refreshDevice(
      $grpc.ServiceCall call, $1.RefreshDeviceReq request);

  $async.Future<$1.GetDevicesResp> getDevices(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> revokeDevices(
      $grpc.ServiceCall call, $0.Empty request);
}
