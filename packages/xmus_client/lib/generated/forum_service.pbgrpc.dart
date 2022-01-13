///
//  Generated code. Do not modify.
//  source: forum_service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'group.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
import 'post.pb.dart' as $2;
import 'reply.pb.dart' as $3;
export 'forum_service.pb.dart';

class ForumClient extends $grpc.Client {
  static final _$createGroup =
      $grpc.ClientMethod<$0.CreateGroupReq, $0.CreateGroupResp>(
          '/xdea.xmux.forum.Forum/CreateGroup',
          ($0.CreateGroupReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateGroupResp.fromBuffer(value));
  static final _$removeGroup = $grpc.ClientMethod<$0.GroupIdMsg, $1.Empty>(
      '/xdea.xmux.forum.Forum/RemoveGroup',
      ($0.GroupIdMsg value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$joinGroup = $grpc.ClientMethod<$0.MembershipMsg, $1.Empty>(
      '/xdea.xmux.forum.Forum/JoinGroup',
      ($0.MembershipMsg value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$leaveGroup = $grpc.ClientMethod<$0.MembershipMsg, $1.Empty>(
      '/xdea.xmux.forum.Forum/LeaveGroup',
      ($0.MembershipMsg value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getGroups =
      $grpc.ClientMethod<$0.GetGroupsReq, $0.GetGroupsResp>(
          '/xdea.xmux.forum.Forum/GetGroups',
          ($0.GetGroupsReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.GetGroupsResp.fromBuffer(value));
  static final _$getUserGroups =
      $grpc.ClientMethod<$1.Empty, $0.GetUserGroupsResp>(
          '/xdea.xmux.forum.Forum/GetUserGroups',
          ($1.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetUserGroupsResp.fromBuffer(value));
  static final _$createPost =
      $grpc.ClientMethod<$2.CreatePostReq, $2.CreatePostResp>(
          '/xdea.xmux.forum.Forum/CreatePost',
          ($2.CreatePostReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.CreatePostResp.fromBuffer(value));
  static final _$removePost = $grpc.ClientMethod<$2.UpdatePostReq, $1.Empty>(
      '/xdea.xmux.forum.Forum/RemovePost',
      ($2.UpdatePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getPost = $grpc.ClientMethod<$2.GetPostReq, $2.GetPostResp>(
      '/xdea.xmux.forum.Forum/GetPost',
      ($2.GetPostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.GetPostResp.fromBuffer(value));
  static final _$upvotePost = $grpc.ClientMethod<$2.UpdatePostReq, $1.Empty>(
      '/xdea.xmux.forum.Forum/UpvotePost',
      ($2.UpdatePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$downvotePost = $grpc.ClientMethod<$2.UpdatePostReq, $1.Empty>(
      '/xdea.xmux.forum.Forum/DownvotePost',
      ($2.UpdatePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$toggleBestPost =
      $grpc.ClientMethod<$2.UpdatePostReq, $1.Empty>(
          '/xdea.xmux.forum.Forum/toggleBestPost',
          ($2.UpdatePostReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$toggleTopPost = $grpc.ClientMethod<$2.UpdatePostReq, $1.Empty>(
      '/xdea.xmux.forum.Forum/toggleTopPost',
      ($2.UpdatePostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$createReply =
      $grpc.ClientMethod<$3.CreateReplyReq, $3.CreateReplyResp>(
          '/xdea.xmux.forum.Forum/CreateReply',
          ($3.CreateReplyReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.CreateReplyResp.fromBuffer(value));
  static final _$getReply = $grpc.ClientMethod<$3.GetReplyReq, $3.GetReplyResp>(
      '/xdea.xmux.forum.Forum/GetReply',
      ($3.GetReplyReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.GetReplyResp.fromBuffer(value));
  static final _$getReplyById =
      $grpc.ClientMethod<$3.GetReplyByIdReq, $3.Reply>(
          '/xdea.xmux.forum.Forum/GetReplyById',
          ($3.GetReplyByIdReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.Reply.fromBuffer(value));
  static final _$removeReply = $grpc.ClientMethod<$3.UpdateReplyReq, $1.Empty>(
      '/xdea.xmux.forum.Forum/RemoveReply',
      ($3.UpdateReplyReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$upvoteReply = $grpc.ClientMethod<$3.UpdateReplyReq, $1.Empty>(
      '/xdea.xmux.forum.Forum/UpvoteReply',
      ($3.UpdateReplyReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$downvoteReply =
      $grpc.ClientMethod<$3.UpdateReplyReq, $1.Empty>(
          '/xdea.xmux.forum.Forum/DownvoteReply',
          ($3.UpdateReplyReq value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  ForumClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateGroupResp> createGroup(
      $0.CreateGroupReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createGroup, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removeGroup($0.GroupIdMsg request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeGroup, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> joinGroup($0.MembershipMsg request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinGroup, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> leaveGroup($0.MembershipMsg request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaveGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetGroupsResp> getGroups($0.GetGroupsReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getGroups, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserGroupsResp> getUserGroups($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserGroups, request, options: options);
  }

  $grpc.ResponseFuture<$2.CreatePostResp> createPost($2.CreatePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removePost($2.UpdatePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removePost, request, options: options);
  }

  $grpc.ResponseFuture<$2.GetPostResp> getPost($2.GetPostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> upvotePost($2.UpdatePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upvotePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> downvotePost($2.UpdatePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$downvotePost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> toggleBestPost($2.UpdatePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$toggleBestPost, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> toggleTopPost($2.UpdatePostReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$toggleTopPost, request, options: options);
  }

  $grpc.ResponseFuture<$3.CreateReplyResp> createReply(
      $3.CreateReplyReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createReply, request, options: options);
  }

  $grpc.ResponseFuture<$3.GetReplyResp> getReply($3.GetReplyReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getReply, request, options: options);
  }

  $grpc.ResponseFuture<$3.Reply> getReplyById($3.GetReplyByIdReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getReplyById, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removeReply($3.UpdateReplyReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeReply, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> upvoteReply($3.UpdateReplyReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$upvoteReply, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> downvoteReply($3.UpdateReplyReq request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$downvoteReply, request, options: options);
  }
}

abstract class ForumServiceBase extends $grpc.Service {
  $core.String get $name => 'xdea.xmux.forum.Forum';

  ForumServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateGroupReq, $0.CreateGroupResp>(
        'CreateGroup',
        createGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateGroupReq.fromBuffer(value),
        ($0.CreateGroupResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GroupIdMsg, $1.Empty>(
        'RemoveGroup',
        removeGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GroupIdMsg.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MembershipMsg, $1.Empty>(
        'JoinGroup',
        joinGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MembershipMsg.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MembershipMsg, $1.Empty>(
        'LeaveGroup',
        leaveGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MembershipMsg.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetGroupsReq, $0.GetGroupsResp>(
        'GetGroups',
        getGroups_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetGroupsReq.fromBuffer(value),
        ($0.GetGroupsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.GetUserGroupsResp>(
        'GetUserGroups',
        getUserGroups_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.GetUserGroupsResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreatePostReq, $2.CreatePostResp>(
        'CreatePost',
        createPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreatePostReq.fromBuffer(value),
        ($2.CreatePostResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdatePostReq, $1.Empty>(
        'RemovePost',
        removePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdatePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetPostReq, $2.GetPostResp>(
        'GetPost',
        getPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetPostReq.fromBuffer(value),
        ($2.GetPostResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdatePostReq, $1.Empty>(
        'UpvotePost',
        upvotePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdatePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdatePostReq, $1.Empty>(
        'DownvotePost',
        downvotePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdatePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdatePostReq, $1.Empty>(
        'toggleBestPost',
        toggleBestPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdatePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.UpdatePostReq, $1.Empty>(
        'toggleTopPost',
        toggleTopPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.UpdatePostReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateReplyReq, $3.CreateReplyResp>(
        'CreateReply',
        createReply_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.CreateReplyReq.fromBuffer(value),
        ($3.CreateReplyResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetReplyReq, $3.GetReplyResp>(
        'GetReply',
        getReply_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetReplyReq.fromBuffer(value),
        ($3.GetReplyResp value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.GetReplyByIdReq, $3.Reply>(
        'GetReplyById',
        getReplyById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.GetReplyByIdReq.fromBuffer(value),
        ($3.Reply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateReplyReq, $1.Empty>(
        'RemoveReply',
        removeReply_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateReplyReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateReplyReq, $1.Empty>(
        'UpvoteReply',
        upvoteReply_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateReplyReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.UpdateReplyReq, $1.Empty>(
        'DownvoteReply',
        downvoteReply_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.UpdateReplyReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateGroupResp> createGroup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CreateGroupReq> request) async {
    return createGroup(call, await request);
  }

  $async.Future<$1.Empty> removeGroup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GroupIdMsg> request) async {
    return removeGroup(call, await request);
  }

  $async.Future<$1.Empty> joinGroup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MembershipMsg> request) async {
    return joinGroup(call, await request);
  }

  $async.Future<$1.Empty> leaveGroup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MembershipMsg> request) async {
    return leaveGroup(call, await request);
  }

  $async.Future<$0.GetGroupsResp> getGroups_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetGroupsReq> request) async {
    return getGroups(call, await request);
  }

  $async.Future<$0.GetUserGroupsResp> getUserGroups_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getUserGroups(call, await request);
  }

  $async.Future<$2.CreatePostResp> createPost_Pre(
      $grpc.ServiceCall call, $async.Future<$2.CreatePostReq> request) async {
    return createPost(call, await request);
  }

  $async.Future<$1.Empty> removePost_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdatePostReq> request) async {
    return removePost(call, await request);
  }

  $async.Future<$2.GetPostResp> getPost_Pre(
      $grpc.ServiceCall call, $async.Future<$2.GetPostReq> request) async {
    return getPost(call, await request);
  }

  $async.Future<$1.Empty> upvotePost_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdatePostReq> request) async {
    return upvotePost(call, await request);
  }

  $async.Future<$1.Empty> downvotePost_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdatePostReq> request) async {
    return downvotePost(call, await request);
  }

  $async.Future<$1.Empty> toggleBestPost_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdatePostReq> request) async {
    return toggleBestPost(call, await request);
  }

  $async.Future<$1.Empty> toggleTopPost_Pre(
      $grpc.ServiceCall call, $async.Future<$2.UpdatePostReq> request) async {
    return toggleTopPost(call, await request);
  }

  $async.Future<$3.CreateReplyResp> createReply_Pre(
      $grpc.ServiceCall call, $async.Future<$3.CreateReplyReq> request) async {
    return createReply(call, await request);
  }

  $async.Future<$3.GetReplyResp> getReply_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GetReplyReq> request) async {
    return getReply(call, await request);
  }

  $async.Future<$3.Reply> getReplyById_Pre(
      $grpc.ServiceCall call, $async.Future<$3.GetReplyByIdReq> request) async {
    return getReplyById(call, await request);
  }

  $async.Future<$1.Empty> removeReply_Pre(
      $grpc.ServiceCall call, $async.Future<$3.UpdateReplyReq> request) async {
    return removeReply(call, await request);
  }

  $async.Future<$1.Empty> upvoteReply_Pre(
      $grpc.ServiceCall call, $async.Future<$3.UpdateReplyReq> request) async {
    return upvoteReply(call, await request);
  }

  $async.Future<$1.Empty> downvoteReply_Pre(
      $grpc.ServiceCall call, $async.Future<$3.UpdateReplyReq> request) async {
    return downvoteReply(call, await request);
  }

  $async.Future<$0.CreateGroupResp> createGroup(
      $grpc.ServiceCall call, $0.CreateGroupReq request);
  $async.Future<$1.Empty> removeGroup(
      $grpc.ServiceCall call, $0.GroupIdMsg request);
  $async.Future<$1.Empty> joinGroup(
      $grpc.ServiceCall call, $0.MembershipMsg request);
  $async.Future<$1.Empty> leaveGroup(
      $grpc.ServiceCall call, $0.MembershipMsg request);
  $async.Future<$0.GetGroupsResp> getGroups(
      $grpc.ServiceCall call, $0.GetGroupsReq request);
  $async.Future<$0.GetUserGroupsResp> getUserGroups(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$2.CreatePostResp> createPost(
      $grpc.ServiceCall call, $2.CreatePostReq request);
  $async.Future<$1.Empty> removePost(
      $grpc.ServiceCall call, $2.UpdatePostReq request);
  $async.Future<$2.GetPostResp> getPost(
      $grpc.ServiceCall call, $2.GetPostReq request);
  $async.Future<$1.Empty> upvotePost(
      $grpc.ServiceCall call, $2.UpdatePostReq request);
  $async.Future<$1.Empty> downvotePost(
      $grpc.ServiceCall call, $2.UpdatePostReq request);
  $async.Future<$1.Empty> toggleBestPost(
      $grpc.ServiceCall call, $2.UpdatePostReq request);
  $async.Future<$1.Empty> toggleTopPost(
      $grpc.ServiceCall call, $2.UpdatePostReq request);
  $async.Future<$3.CreateReplyResp> createReply(
      $grpc.ServiceCall call, $3.CreateReplyReq request);
  $async.Future<$3.GetReplyResp> getReply(
      $grpc.ServiceCall call, $3.GetReplyReq request);
  $async.Future<$3.Reply> getReplyById(
      $grpc.ServiceCall call, $3.GetReplyByIdReq request);
  $async.Future<$1.Empty> removeReply(
      $grpc.ServiceCall call, $3.UpdateReplyReq request);
  $async.Future<$1.Empty> upvoteReply(
      $grpc.ServiceCall call, $3.UpdateReplyReq request);
  $async.Future<$1.Empty> downvoteReply(
      $grpc.ServiceCall call, $3.UpdateReplyReq request);
}