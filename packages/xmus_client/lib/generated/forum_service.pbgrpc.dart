///
//  Generated code. Do not modify.
//  source: forum_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'forum.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
import 'forum_thread.pb.dart' as $2;
import 'forum_post.pb.dart' as $3;
import 'forum_saved.pb.dart' as $4;
export 'forum_service.pb.dart';

class ForumClient extends $grpc.Client {
  static final _$createForum =
      $grpc.ClientMethod<$0.CreateForumReq, $0.CreateForumResp>(
          '/xmux.forum.v4.Forum/CreateForum',
          ($0.CreateForumReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateForumResp.fromBuffer(value));
  static final _$removeForum = $grpc.ClientMethod<$0.RemoveForumReq, $1.Empty>(
      '/xmux.forum.v4.Forum/RemoveForum',
      ($0.RemoveForumReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getForums =
      $grpc.ClientMethod<$0.GetForumsReq, $0.GetForumsResp>(
          '/xmux.forum.v4.Forum/GetForums',
          ($0.GetForumsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetForumsResp.fromBuffer(value));
  static final _$createThread =
      $grpc.ClientMethod<$2.CreateThreadReq, $2.CreateThreadResp>(
          '/xmux.forum.v4.Forum/CreateThread',
          ($2.CreateThreadReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.CreateThreadResp.fromBuffer(value));
  static final _$removeThread =
      $grpc.ClientMethod<$2.RemoveThreadReq, $1.Empty>(
          '/xmux.forum.v4.Forum/RemoveThread',
          ($2.RemoveThreadReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$updateThread =
      $grpc.ClientMethod<$2.UpdateThreadReq, $1.Empty>(
          '/xmux.forum.v4.Forum/UpdateThread',
          ($2.UpdateThreadReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getThreads =
      $grpc.ClientMethod<$2.GetThreadsReq, $2.GetThreadsResp>(
          '/xmux.forum.v4.Forum/GetThreads',
          ($2.GetThreadsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.GetThreadsResp.fromBuffer(value));
  static final _$likeThread = $grpc.ClientMethod<$2.LikeThreadReq, $1.Empty>(
      '/xmux.forum.v4.Forum/LikeThread',
      ($2.LikeThreadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$pinThread = $grpc.ClientMethod<$2.PinThreadReq, $1.Empty>(
      '/xmux.forum.v4.Forum/PinThread',
      ($2.PinThreadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$digestThread =
      $grpc.ClientMethod<$2.DigestThreadReq, $1.Empty>(
          '/xmux.forum.v4.Forum/DigestThread',
          ($2.DigestThreadReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$createPost =
      $grpc.ClientMethod<$3.CreatePostReq, $3.CreatePostResp>(
          '/xmux.forum.v4.Forum/CreatePost',
          ($3.CreatePostReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.CreatePostResp.fromBuffer(value));
  static final _$removePost = $grpc.ClientMethod<$3.RemovePostReq, $1.Empty>(
      '/xmux.forum.v4.Forum/RemovePost',
      ($3.RemovePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getPosts = $grpc.ClientMethod<$3.GetPostsReq, $3.GetPostsResp>(
      '/xmux.forum.v4.Forum/GetPosts',
      ($3.GetPostsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetPostsResp.fromBuffer(value));
  static final _$getPostsByUid =
      $grpc.ClientMethod<$3.GetPostsByUidReq, $3.GetPostsResp>(
          '/xmux.forum.v4.Forum/GetPostsByUid',
          ($3.GetPostsByUidReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.GetPostsResp.fromBuffer(value));
  static final _$getPostsByParent =
      $grpc.ClientMethod<$3.GetPostsByParentReq, $3.GetPostsResp>(
          '/xmux.forum.v4.Forum/GetPostsByParent',
          ($3.GetPostsByParentReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.GetPostsResp.fromBuffer(value));
  static final _$likePost = $grpc.ClientMethod<$3.LikePostReq, $1.Empty>(
      '/xmux.forum.v4.Forum/LikePost',
      ($3.LikePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$pinPost = $grpc.ClientMethod<$3.PinPostReq, $1.Empty>(
      '/xmux.forum.v4.Forum/PinPost',
      ($3.PinPostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$saveThread = $grpc.ClientMethod<$4.SaveThreadReq, $1.Empty>(
      '/xmux.forum.v4.Forum/SaveThread',
      ($4.SaveThreadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$savePost = $grpc.ClientMethod<$4.SavePostReq, $1.Empty>(
      '/xmux.forum.v4.Forum/SavePost',
      ($4.SavePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$unsaveThread =
      $grpc.ClientMethod<$4.UnsaveThreadReq, $1.Empty>(
          '/xmux.forum.v4.Forum/UnsaveThread',
          ($4.UnsaveThreadReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$unsavePost = $grpc.ClientMethod<$4.UnsavePostReq, $1.Empty>(
      '/xmux.forum.v4.Forum/UnsavePost',
      ($4.UnsavePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getSavedThreads =
      $grpc.ClientMethod<$4.GetSavedThreadsReq, $2.GetThreadsResp>(
          '/xmux.forum.v4.Forum/GetSavedThreads',
          ($4.GetSavedThreadsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.GetThreadsResp.fromBuffer(value));
  static final _$getSavedPosts =
      $grpc.ClientMethod<$4.GetSavedPostsReq, $3.GetPostsResp>(
          '/xmux.forum.v4.Forum/GetSavedPosts',
          ($4.GetSavedPostsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.GetPostsResp.fromBuffer(value));

  ForumClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateForumResp> createForum(
      $0.CreateForumReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createForum, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removeForum($0.RemoveForumReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeForum, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetForumsResp> getForums($0.GetForumsReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getForums, request, options: options);
  }

  $grpc.ResponseFuture<$2.CreateThreadResp> createThread(
      $2.CreateThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createThread, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removeThread($2.RemoveThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeThread, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateThread($2.UpdateThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateThread, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetThreadsResp> getThreads($2.GetThreadsReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getThreads, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> likeThread($2.LikeThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likeThread, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> pinThread($2.PinThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pinThread, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> digestThread($2.DigestThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$digestThread, request, options: options);
  }

  $grpc.ResponseFuture<$3.CreatePostResp> createPost($3.CreatePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removePost($3.RemovePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removePost, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetPostsResp> getPosts($3.GetPostsReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPosts, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetPostsResp> getPostsByUid(
      $3.GetPostsByUidReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostsByUid, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetPostsResp> getPostsByParent(
      $3.GetPostsByParentReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostsByParent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> likePost($3.LikePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$likePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> pinPost($3.PinPostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pinPost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> saveThread($4.SaveThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$saveThread, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> savePost($4.SavePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$savePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> unsaveThread($4.UnsaveThreadReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unsaveThread, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> unsavePost($4.UnsavePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unsavePost, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetThreadsResp> getSavedThreads(
      $4.GetSavedThreadsReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSavedThreads, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetPostsResp> getSavedPosts(
      $4.GetSavedPostsReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSavedPosts, request, options: options);
  }
}

abstract class ForumServiceBase extends $grpc.Service {
  $core.String get $name => 'xmux.forum.v4.Forum';

  ForumServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateForumReq, $0.CreateForumResp>(
        'CreateForum',
        createForum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateForumReq.fromBuffer(value),
        ($0.CreateForumResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveForumReq, $1.Empty>(
        'RemoveForum',
        removeForum_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveForumReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetForumsReq, $0.GetForumsResp>(
        'GetForums',
        getForums_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetForumsReq.fromBuffer(value),
        ($0.GetForumsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreateThreadReq, $2.CreateThreadResp>(
        'CreateThread',
        createThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateThreadReq.fromBuffer(value),
        ($2.CreateThreadResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.RemoveThreadReq, $1.Empty>(
        'RemoveThread',
        removeThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.RemoveThreadReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdateThreadReq, $1.Empty>(
        'UpdateThread',
        updateThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdateThreadReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetThreadsReq, $2.GetThreadsResp>(
        'GetThreads',
        getThreads_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetThreadsReq.fromBuffer(value),
        ($2.GetThreadsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.LikeThreadReq, $1.Empty>(
        'LikeThread',
        likeThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.LikeThreadReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.PinThreadReq, $1.Empty>(
        'PinThread',
        pinThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.PinThreadReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.DigestThreadReq, $1.Empty>(
        'DigestThread',
        digestThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.DigestThreadReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreatePostReq, $3.CreatePostResp>(
        'CreatePost',
        createPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreatePostReq.fromBuffer(value),
        ($3.CreatePostResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.RemovePostReq, $1.Empty>(
        'RemovePost',
        removePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.RemovePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$3.LikePostReq, $1.Empty>(
        'LikePost',
        likePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.LikePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.PinPostReq, $1.Empty>(
        'PinPost',
        pinPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.PinPostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SaveThreadReq, $1.Empty>(
        'SaveThread',
        saveThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.SaveThreadReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.SavePostReq, $1.Empty>(
        'SavePost',
        savePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.SavePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UnsaveThreadReq, $1.Empty>(
        'UnsaveThread',
        unsaveThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UnsaveThreadReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UnsavePostReq, $1.Empty>(
        'UnsavePost',
        unsavePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UnsavePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetSavedThreadsReq, $2.GetThreadsResp>(
        'GetSavedThreads',
        getSavedThreads_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $4.GetSavedThreadsReq.fromBuffer(value),
        ($2.GetThreadsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetSavedPostsReq, $3.GetPostsResp>(
        'GetSavedPosts',
        getSavedPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetSavedPostsReq.fromBuffer(value),
        ($3.GetPostsResp value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateForumResp> createForum_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CreateForumReq> request) async {
    return createForum(call, await request);
  }

  $async.Future<$1.Empty> removeForum_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RemoveForumReq> request) async {
    return removeForum(call, await request);
  }

  $async.Future<$0.GetForumsResp> getForums_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetForumsReq> request) async {
    return getForums(call, await request);
  }

  $async.Future<$2.CreateThreadResp> createThread_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CreateThreadReq> request) async {
    return createThread(call, await request);
  }

  $async.Future<$1.Empty> removeThread_Pre(
      $grpc.ServiceCall call, $async.Future<$2.RemoveThreadReq> request) async {
    return removeThread(call, await request);
  }

  $async.Future<$1.Empty> updateThread_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdateThreadReq> request) async {
    return updateThread(call, await request);
  }

  $async.Future<$2.GetThreadsResp> getThreads_Pre(
      $grpc.ServiceCall call, $async.Future<$2.GetThreadsReq> request) async {
    return getThreads(call, await request);
  }

  $async.Future<$1.Empty> likeThread_Pre(
      $grpc.ServiceCall call, $async.Future<$2.LikeThreadReq> request) async {
    return likeThread(call, await request);
  }

  $async.Future<$1.Empty> pinThread_Pre(
      $grpc.ServiceCall call, $async.Future<$2.PinThreadReq> request) async {
    return pinThread(call, await request);
  }

  $async.Future<$1.Empty> digestThread_Pre(
      $grpc.ServiceCall call, $async.Future<$2.DigestThreadReq> request) async {
    return digestThread(call, await request);
  }

  $async.Future<$3.CreatePostResp> createPost_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CreatePostReq> request) async {
    return createPost(call, await request);
  }

  $async.Future<$1.Empty> removePost_Pre(
      $grpc.ServiceCall call, $async.Future<$3.RemovePostReq> request) async {
    return removePost(call, await request);
  }

  $async.Future<$3.GetPostsResp> getPosts_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GetPostsReq> request) async {
    return getPosts(call, await request);
  }

  $async.Future<$3.GetPostsResp> getPostsByUid_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetPostsByUidReq> request) async {
    return getPostsByUid(call, await request);
  }

  $async.Future<$3.GetPostsResp> getPostsByParent_Pre($grpc.ServiceCall call,
      $async.Future<$3.GetPostsByParentReq> request) async {
    return getPostsByParent(call, await request);
  }

  $async.Future<$1.Empty> likePost_Pre(
      $grpc.ServiceCall call, $async.Future<$3.LikePostReq> request) async {
    return likePost(call, await request);
  }

  $async.Future<$1.Empty> pinPost_Pre(
      $grpc.ServiceCall call, $async.Future<$3.PinPostReq> request) async {
    return pinPost(call, await request);
  }

  $async.Future<$1.Empty> saveThread_Pre(
      $grpc.ServiceCall call, $async.Future<$4.SaveThreadReq> request) async {
    return saveThread(call, await request);
  }

  $async.Future<$1.Empty> savePost_Pre(
      $grpc.ServiceCall call, $async.Future<$4.SavePostReq> request) async {
    return savePost(call, await request);
  }

  $async.Future<$1.Empty> unsaveThread_Pre(
      $grpc.ServiceCall call, $async.Future<$4.UnsaveThreadReq> request) async {
    return unsaveThread(call, await request);
  }

  $async.Future<$1.Empty> unsavePost_Pre(
      $grpc.ServiceCall call, $async.Future<$4.UnsavePostReq> request) async {
    return unsavePost(call, await request);
  }

  $async.Future<$2.GetThreadsResp> getSavedThreads_Pre($grpc.ServiceCall call,
      $async.Future<$4.GetSavedThreadsReq> request) async {
    return getSavedThreads(call, await request);
  }

  $async.Future<$3.GetPostsResp> getSavedPosts_Pre($grpc.ServiceCall call,
      $async.Future<$4.GetSavedPostsReq> request) async {
    return getSavedPosts(call, await request);
  }

  $async.Future<$0.CreateForumResp> createForum(
      $grpc.ServiceCall call, $0.CreateForumReq request);
  $async.Future<$1.Empty> removeForum(
      $grpc.ServiceCall call, $0.RemoveForumReq request);
  $async.Future<$0.GetForumsResp> getForums(
      $grpc.ServiceCall call, $0.GetForumsReq request);
  $async.Future<$2.CreateThreadResp> createThread(
      $grpc.ServiceCall call, $2.CreateThreadReq request);
  $async.Future<$1.Empty> removeThread(
      $grpc.ServiceCall call, $2.RemoveThreadReq request);
  $async.Future<$1.Empty> updateThread(
      $grpc.ServiceCall call, $2.UpdateThreadReq request);
  $async.Future<$2.GetThreadsResp> getThreads(
      $grpc.ServiceCall call, $2.GetThreadsReq request);
  $async.Future<$1.Empty> likeThread(
      $grpc.ServiceCall call, $2.LikeThreadReq request);
  $async.Future<$1.Empty> pinThread(
      $grpc.ServiceCall call, $2.PinThreadReq request);
  $async.Future<$1.Empty> digestThread(
      $grpc.ServiceCall call, $2.DigestThreadReq request);
  $async.Future<$3.CreatePostResp> createPost(
      $grpc.ServiceCall call, $3.CreatePostReq request);
  $async.Future<$1.Empty> removePost(
      $grpc.ServiceCall call, $3.RemovePostReq request);
  $async.Future<$3.GetPostsResp> getPosts(
      $grpc.ServiceCall call, $3.GetPostsReq request);
  $async.Future<$3.GetPostsResp> getPostsByUid(
      $grpc.ServiceCall call, $3.GetPostsByUidReq request);
  $async.Future<$3.GetPostsResp> getPostsByParent(
      $grpc.ServiceCall call, $3.GetPostsByParentReq request);
  $async.Future<$1.Empty> likePost(
      $grpc.ServiceCall call, $3.LikePostReq request);
  $async.Future<$1.Empty> pinPost(
      $grpc.ServiceCall call, $3.PinPostReq request);
  $async.Future<$1.Empty> saveThread(
      $grpc.ServiceCall call, $4.SaveThreadReq request);
  $async.Future<$1.Empty> savePost(
      $grpc.ServiceCall call, $4.SavePostReq request);
  $async.Future<$1.Empty> unsaveThread(
      $grpc.ServiceCall call, $4.UnsaveThreadReq request);
  $async.Future<$1.Empty> unsavePost(
      $grpc.ServiceCall call, $4.UnsavePostReq request);
  $async.Future<$2.GetThreadsResp> getSavedThreads(
      $grpc.ServiceCall call, $4.GetSavedThreadsReq request);
  $async.Future<$3.GetPostsResp> getSavedPosts(
      $grpc.ServiceCall call, $4.GetSavedPostsReq request);
}
