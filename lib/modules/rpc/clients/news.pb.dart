///
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

enum Slider_Action { launchUrl, webviewUrl, notSet }

class Slider extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Slider_Action> _Slider_ActionByTag = {
    5: Slider_Action.launchUrl,
    6: Slider_Action.webviewUrl,
    0: Slider_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Slider',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..oo(0, [5, 6])
    ..a<$fixnum.Int64>(1, 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'title')
    ..aOS(3, 'imageUrl', protoName: 'imageUrl')
    ..a<$core.int>(4, 'level', $pb.PbFieldType.O3)
    ..aOS(5, 'launchUrl', protoName: 'launchUrl')
    ..aOS(6, 'webviewUrl', protoName: 'webviewUrl')
    ..hasRequiredFields = false;

  Slider._() : super();

  factory Slider() => create();

  factory Slider.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Slider.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Slider clone() => Slider()..mergeFromMessage(this);

  Slider copyWith(void Function(Slider) updates) =>
      super.copyWith((message) => updates(message as Slider));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Slider create() => Slider._();

  Slider createEmptyInstance() => create();

  static $pb.PbList<Slider> createRepeated() => $pb.PbList<Slider>();

  @$core.pragma('dart2js:noInline')
  static Slider getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Slider>(create);
  static Slider _defaultInstance;

  Slider_Action whichAction() => _Slider_ActionByTag[$_whichOneof(0)];

  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);

  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);

  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);

  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);

  @$pb.TagNumber(3)
  set imageUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);

  @$pb.TagNumber(3)
  void clearImageUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);

  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);

  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get launchUrl => $_getSZ(4);

  @$pb.TagNumber(5)
  set launchUrl($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLaunchUrl() => $_has(4);

  @$pb.TagNumber(5)
  void clearLaunchUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get webviewUrl => $_getSZ(5);

  @$pb.TagNumber(6)
  set webviewUrl($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasWebviewUrl() => $_has(5);

  @$pb.TagNumber(6)
  void clearWebviewUrl() => clearField(6);
}

class DeleteSliderReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteSliderReq',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  DeleteSliderReq._() : super();

  factory DeleteSliderReq() => create();

  factory DeleteSliderReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory DeleteSliderReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  DeleteSliderReq clone() => DeleteSliderReq()..mergeFromMessage(this);

  DeleteSliderReq copyWith(void Function(DeleteSliderReq) updates) =>
      super.copyWith((message) => updates(message as DeleteSliderReq));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSliderReq create() => DeleteSliderReq._();

  DeleteSliderReq createEmptyInstance() => create();

  static $pb.PbList<DeleteSliderReq> createRepeated() =>
      $pb.PbList<DeleteSliderReq>();

  @$core.pragma('dart2js:noInline')
  static DeleteSliderReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSliderReq>(create);
  static DeleteSliderReq _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);

  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class SlidersResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SlidersResp',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..pc<Slider>(1, 'sliders', $pb.PbFieldType.PM, subBuilder: Slider.create)
    ..hasRequiredFields = false;

  SlidersResp._() : super();

  factory SlidersResp() => create();

  factory SlidersResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory SlidersResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  SlidersResp clone() => SlidersResp()..mergeFromMessage(this);

  SlidersResp copyWith(void Function(SlidersResp) updates) =>
      super.copyWith((message) => updates(message as SlidersResp));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SlidersResp create() => SlidersResp._();

  SlidersResp createEmptyInstance() => create();

  static $pb.PbList<SlidersResp> createRepeated() => $pb.PbList<SlidersResp>();

  @$core.pragma('dart2js:noInline')
  static SlidersResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SlidersResp>(create);
  static SlidersResp _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Slider> get sliders => $_getList(0);
}

enum Announcement_Content { text, html, markdown, notSet }

class Announcement extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Announcement_Content>
      _Announcement_ContentByTag = {
    6: Announcement_Content.text,
    7: Announcement_Content.html,
    8: Announcement_Content.markdown,
    0: Announcement_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Announcement',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..oo(0, [6, 7, 8])
    ..a<$fixnum.Int64>(1, 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, 'title')
    ..aOS(3, 'from')
    ..a<$core.int>(4, 'level', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(5, 'releaseTime',
        protoName: 'releaseTime', subBuilder: $2.Timestamp.create)
    ..aOS(6, 'text')
    ..aOS(7, 'html')
    ..aOS(8, 'markdown')
    ..hasRequiredFields = false;

  Announcement._() : super();

  factory Announcement() => create();

  factory Announcement.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Announcement.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Announcement clone() => Announcement()..mergeFromMessage(this);

  Announcement copyWith(void Function(Announcement) updates) =>
      super.copyWith((message) => updates(message as Announcement));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Announcement create() => Announcement._();

  Announcement createEmptyInstance() => create();

  static $pb.PbList<Announcement> createRepeated() =>
      $pb.PbList<Announcement>();

  @$core.pragma('dart2js:noInline')
  static Announcement getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Announcement>(create);
  static Announcement _defaultInstance;

  Announcement_Content whichContent() =>
      _Announcement_ContentByTag[$_whichOneof(0)];

  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);

  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);

  @$pb.TagNumber(2)
  set title($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);

  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get from => $_getSZ(2);

  @$pb.TagNumber(3)
  set from($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);

  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get level => $_getIZ(3);

  @$pb.TagNumber(4)
  set level($core.int v) {
    $_setSignedInt32(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasLevel() => $_has(3);

  @$pb.TagNumber(4)
  void clearLevel() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get releaseTime => $_getN(4);

  @$pb.TagNumber(5)
  set releaseTime($2.Timestamp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasReleaseTime() => $_has(4);

  @$pb.TagNumber(5)
  void clearReleaseTime() => clearField(5);

  @$pb.TagNumber(5)
  $2.Timestamp ensureReleaseTime() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get text => $_getSZ(5);

  @$pb.TagNumber(6)
  set text($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasText() => $_has(5);

  @$pb.TagNumber(6)
  void clearText() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get html => $_getSZ(6);

  @$pb.TagNumber(7)
  set html($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasHtml() => $_has(6);

  @$pb.TagNumber(7)
  void clearHtml() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get markdown => $_getSZ(7);

  @$pb.TagNumber(8)
  set markdown($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasMarkdown() => $_has(7);

  @$pb.TagNumber(8)
  void clearMarkdown() => clearField(8);
}

class DeleteAnnouncementReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteAnnouncementReq',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'id', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  DeleteAnnouncementReq._() : super();

  factory DeleteAnnouncementReq() => create();

  factory DeleteAnnouncementReq.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory DeleteAnnouncementReq.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  DeleteAnnouncementReq clone() =>
      DeleteAnnouncementReq()..mergeFromMessage(this);

  DeleteAnnouncementReq copyWith(
          void Function(DeleteAnnouncementReq) updates) =>
      super.copyWith((message) => updates(message as DeleteAnnouncementReq));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAnnouncementReq create() => DeleteAnnouncementReq._();

  DeleteAnnouncementReq createEmptyInstance() => create();

  static $pb.PbList<DeleteAnnouncementReq> createRepeated() =>
      $pb.PbList<DeleteAnnouncementReq>();

  @$core.pragma('dart2js:noInline')
  static DeleteAnnouncementReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteAnnouncementReq>(create);
  static DeleteAnnouncementReq _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);

  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class AnnouncementsResp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AnnouncementsResp',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..pc<Announcement>(1, 'announcements', $pb.PbFieldType.PM,
        subBuilder: Announcement.create)
    ..hasRequiredFields = false;

  AnnouncementsResp._() : super();

  factory AnnouncementsResp() => create();

  factory AnnouncementsResp.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory AnnouncementsResp.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  AnnouncementsResp clone() => AnnouncementsResp()..mergeFromMessage(this);

  AnnouncementsResp copyWith(void Function(AnnouncementsResp) updates) =>
      super.copyWith((message) => updates(message as AnnouncementsResp));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnnouncementsResp create() => AnnouncementsResp._();

  AnnouncementsResp createEmptyInstance() => create();

  static $pb.PbList<AnnouncementsResp> createRepeated() =>
      $pb.PbList<AnnouncementsResp>();

  @$core.pragma('dart2js:noInline')
  static AnnouncementsResp getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnnouncementsResp>(create);
  static AnnouncementsResp _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Announcement> get announcements => $_getList(0);
}
