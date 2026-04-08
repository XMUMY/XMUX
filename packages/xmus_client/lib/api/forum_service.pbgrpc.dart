// This is a generated file - do not edit.
//
// Generated from forum_service.proto.

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
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $2;

import 'forum.pb.dart' as $0;
import 'forum_notif.pb.dart' as $6;
import 'forum_post.pb.dart' as $3;
import 'forum_report.pb.dart' as $5;
import 'forum_saved.pb.dart' as $4;
import 'forum_thread.pb.dart' as $1;

export 'forum_service.pb.dart';

@$pb.GrpcServiceName('xmux.forum.v4.Forum')
class ForumClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ForumClient(super.channel, {super.options, super.interceptors});

  /// Get forums that accessible to the user.
  $grpc.ResponseFuture<$0.GetForumsResp> getForums(
    $0.GetForumsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getForums, request, options: options);
  }

  /// Creat a thread under a forum.
  $grpc.ResponseFuture<$1.CreateThreadResp> createThread(
    $1.CreateThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createThread, request, options: options);
  }

  /// Remove a thread, including all posts.
  /// Only admins/owner can remove the thread.
  $grpc.ResponseFuture<$2.Empty> removeThread(
    $1.RemoveThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeThread, request, options: options);
  }

  /// Update an existing thread.
  $grpc.ResponseFuture<$2.Empty> updateThread(
    $1.UpdateThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateThread, request, options: options);
  }

  /// Get threads under a forum.
  $grpc.ResponseFuture<$1.GetThreadsResp> getThreads(
    $1.GetThreadsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getThreads, request, options: options);
  }

  /// Like/Dislike a thread.
  $grpc.ResponseFuture<$2.Empty> likeThread(
    $1.LikeThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$likeThread, request, options: options);
  }

  /// Pin/unpin a thread.
  $grpc.ResponseFuture<$2.Empty> pinThread(
    $1.PinThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pinThread, request, options: options);
  }

  /// Make thread a digest.
  $grpc.ResponseFuture<$2.Empty> digestThread(
    $1.DigestThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$digestThread, request, options: options);
  }

  /// Creat a post under a thread.
  $grpc.ResponseFuture<$3.CreatePostResp> createPost(
    $3.CreatePostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createPost, request, options: options);
  }

  /// Remove a post, including all children.
  $grpc.ResponseFuture<$2.Empty> removePost(
    $3.RemovePostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removePost, request, options: options);
  }

  /// Get posts under a thread.
  $grpc.ResponseFuture<$3.GetPostsResp> getPosts(
    $3.GetPostsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPosts, request, options: options);
  }

  /// Get posts of a user.
  $grpc.ResponseFuture<$3.GetPostsResp> getPostsByUid(
    $3.GetPostsByUidReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPostsByUid, request, options: options);
  }

  /// Get posts under another post.
  $grpc.ResponseFuture<$3.GetPostsResp> getPostsByParent(
    $3.GetPostsByParentReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPostsByParent, request, options: options);
  }

  /// Like/Dislike a post.
  $grpc.ResponseFuture<$2.Empty> likePost(
    $3.LikePostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$likePost, request, options: options);
  }

  /// Pin/unpin a post.
  $grpc.ResponseFuture<$2.Empty> pinPost(
    $3.PinPostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$pinPost, request, options: options);
  }

  /// Save a thread.
  $grpc.ResponseFuture<$2.Empty> saveThread(
    $4.SaveThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$saveThread, request, options: options);
  }

  /// Save a post.
  $grpc.ResponseFuture<$2.Empty> savePost(
    $4.SavePostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$savePost, request, options: options);
  }

  /// Unsave a thread
  $grpc.ResponseFuture<$2.Empty> unsaveThread(
    $4.UnsaveThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unsaveThread, request, options: options);
  }

  /// Unsave a post.
  $grpc.ResponseFuture<$2.Empty> unsavePost(
    $4.UnsavePostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unsavePost, request, options: options);
  }

  /// Get saved threads.
  $grpc.ResponseFuture<$1.GetThreadsResp> getSavedThreads(
    $4.GetSavedThreadsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSavedThreads, request, options: options);
  }

  /// Get saved posts.
  $grpc.ResponseFuture<$3.GetPostsResp> getSavedPosts(
    $4.GetSavedPostsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSavedPosts, request, options: options);
  }

  /// Reporting
  $grpc.ResponseFuture<$5.ReportPostOrThreadResp> reportPostOrThread(
    $5.ReportPostOrThreadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$reportPostOrThread, request, options: options);
  }

  $grpc.ResponseFuture<$5.GetReportTypesResp> getReportTypes(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getReportTypes, request, options: options);
  }

  /// Notif
  $grpc.ResponseFuture<$6.GetNotifNumResp> getNotifNum(
    $2.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getNotifNum, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetNotifResp> getNotif(
    $6.GetNotifReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getNotif, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> notifMarkAsRead(
    $6.NotifMarkAsReadReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$notifMarkAsRead, request, options: options);
  }

  // method descriptors

  static final _$getForums =
      $grpc.ClientMethod<$0.GetForumsReq, $0.GetForumsResp>(
          '/xmux.forum.v4.Forum/GetForums',
          ($0.GetForumsReq value) => value.writeToBuffer(),
          $0.GetForumsResp.fromBuffer);
  static final _$createThread =
      $grpc.ClientMethod<$1.CreateThreadReq, $1.CreateThreadResp>(
          '/xmux.forum.v4.Forum/CreateThread',
          ($1.CreateThreadReq value) => value.writeToBuffer(),
          $1.CreateThreadResp.fromBuffer);
  static final _$removeThread =
      $grpc.ClientMethod<$1.RemoveThreadReq, $2.Empty>(
          '/xmux.forum.v4.Forum/RemoveThread',
          ($1.RemoveThreadReq value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$updateThread =
      $grpc.ClientMethod<$1.UpdateThreadReq, $2.Empty>(
          '/xmux.forum.v4.Forum/UpdateThread',
          ($1.UpdateThreadReq value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$getThreads =
      $grpc.ClientMethod<$1.GetThreadsReq, $1.GetThreadsResp>(
          '/xmux.forum.v4.Forum/GetThreads',
          ($1.GetThreadsReq value) => value.writeToBuffer(),
          $1.GetThreadsResp.fromBuffer);
  static final _$likeThread = $grpc.ClientMethod<$1.LikeThreadReq, $2.Empty>(
      '/xmux.forum.v4.Forum/LikeThread',
      ($1.LikeThreadReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$pinThread = $grpc.ClientMethod<$1.PinThreadReq, $2.Empty>(
      '/xmux.forum.v4.Forum/PinThread',
      ($1.PinThreadReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$digestThread =
      $grpc.ClientMethod<$1.DigestThreadReq, $2.Empty>(
          '/xmux.forum.v4.Forum/DigestThread',
          ($1.DigestThreadReq value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$createPost =
      $grpc.ClientMethod<$3.CreatePostReq, $3.CreatePostResp>(
          '/xmux.forum.v4.Forum/CreatePost',
          ($3.CreatePostReq value) => value.writeToBuffer(),
          $3.CreatePostResp.fromBuffer);
  static final _$removePost = $grpc.ClientMethod<$3.RemovePostReq, $2.Empty>(
      '/xmux.forum.v4.Forum/RemovePost',
      ($3.RemovePostReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$getPosts = $grpc.ClientMethod<$3.GetPostsReq, $3.GetPostsResp>(
      '/xmux.forum.v4.Forum/GetPosts',
      ($3.GetPostsReq value) => value.writeToBuffer(),
      $3.GetPostsResp.fromBuffer);
  static final _$getPostsByUid =
      $grpc.ClientMethod<$3.GetPostsByUidReq, $3.GetPostsResp>(
          '/xmux.forum.v4.Forum/GetPostsByUid',
          ($3.GetPostsByUidReq value) => value.writeToBuffer(),
          $3.GetPostsResp.fromBuffer);
  static final _$getPostsByParent =
      $grpc.ClientMethod<$3.GetPostsByParentReq, $3.GetPostsResp>(
          '/xmux.forum.v4.Forum/GetPostsByParent',
          ($3.GetPostsByParentReq value) => value.writeToBuffer(),
          $3.GetPostsResp.fromBuffer);
  static final _$likePost = $grpc.ClientMethod<$3.LikePostReq, $2.Empty>(
      '/xmux.forum.v4.Forum/LikePost',
      ($3.LikePostReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$pinPost = $grpc.ClientMethod<$3.PinPostReq, $2.Empty>(
      '/xmux.forum.v4.Forum/PinPost',
      ($3.PinPostReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$saveThread = $grpc.ClientMethod<$4.SaveThreadReq, $2.Empty>(
      '/xmux.forum.v4.Forum/SaveThread',
      ($4.SaveThreadReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$savePost = $grpc.ClientMethod<$4.SavePostReq, $2.Empty>(
      '/xmux.forum.v4.Forum/SavePost',
      ($4.SavePostReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$unsaveThread =
      $grpc.ClientMethod<$4.UnsaveThreadReq, $2.Empty>(
          '/xmux.forum.v4.Forum/UnsaveThread',
          ($4.UnsaveThreadReq value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
  static final _$unsavePost = $grpc.ClientMethod<$4.UnsavePostReq, $2.Empty>(
      '/xmux.forum.v4.Forum/UnsavePost',
      ($4.UnsavePostReq value) => value.writeToBuffer(),
      $2.Empty.fromBuffer);
  static final _$getSavedThreads =
      $grpc.ClientMethod<$4.GetSavedThreadsReq, $1.GetThreadsResp>(
          '/xmux.forum.v4.Forum/GetSavedThreads',
          ($4.GetSavedThreadsReq value) => value.writeToBuffer(),
          $1.GetThreadsResp.fromBuffer);
  static final _$getSavedPosts =
      $grpc.ClientMethod<$4.GetSavedPostsReq, $3.GetPostsResp>(
          '/xmux.forum.v4.Forum/GetSavedPosts',
          ($4.GetSavedPostsReq value) => value.writeToBuffer(),
          $3.GetPostsResp.fromBuffer);
  static final _$reportPostOrThread =
      $grpc.ClientMethod<$5.ReportPostOrThreadReq, $5.ReportPostOrThreadResp>(
          '/xmux.forum.v4.Forum/ReportPostOrThread',
          ($5.ReportPostOrThreadReq value) => value.writeToBuffer(),
          $5.ReportPostOrThreadResp.fromBuffer);
  static final _$getReportTypes =
      $grpc.ClientMethod<$2.Empty, $5.GetReportTypesResp>(
          '/xmux.forum.v4.Forum/GetReportTypes',
          ($2.Empty value) => value.writeToBuffer(),
          $5.GetReportTypesResp.fromBuffer);
  static final _$getNotifNum = $grpc.ClientMethod<$2.Empty, $6.GetNotifNumResp>(
      '/xmux.forum.v4.Forum/GetNotifNum',
      ($2.Empty value) => value.writeToBuffer(),
      $6.GetNotifNumResp.fromBuffer);
  static final _$getNotif = $grpc.ClientMethod<$6.GetNotifReq, $6.GetNotifResp>(
      '/xmux.forum.v4.Forum/GetNotif',
      ($6.GetNotifReq value) => value.writeToBuffer(),
      $6.GetNotifResp.fromBuffer);
  static final _$notifMarkAsRead =
      $grpc.ClientMethod<$6.NotifMarkAsReadReq, $2.Empty>(
          '/xmux.forum.v4.Forum/NotifMarkAsRead',
          ($6.NotifMarkAsReadReq value) => value.writeToBuffer(),
          $2.Empty.fromBuffer);
}

@$pb.GrpcServiceName('xmux.forum.v4.Forum')
abstract class ForumServiceBase extends $grpc.Service {
  $core.String get $name => 'xmux.forum.v4.Forum';

  ForumServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetForumsReq, $0.GetForumsResp>(
        'GetForums',
        getForums_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetForumsReq.fromBuffer(value),
        ($0.GetForumsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CreateThreadReq, $1.CreateThreadResp>(
        'CreateThread',
        createThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateThreadReq.fromBuffer(value),
        ($1.CreateThreadResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.RemoveThreadReq, $2.Empty>(
        'RemoveThread',
        removeThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.RemoveThreadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.UpdateThreadReq, $2.Empty>(
        'UpdateThread',
        updateThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.UpdateThreadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetThreadsReq, $1.GetThreadsResp>(
        'GetThreads',
        getThreads_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetThreadsReq.fromBuffer(value),
        ($1.GetThreadsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.LikeThreadReq, $2.Empty>(
        'LikeThread',
        likeThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.LikeThreadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.PinThreadReq, $2.Empty>(
        'PinThread',
        pinThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.PinThreadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.DigestThreadReq, $2.Empty>(
        'DigestThread',
        digestThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.DigestThreadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreatePostReq, $3.CreatePostResp>(
        'CreatePost',
        createPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreatePostReq.fromBuffer(value),
        ($3.CreatePostResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.RemovePostReq, $2.Empty>(
        'RemovePost',
        removePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.RemovePostReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetPostsReq, $3.GetPostsResp>(
        'GetPosts',
        getPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetPostsReq.fromBuffer(value),
        ($3.GetPostsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetPostsByUidReq, $3.GetPostsResp>(
        'GetPostsByUid',
        getPostsByUid_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetPostsByUidReq.fromBuffer(value),
        ($3.GetPostsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetPostsByParentReq, $3.GetPostsResp>(
        'GetPostsByParent',
        getPostsByParent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $3.GetPostsByParentReq.fromBuffer(value),
        ($3.GetPostsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.LikePostReq, $2.Empty>(
        'LikePost',
        likePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.LikePostReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.PinPostReq, $2.Empty>(
        'PinPost',
        pinPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.PinPostReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SaveThreadReq, $2.Empty>(
        'SaveThread',
        saveThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.SaveThreadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SavePostReq, $2.Empty>(
        'SavePost',
        savePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.SavePostReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UnsaveThreadReq, $2.Empty>(
        'UnsaveThread',
        unsaveThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UnsaveThreadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UnsavePostReq, $2.Empty>(
        'UnsavePost',
        unsavePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UnsavePostReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetSavedThreadsReq, $1.GetThreadsResp>(
        'GetSavedThreads',
        getSavedThreads_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetSavedThreadsReq.fromBuffer(value),
        ($1.GetThreadsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetSavedPostsReq, $3.GetPostsResp>(
        'GetSavedPosts',
        getSavedPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetSavedPostsReq.fromBuffer(value),
        ($3.GetPostsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ReportPostOrThreadReq,
            $5.ReportPostOrThreadResp>(
        'ReportPostOrThread',
        reportPostOrThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $5.ReportPostOrThreadReq.fromBuffer(value),
        ($5.ReportPostOrThreadResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $5.GetReportTypesResp>(
        'GetReportTypes',
        getReportTypes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($5.GetReportTypesResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $6.GetNotifNumResp>(
        'GetNotifNum',
        getNotifNum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($6.GetNotifNumResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetNotifReq, $6.GetNotifResp>(
        'GetNotif',
        getNotif_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetNotifReq.fromBuffer(value),
        ($6.GetNotifResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.NotifMarkAsReadReq, $2.Empty>(
        'NotifMarkAsRead',
        notifMarkAsRead_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $6.NotifMarkAsReadReq.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetForumsResp> getForums_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetForumsReq> $request) async {
    return getForums($call, await $request);
  }

  $async.Future<$0.GetForumsResp> getForums(
      $grpc.ServiceCall call, $0.GetForumsReq request);

  $async.Future<$1.CreateThreadResp> createThread_Pre($grpc.ServiceCall $call,
      $async.Future<$1.CreateThreadReq> $request) async {
    return createThread($call, await $request);
  }

  $async.Future<$1.CreateThreadResp> createThread(
      $grpc.ServiceCall call, $1.CreateThreadReq request);

  $async.Future<$2.Empty> removeThread_Pre($grpc.ServiceCall $call,
      $async.Future<$1.RemoveThreadReq> $request) async {
    return removeThread($call, await $request);
  }

  $async.Future<$2.Empty> removeThread(
      $grpc.ServiceCall call, $1.RemoveThreadReq request);

  $async.Future<$2.Empty> updateThread_Pre($grpc.ServiceCall $call,
      $async.Future<$1.UpdateThreadReq> $request) async {
    return updateThread($call, await $request);
  }

  $async.Future<$2.Empty> updateThread(
      $grpc.ServiceCall call, $1.UpdateThreadReq request);

  $async.Future<$1.GetThreadsResp> getThreads_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.GetThreadsReq> $request) async {
    return getThreads($call, await $request);
  }

  $async.Future<$1.GetThreadsResp> getThreads(
      $grpc.ServiceCall call, $1.GetThreadsReq request);

  $async.Future<$2.Empty> likeThread_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.LikeThreadReq> $request) async {
    return likeThread($call, await $request);
  }

  $async.Future<$2.Empty> likeThread(
      $grpc.ServiceCall call, $1.LikeThreadReq request);

  $async.Future<$2.Empty> pinThread_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.PinThreadReq> $request) async {
    return pinThread($call, await $request);
  }

  $async.Future<$2.Empty> pinThread(
      $grpc.ServiceCall call, $1.PinThreadReq request);

  $async.Future<$2.Empty> digestThread_Pre($grpc.ServiceCall $call,
      $async.Future<$1.DigestThreadReq> $request) async {
    return digestThread($call, await $request);
  }

  $async.Future<$2.Empty> digestThread(
      $grpc.ServiceCall call, $1.DigestThreadReq request);

  $async.Future<$3.CreatePostResp> createPost_Pre(
      $grpc.ServiceCall $call, $async.Future<$3.CreatePostReq> $request) async {
    return createPost($call, await $request);
  }

  $async.Future<$3.CreatePostResp> createPost(
      $grpc.ServiceCall call, $3.CreatePostReq request);

  $async.Future<$2.Empty> removePost_Pre(
      $grpc.ServiceCall $call, $async.Future<$3.RemovePostReq> $request) async {
    return removePost($call, await $request);
  }

  $async.Future<$2.Empty> removePost(
      $grpc.ServiceCall call, $3.RemovePostReq request);

  $async.Future<$3.GetPostsResp> getPosts_Pre(
      $grpc.ServiceCall $call, $async.Future<$3.GetPostsReq> $request) async {
    return getPosts($call, await $request);
  }

  $async.Future<$3.GetPostsResp> getPosts(
      $grpc.ServiceCall call, $3.GetPostsReq request);

  $async.Future<$3.GetPostsResp> getPostsByUid_Pre($grpc.ServiceCall $call,
      $async.Future<$3.GetPostsByUidReq> $request) async {
    return getPostsByUid($call, await $request);
  }

  $async.Future<$3.GetPostsResp> getPostsByUid(
      $grpc.ServiceCall call, $3.GetPostsByUidReq request);

  $async.Future<$3.GetPostsResp> getPostsByParent_Pre($grpc.ServiceCall $call,
      $async.Future<$3.GetPostsByParentReq> $request) async {
    return getPostsByParent($call, await $request);
  }

  $async.Future<$3.GetPostsResp> getPostsByParent(
      $grpc.ServiceCall call, $3.GetPostsByParentReq request);

  $async.Future<$2.Empty> likePost_Pre(
      $grpc.ServiceCall $call, $async.Future<$3.LikePostReq> $request) async {
    return likePost($call, await $request);
  }

  $async.Future<$2.Empty> likePost(
      $grpc.ServiceCall call, $3.LikePostReq request);

  $async.Future<$2.Empty> pinPost_Pre(
      $grpc.ServiceCall $call, $async.Future<$3.PinPostReq> $request) async {
    return pinPost($call, await $request);
  }

  $async.Future<$2.Empty> pinPost(
      $grpc.ServiceCall call, $3.PinPostReq request);

  $async.Future<$2.Empty> saveThread_Pre(
      $grpc.ServiceCall $call, $async.Future<$4.SaveThreadReq> $request) async {
    return saveThread($call, await $request);
  }

  $async.Future<$2.Empty> saveThread(
      $grpc.ServiceCall call, $4.SaveThreadReq request);

  $async.Future<$2.Empty> savePost_Pre(
      $grpc.ServiceCall $call, $async.Future<$4.SavePostReq> $request) async {
    return savePost($call, await $request);
  }

  $async.Future<$2.Empty> savePost(
      $grpc.ServiceCall call, $4.SavePostReq request);

  $async.Future<$2.Empty> unsaveThread_Pre($grpc.ServiceCall $call,
      $async.Future<$4.UnsaveThreadReq> $request) async {
    return unsaveThread($call, await $request);
  }

  $async.Future<$2.Empty> unsaveThread(
      $grpc.ServiceCall call, $4.UnsaveThreadReq request);

  $async.Future<$2.Empty> unsavePost_Pre(
      $grpc.ServiceCall $call, $async.Future<$4.UnsavePostReq> $request) async {
    return unsavePost($call, await $request);
  }

  $async.Future<$2.Empty> unsavePost(
      $grpc.ServiceCall call, $4.UnsavePostReq request);

  $async.Future<$1.GetThreadsResp> getSavedThreads_Pre($grpc.ServiceCall $call,
      $async.Future<$4.GetSavedThreadsReq> $request) async {
    return getSavedThreads($call, await $request);
  }

  $async.Future<$1.GetThreadsResp> getSavedThreads(
      $grpc.ServiceCall call, $4.GetSavedThreadsReq request);

  $async.Future<$3.GetPostsResp> getSavedPosts_Pre($grpc.ServiceCall $call,
      $async.Future<$4.GetSavedPostsReq> $request) async {
    return getSavedPosts($call, await $request);
  }

  $async.Future<$3.GetPostsResp> getSavedPosts(
      $grpc.ServiceCall call, $4.GetSavedPostsReq request);

  $async.Future<$5.ReportPostOrThreadResp> reportPostOrThread_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$5.ReportPostOrThreadReq> $request) async {
    return reportPostOrThread($call, await $request);
  }

  $async.Future<$5.ReportPostOrThreadResp> reportPostOrThread(
      $grpc.ServiceCall call, $5.ReportPostOrThreadReq request);

  $async.Future<$5.GetReportTypesResp> getReportTypes_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getReportTypes($call, await $request);
  }

  $async.Future<$5.GetReportTypesResp> getReportTypes(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$6.GetNotifNumResp> getNotifNum_Pre(
      $grpc.ServiceCall $call, $async.Future<$2.Empty> $request) async {
    return getNotifNum($call, await $request);
  }

  $async.Future<$6.GetNotifNumResp> getNotifNum(
      $grpc.ServiceCall call, $2.Empty request);

  $async.Future<$6.GetNotifResp> getNotif_Pre(
      $grpc.ServiceCall $call, $async.Future<$6.GetNotifReq> $request) async {
    return getNotif($call, await $request);
  }

  $async.Future<$6.GetNotifResp> getNotif(
      $grpc.ServiceCall call, $6.GetNotifReq request);

  $async.Future<$2.Empty> notifMarkAsRead_Pre($grpc.ServiceCall $call,
      $async.Future<$6.NotifMarkAsReadReq> $request) async {
    return notifMarkAsRead($call, await $request);
  }

  $async.Future<$2.Empty> notifMarkAsRead(
      $grpc.ServiceCall call, $6.NotifMarkAsReadReq request);
}
