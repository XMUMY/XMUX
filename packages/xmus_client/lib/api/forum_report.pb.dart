// This is a generated file - do not edit.
//
// Generated from forum_report.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

enum ReportPostOrThreadReq_Target { postId, threadId, notSet }

class ReportPostOrThreadReq extends $pb.GeneratedMessage {
  factory ReportPostOrThreadReq({
    $core.int? postId,
    $core.int? threadId,
    $core.int? typeId,
    $core.String? description,
  }) {
    final result = create();
    if (postId != null) result.postId = postId;
    if (threadId != null) result.threadId = threadId;
    if (typeId != null) result.typeId = typeId;
    if (description != null) result.description = description;
    return result;
  }

  ReportPostOrThreadReq._();

  factory ReportPostOrThreadReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportPostOrThreadReq.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static const $core.Map<$core.int, ReportPostOrThreadReq_Target>
      _ReportPostOrThreadReq_TargetByTag = {
    1: ReportPostOrThreadReq_Target.postId,
    2: ReportPostOrThreadReq_Target.threadId,
    0: ReportPostOrThreadReq_Target.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportPostOrThreadReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aI(1, _omitFieldNames ? '' : 'postId', protoName: 'postId')
    ..aI(2, _omitFieldNames ? '' : 'threadId', protoName: 'threadId')
    ..aI(3, _omitFieldNames ? '' : 'typeId', protoName: 'typeId')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportPostOrThreadReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportPostOrThreadReq copyWith(
          void Function(ReportPostOrThreadReq) updates) =>
      super.copyWith((message) => updates(message as ReportPostOrThreadReq))
          as ReportPostOrThreadReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportPostOrThreadReq create() => ReportPostOrThreadReq._();
  @$core.override
  ReportPostOrThreadReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportPostOrThreadReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportPostOrThreadReq>(create);
  static ReportPostOrThreadReq? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  ReportPostOrThreadReq_Target whichTarget() =>
      _ReportPostOrThreadReq_TargetByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearTarget() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.int get postId => $_getIZ(0);
  @$pb.TagNumber(1)
  set postId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPostId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPostId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get threadId => $_getIZ(1);
  @$pb.TagNumber(2)
  set threadId($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThreadId() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreadId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get typeId => $_getIZ(2);
  @$pb.TagNumber(3)
  set typeId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTypeId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTypeId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);
}

class ReportPostOrThreadResp extends $pb.GeneratedMessage {
  factory ReportPostOrThreadResp({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  ReportPostOrThreadResp._();

  factory ReportPostOrThreadResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportPostOrThreadResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportPostOrThreadResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportPostOrThreadResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportPostOrThreadResp copyWith(
          void Function(ReportPostOrThreadResp) updates) =>
      super.copyWith((message) => updates(message as ReportPostOrThreadResp))
          as ReportPostOrThreadResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportPostOrThreadResp create() => ReportPostOrThreadResp._();
  @$core.override
  ReportPostOrThreadResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportPostOrThreadResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportPostOrThreadResp>(create);
  static ReportPostOrThreadResp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class GetReportTypesResp extends $pb.GeneratedMessage {
  factory GetReportTypesResp({
    $core.Iterable<ReportType>? types,
  }) {
    final result = create();
    if (types != null) result.types.addAll(types);
    return result;
  }

  GetReportTypesResp._();

  factory GetReportTypesResp.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetReportTypesResp.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetReportTypesResp',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..pPM<ReportType>(1, _omitFieldNames ? '' : 'types',
        subBuilder: ReportType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReportTypesResp clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReportTypesResp copyWith(void Function(GetReportTypesResp) updates) =>
      super.copyWith((message) => updates(message as GetReportTypesResp))
          as GetReportTypesResp;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReportTypesResp create() => GetReportTypesResp._();
  @$core.override
  GetReportTypesResp createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetReportTypesResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetReportTypesResp>(create);
  static GetReportTypesResp? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ReportType> get types => $_getList(0);
}

class ReportType extends $pb.GeneratedMessage {
  factory ReportType({
    $core.int? id,
    $core.String? name,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    return result;
  }

  ReportType._();

  factory ReportType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportType.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportType',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'xmux.forum.v4'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportType copyWith(void Function(ReportType) updates) =>
      super.copyWith((message) => updates(message as ReportType)) as ReportType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportType create() => ReportType._();
  @$core.override
  ReportType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportType getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportType>(create);
  static ReportType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
