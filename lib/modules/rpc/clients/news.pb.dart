///
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

enum Slider_Translation_Action { launchUrl, webviewUrl, notSet }

class Slider_Translation extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Slider_Translation_Action>
      _Slider_Translation_ActionByTag = {
    3: Slider_Translation_Action.launchUrl,
    4: Slider_Translation_Action.webviewUrl,
    0: Slider_Translation_Action.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Slider.Translation',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, 'title')
    ..aOS(2, 'imageUrl', protoName: 'imageUrl')
    ..aOS(3, 'launchUrl', protoName: 'launchUrl')
    ..aOS(4, 'webviewUrl', protoName: 'webviewUrl')
    ..hasRequiredFields = false;

  Slider_Translation._() : super();

  factory Slider_Translation() => create();

  factory Slider_Translation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Slider_Translation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Slider_Translation clone() => Slider_Translation()..mergeFromMessage(this);

  Slider_Translation copyWith(void Function(Slider_Translation) updates) =>
      super.copyWith((message) => updates(message as Slider_Translation));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Slider_Translation create() => Slider_Translation._();

  Slider_Translation createEmptyInstance() => create();

  static $pb.PbList<Slider_Translation> createRepeated() =>
      $pb.PbList<Slider_Translation>();

  @$core.pragma('dart2js:noInline')
  static Slider_Translation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Slider_Translation>(create);
  static Slider_Translation _defaultInstance;

  Slider_Translation_Action whichAction() =>
      _Slider_Translation_ActionByTag[$_whichOneof(0)];

  void clearAction() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);

  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);

  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get imageUrl => $_getSZ(1);

  @$pb.TagNumber(2)
  set imageUrl($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasImageUrl() => $_has(1);

  @$pb.TagNumber(2)
  void clearImageUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get launchUrl => $_getSZ(2);

  @$pb.TagNumber(3)
  set launchUrl($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLaunchUrl() => $_has(2);

  @$pb.TagNumber(3)
  void clearLaunchUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get webviewUrl => $_getSZ(3);

  @$pb.TagNumber(4)
  set webviewUrl($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasWebviewUrl() => $_has(3);

  @$pb.TagNumber(4)
  void clearWebviewUrl() => clearField(4);
}

class Slider extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Slider',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'id')
    ..a<$core.int>(2, 'level', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(3, 'releaseDate',
        protoName: 'releaseDate', subBuilder: $2.Timestamp.create)
    ..m<$core.String, Slider_Translation>(4, 'translations',
        entryClassName: 'Slider.TranslationsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Slider_Translation.create,
        packageName: const $pb.PackageName('xmux.core.news.v4'))
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

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);

  @$pb.TagNumber(2)
  set level($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);

  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get releaseDate => $_getN(2);

  @$pb.TagNumber(3)
  set releaseDate($2.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReleaseDate() => $_has(2);

  @$pb.TagNumber(3)
  void clearReleaseDate() => clearField(3);

  @$pb.TagNumber(3)
  $2.Timestamp ensureReleaseDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.Map<$core.String, Slider_Translation> get translations => $_getMap(3);
}

class DeleteSliderReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteSliderReq',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'id')
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
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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

enum Announcement_Translation_Content { text, notSet }

class Announcement_Translation extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Announcement_Translation_Content>
      _Announcement_Translation_ContentByTag = {
    3: Announcement_Translation_Content.text,
    0: Announcement_Translation_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Announcement.Translation',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..oo(0, [3])
    ..aOS(1, 'title')
    ..aOS(2, 'from')
    ..aOS(3, 'text')
    ..hasRequiredFields = false;

  Announcement_Translation._() : super();

  factory Announcement_Translation() => create();

  factory Announcement_Translation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Announcement_Translation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  Announcement_Translation clone() =>
      Announcement_Translation()..mergeFromMessage(this);

  Announcement_Translation copyWith(
          void Function(Announcement_Translation) updates) =>
      super.copyWith((message) => updates(message as Announcement_Translation));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Announcement_Translation create() => Announcement_Translation._();

  Announcement_Translation createEmptyInstance() => create();

  static $pb.PbList<Announcement_Translation> createRepeated() =>
      $pb.PbList<Announcement_Translation>();

  @$core.pragma('dart2js:noInline')
  static Announcement_Translation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Announcement_Translation>(create);
  static Announcement_Translation _defaultInstance;

  Announcement_Translation_Content whichContent() =>
      _Announcement_Translation_ContentByTag[$_whichOneof(0)];

  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);

  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);

  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get from => $_getSZ(1);

  @$pb.TagNumber(2)
  set from($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);

  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get text => $_getSZ(2);

  @$pb.TagNumber(3)
  set text($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);

  @$pb.TagNumber(3)
  void clearText() => clearField(3);
}

class Announcement extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Announcement',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'id')
    ..a<$core.int>(2, 'level', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(3, 'releaseDate',
        protoName: 'releaseDate', subBuilder: $2.Timestamp.create)
    ..m<$core.String, Announcement_Translation>(4, 'translations',
        entryClassName: 'Announcement.TranslationsEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OM,
        valueCreator: Announcement_Translation.create,
        packageName: const $pb.PackageName('xmux.core.news.v4'))
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

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);

  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get level => $_getIZ(1);

  @$pb.TagNumber(2)
  set level($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);

  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $2.Timestamp get releaseDate => $_getN(2);

  @$pb.TagNumber(3)
  set releaseDate($2.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasReleaseDate() => $_has(2);

  @$pb.TagNumber(3)
  void clearReleaseDate() => clearField(3);

  @$pb.TagNumber(3)
  $2.Timestamp ensureReleaseDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.Map<$core.String, Announcement_Translation> get translations =>
      $_getMap(3);
}

class DeleteAnnouncementReq extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DeleteAnnouncementReq',
      package: const $pb.PackageName('xmux.core.news.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'id')
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
  $core.String get id => $_getSZ(0);

  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
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
