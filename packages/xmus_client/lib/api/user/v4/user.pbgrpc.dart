// This is a generated file - do not edit.
//
// Generated from user/v4/user.proto.

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
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

import 'user.pb.dart' as $1;

export 'user.pb.dart';

@$pb.GrpcServiceName('xmux.core.user.v4.User')
class UserClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  UserClient(super.channel, {super.options, super.interceptors});

  /// Login with basic authorization.
  /// Will try to register during first login.
  /// Returns error if information not adequate to create user.
  $grpc.ResponseFuture<$1.LoginResp> login(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$login, request, options: options);
  }

  /// Register and login with provided information.
  $grpc.ResponseFuture<$1.LoginResp> register(
    $1.RegisterReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$register, request, options: options);
  }

  /// GetProfile of specified user.
  $grpc.ResponseFuture<$1.Profile> getProfile(
    $1.GetProfileReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getProfile, request, options: options);
  }

  /// RefreshDevice push key and last seen.
  $grpc.ResponseFuture<$0.Empty> refreshDevice(
    $1.RefreshDeviceReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$refreshDevice, request, options: options);
  }

  /// GetDevices of authenticated user.
  $grpc.ResponseFuture<$1.GetDevicesResp> getDevices(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDevices, request, options: options);
  }

  /// RevokeDevices will revoke firebase refresh token and delete all devices associated with user.
  $grpc.ResponseFuture<$0.Empty> revokeDevices(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$revokeDevices, request, options: options);
  }

  // method descriptors

  static final _$login = $grpc.ClientMethod<$0.Empty, $1.LoginResp>(
      '/xmux.core.user.v4.User/Login',
      ($0.Empty value) => value.writeToBuffer(),
      $1.LoginResp.fromBuffer);
  static final _$register = $grpc.ClientMethod<$1.RegisterReq, $1.LoginResp>(
      '/xmux.core.user.v4.User/Register',
      ($1.RegisterReq value) => value.writeToBuffer(),
      $1.LoginResp.fromBuffer);
  static final _$getProfile = $grpc.ClientMethod<$1.GetProfileReq, $1.Profile>(
      '/xmux.core.user.v4.User/GetProfile',
      ($1.GetProfileReq value) => value.writeToBuffer(),
      $1.Profile.fromBuffer);
  static final _$refreshDevice =
      $grpc.ClientMethod<$1.RefreshDeviceReq, $0.Empty>(
          '/xmux.core.user.v4.User/RefreshDevice',
          ($1.RefreshDeviceReq value) => value.writeToBuffer(),
          $0.Empty.fromBuffer);
  static final _$getDevices = $grpc.ClientMethod<$0.Empty, $1.GetDevicesResp>(
      '/xmux.core.user.v4.User/GetDevices',
      ($0.Empty value) => value.writeToBuffer(),
      $1.GetDevicesResp.fromBuffer);
  static final _$revokeDevices = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/xmux.core.user.v4.User/RevokeDevices',
      ($0.Empty value) => value.writeToBuffer(),
      $0.Empty.fromBuffer);
}

@$pb.GrpcServiceName('xmux.core.user.v4.User')
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
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return login($call, await $request);
  }

  $async.Future<$1.LoginResp> login($grpc.ServiceCall call, $0.Empty request);

  $async.Future<$1.LoginResp> register_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.RegisterReq> $request) async {
    return register($call, await $request);
  }

  $async.Future<$1.LoginResp> register(
      $grpc.ServiceCall call, $1.RegisterReq request);

  $async.Future<$1.Profile> getProfile_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.GetProfileReq> $request) async {
    return getProfile($call, await $request);
  }

  $async.Future<$1.Profile> getProfile(
      $grpc.ServiceCall call, $1.GetProfileReq request);

  $async.Future<$0.Empty> refreshDevice_Pre($grpc.ServiceCall $call,
      $async.Future<$1.RefreshDeviceReq> $request) async {
    return refreshDevice($call, await $request);
  }

  $async.Future<$0.Empty> refreshDevice(
      $grpc.ServiceCall call, $1.RefreshDeviceReq request);

  $async.Future<$1.GetDevicesResp> getDevices_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return getDevices($call, await $request);
  }

  $async.Future<$1.GetDevicesResp> getDevices(
      $grpc.ServiceCall call, $0.Empty request);

  $async.Future<$0.Empty> revokeDevices_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return revokeDevices($call, await $request);
  }

  $async.Future<$0.Empty> revokeDevices(
      $grpc.ServiceCall call, $0.Empty request);
}
