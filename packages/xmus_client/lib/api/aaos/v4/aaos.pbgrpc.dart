//
//  Generated code. Do not modify.
//  source: aaos/v4/aaos.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/empty.pb.dart' as $0;
import 'aaos.pb.dart' as $1;

export 'aaos.pb.dart';

@$pb.GrpcServiceName('xmux.core.aaos.v4.AAOS')
class AAOSClient extends $grpc.Client {
  static final _$getInfo = $grpc.ClientMethod<$0.Empty, $1.Info>(
      '/xmux.core.aaos.v4.AAOS/GetInfo',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Info.fromBuffer(value));
  static final _$getTimetable = $grpc.ClientMethod<$0.Empty, $1.Timetable>(
      '/xmux.core.aaos.v4.AAOS/GetTimetable',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Timetable.fromBuffer(value));
  static final _$getCourses = $grpc.ClientMethod<$0.Empty, $1.Courses>(
      '/xmux.core.aaos.v4.AAOS/GetCourses',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Courses.fromBuffer(value));
  static final _$getExams = $grpc.ClientMethod<$0.Empty, $1.Exams>(
      '/xmux.core.aaos.v4.AAOS/GetExams',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Exams.fromBuffer(value));
  static final _$getTranscript = $grpc.ClientMethod<$0.Empty, $1.Transcript>(
      '/xmux.core.aaos.v4.AAOS/GetTranscript',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Transcript.fromBuffer(value));

  AAOSClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Info> getInfo($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInfo, request, options: options);
  }

  $grpc.ResponseFuture<$1.Timetable> getTimetable($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTimetable, request, options: options);
  }

  $grpc.ResponseFuture<$1.Courses> getCourses($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCourses, request, options: options);
  }

  $grpc.ResponseFuture<$1.Exams> getExams($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getExams, request, options: options);
  }

  $grpc.ResponseFuture<$1.Transcript> getTranscript($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTranscript, request, options: options);
  }
}

@$pb.GrpcServiceName('xmux.core.aaos.v4.AAOS')
abstract class AAOSServiceBase extends $grpc.Service {
  $core.String get $name => 'xmux.core.aaos.v4.AAOS';

  AAOSServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Info>(
        'GetInfo',
        getInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Info value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Timetable>(
        'GetTimetable',
        getTimetable_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Timetable value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Courses>(
        'GetCourses',
        getCourses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Courses value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Exams>(
        'GetExams',
        getExams_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Exams value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.Transcript>(
        'GetTranscript',
        getTranscript_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.Transcript value) => value.writeToBuffer()));
  }

  $async.Future<$1.Info> getInfo_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getInfo(call, await request);
  }

  $async.Future<$1.Timetable> getTimetable_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTimetable(call, await request);
  }

  $async.Future<$1.Courses> getCourses_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getCourses(call, await request);
  }

  $async.Future<$1.Exams> getExams_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getExams(call, await request);
  }

  $async.Future<$1.Transcript> getTranscript_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTranscript(call, await request);
  }

  $async.Future<$1.Info> getInfo($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Timetable> getTimetable($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Courses> getCourses($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Exams> getExams($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$1.Transcript> getTranscript($grpc.ServiceCall call, $0.Empty request);
}
