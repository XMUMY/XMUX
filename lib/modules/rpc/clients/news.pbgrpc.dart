///
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;

import 'google/protobuf/empty.pb.dart' as $1;
import 'news.pb.dart' as $0;

export 'news.pb.dart';

class NewsClient extends $grpc.Client {
  static final _$createHomeSlider = $grpc.ClientMethod<$0.Slider, $1.Empty>(
      '/xmux.core.news.v4.News/CreateHomeSlider',
      ($0.Slider value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteHomeSlider =
      $grpc.ClientMethod<$0.DeleteSliderReq, $1.Empty>(
          '/xmux.core.news.v4.News/DeleteHomeSlider',
          ($0.DeleteSliderReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getHomeSliders = $grpc.ClientMethod<$1.Empty, $0.SlidersResp>(
      '/xmux.core.news.v4.News/GetHomeSliders',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SlidersResp.fromBuffer(value));
  static final _$createAnnouncement =
      $grpc.ClientMethod<$0.Announcement, $1.Empty>(
          '/xmux.core.news.v4.News/CreateAnnouncement',
          ($0.Announcement value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteAnnouncement =
      $grpc.ClientMethod<$0.DeleteAnnouncementReq, $1.Empty>(
          '/xmux.core.news.v4.News/DeleteAnnouncement',
          ($0.DeleteAnnouncementReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getAnnouncements =
      $grpc.ClientMethod<$1.Empty, $0.AnnouncementsResp>(
          '/xmux.core.news.v4.News/GetAnnouncements',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AnnouncementsResp.fromBuffer(value));

  NewsClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$1.Empty> createHomeSlider($0.Slider request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createHomeSlider, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> deleteHomeSlider($0.DeleteSliderReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteHomeSlider, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.SlidersResp> getHomeSliders($1.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getHomeSliders, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> createAnnouncement($0.Announcement request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createAnnouncement, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> deleteAnnouncement(
      $0.DeleteAnnouncementReq request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$deleteAnnouncement, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.AnnouncementsResp> getAnnouncements($1.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getAnnouncements, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class NewsServiceBase extends $grpc.Service {
  $core.String get $name => 'xmux.core.news.v4.News';

  NewsServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Slider, $1.Empty>(
        'CreateHomeSlider',
        createHomeSlider_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Slider.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteSliderReq, $1.Empty>(
        'DeleteHomeSlider',
        deleteHomeSlider_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteSliderReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.SlidersResp>(
        'GetHomeSliders',
        getHomeSliders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.SlidersResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Announcement, $1.Empty>(
        'CreateAnnouncement',
        createAnnouncement_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Announcement.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteAnnouncementReq, $1.Empty>(
        'DeleteAnnouncement',
        deleteAnnouncement_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteAnnouncementReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.AnnouncementsResp>(
        'GetAnnouncements',
        getAnnouncements_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.AnnouncementsResp value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> createHomeSlider_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Slider> request) async {
    return createHomeSlider(call, await request);
  }

  $async.Future<$1.Empty> deleteHomeSlider_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DeleteSliderReq> request) async {
    return deleteHomeSlider(call, await request);
  }

  $async.Future<$0.SlidersResp> getHomeSliders_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getHomeSliders(call, await request);
  }

  $async.Future<$1.Empty> createAnnouncement_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Announcement> request) async {
    return createAnnouncement(call, await request);
  }

  $async.Future<$1.Empty> deleteAnnouncement_Pre($grpc.ServiceCall call,
      $async.Future<$0.DeleteAnnouncementReq> request) async {
    return deleteAnnouncement(call, await request);
  }

  $async.Future<$0.AnnouncementsResp> getAnnouncements_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getAnnouncements(call, await request);
  }

  $async.Future<$1.Empty> createHomeSlider(
      $grpc.ServiceCall call, $0.Slider request);

  $async.Future<$1.Empty> deleteHomeSlider(
      $grpc.ServiceCall call, $0.DeleteSliderReq request);

  $async.Future<$0.SlidersResp> getHomeSliders(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> createAnnouncement(
      $grpc.ServiceCall call, $0.Announcement request);

  $async.Future<$1.Empty> deleteAnnouncement(
      $grpc.ServiceCall call, $0.DeleteAnnouncementReq request);

  $async.Future<$0.AnnouncementsResp> getAnnouncements(
      $grpc.ServiceCall call, $1.Empty request);
}
