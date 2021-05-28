///
//  Generated code. Do not modify.
//  source: aaos.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $2;

class Info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Info', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'programme')
    ..aOM<$2.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intake', subBuilder: $2.Timestamp.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nationality')
    ..hasRequiredFields = false
  ;

  Info._() : super();
  factory Info({
    $core.String? name,
    $core.String? gender,
    $core.String? id,
    $core.String? programme,
    $2.Timestamp? intake,
    $core.String? nationality,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (id != null) {
      _result.id = id;
    }
    if (programme != null) {
      _result.programme = programme;
    }
    if (intake != null) {
      _result.intake = intake;
    }
    if (nationality != null) {
      _result.nationality = nationality;
    }
    return _result;
  }
  factory Info.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Info.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Info clone() => Info()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Info copyWith(void Function(Info) updates) => super.copyWith((message) => updates(message as Info)) as Info; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Info create() => Info._();
  Info createEmptyInstance() => create();
  static $pb.PbList<Info> createRepeated() => $pb.PbList<Info>();
  @$core.pragma('dart2js:noInline')
  static Info getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Info>(create);
  static Info? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get programme => $_getSZ(3);
  @$pb.TagNumber(4)
  set programme($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProgramme() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgramme() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get intake => $_getN(4);
  @$pb.TagNumber(5)
  set intake($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasIntake() => $_has(4);
  @$pb.TagNumber(5)
  void clearIntake() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureIntake() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get nationality => $_getSZ(5);
  @$pb.TagNumber(6)
  set nationality($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNationality() => $_has(5);
  @$pb.TagNumber(6)
  void clearNationality() => clearField(6);
}

class Timetable_Class extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Timetable.Class', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cid')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lecturer')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'room')
    ..aOM<$2.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'begin', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'end', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'day', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Timetable_Class._() : super();
  factory Timetable_Class({
    $core.String? cid,
    $core.String? name,
    $core.String? lecturer,
    $core.String? room,
    $2.Timestamp? begin,
    $2.Timestamp? end,
    $core.int? day,
  }) {
    final _result = create();
    if (cid != null) {
      _result.cid = cid;
    }
    if (name != null) {
      _result.name = name;
    }
    if (lecturer != null) {
      _result.lecturer = lecturer;
    }
    if (room != null) {
      _result.room = room;
    }
    if (begin != null) {
      _result.begin = begin;
    }
    if (end != null) {
      _result.end = end;
    }
    if (day != null) {
      _result.day = day;
    }
    return _result;
  }
  factory Timetable_Class.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Timetable_Class.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Timetable_Class clone() => Timetable_Class()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Timetable_Class copyWith(void Function(Timetable_Class) updates) => super.copyWith((message) => updates(message as Timetable_Class)) as Timetable_Class; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Timetable_Class create() => Timetable_Class._();
  Timetable_Class createEmptyInstance() => create();
  static $pb.PbList<Timetable_Class> createRepeated() => $pb.PbList<Timetable_Class>();
  @$core.pragma('dart2js:noInline')
  static Timetable_Class getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timetable_Class>(create);
  static Timetable_Class? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cid => $_getSZ(0);
  @$pb.TagNumber(1)
  set cid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lecturer => $_getSZ(2);
  @$pb.TagNumber(3)
  set lecturer($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLecturer() => $_has(2);
  @$pb.TagNumber(3)
  void clearLecturer() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get room => $_getSZ(3);
  @$pb.TagNumber(4)
  set room($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoom() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get begin => $_getN(4);
  @$pb.TagNumber(5)
  set begin($2.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasBegin() => $_has(4);
  @$pb.TagNumber(5)
  void clearBegin() => clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureBegin() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.Timestamp get end => $_getN(5);
  @$pb.TagNumber(6)
  set end($2.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasEnd() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnd() => clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureEnd() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get day => $_getIZ(6);
  @$pb.TagNumber(7)
  set day($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDay() => $_has(6);
  @$pb.TagNumber(7)
  void clearDay() => clearField(7);
}

class Timetable extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Timetable', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..pc<Timetable_Class>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classes', $pb.PbFieldType.PM, subBuilder: Timetable_Class.create)
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdate', protoName: 'lastUpdate', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Timetable._() : super();
  factory Timetable({
    $core.Iterable<Timetable_Class>? classes,
    $2.Timestamp? lastUpdate,
  }) {
    final _result = create();
    if (classes != null) {
      _result.classes.addAll(classes);
    }
    if (lastUpdate != null) {
      _result.lastUpdate = lastUpdate;
    }
    return _result;
  }
  factory Timetable.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Timetable.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Timetable clone() => Timetable()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Timetable copyWith(void Function(Timetable) updates) => super.copyWith((message) => updates(message as Timetable)) as Timetable; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Timetable create() => Timetable._();
  Timetable createEmptyInstance() => create();
  static $pb.PbList<Timetable> createRepeated() => $pb.PbList<Timetable>();
  @$core.pragma('dart2js:noInline')
  static Timetable getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timetable>(create);
  static Timetable? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Timetable_Class> get classes => $_getList(0);

  @$pb.TagNumber(2)
  $2.Timestamp get lastUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set lastUpdate($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastUpdate() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureLastUpdate() => $_ensure(1);
}

class Courses_Course extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Courses.Course', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'credit', $pb.PbFieldType.OU3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lecturer')
    ..hasRequiredFields = false
  ;

  Courses_Course._() : super();
  factory Courses_Course({
    $core.String? name,
    $core.int? credit,
    $core.String? lecturer,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (credit != null) {
      _result.credit = credit;
    }
    if (lecturer != null) {
      _result.lecturer = lecturer;
    }
    return _result;
  }
  factory Courses_Course.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Courses_Course.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Courses_Course clone() => Courses_Course()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Courses_Course copyWith(void Function(Courses_Course) updates) => super.copyWith((message) => updates(message as Courses_Course)) as Courses_Course; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Courses_Course create() => Courses_Course._();
  Courses_Course createEmptyInstance() => create();
  static $pb.PbList<Courses_Course> createRepeated() => $pb.PbList<Courses_Course>();
  @$core.pragma('dart2js:noInline')
  static Courses_Course getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Courses_Course>(create);
  static Courses_Course? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get credit => $_getIZ(1);
  @$pb.TagNumber(2)
  set credit($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCredit() => $_has(1);
  @$pb.TagNumber(2)
  void clearCredit() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lecturer => $_getSZ(2);
  @$pb.TagNumber(3)
  set lecturer($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLecturer() => $_has(2);
  @$pb.TagNumber(3)
  void clearLecturer() => clearField(3);
}

class Courses extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Courses', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..pc<Courses_Course>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courses', $pb.PbFieldType.PM, subBuilder: Courses_Course.create)
    ..hasRequiredFields = false
  ;

  Courses._() : super();
  factory Courses({
    $core.Iterable<Courses_Course>? courses,
  }) {
    final _result = create();
    if (courses != null) {
      _result.courses.addAll(courses);
    }
    return _result;
  }
  factory Courses.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Courses.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Courses clone() => Courses()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Courses copyWith(void Function(Courses) updates) => super.copyWith((message) => updates(message as Courses)) as Courses; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Courses create() => Courses._();
  Courses createEmptyInstance() => create();
  static $pb.PbList<Courses> createRepeated() => $pb.PbList<Courses>();
  @$core.pragma('dart2js:noInline')
  static Courses getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Courses>(create);
  static Courses? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Courses_Course> get courses => $_getList(0);
}

class Exams_Exam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Exams.Exam', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exam')
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'begin', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'end', subBuilder: $2.Timestamp.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'venue')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courseName', protoName: 'courseName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status')
    ..hasRequiredFields = false
  ;

  Exams_Exam._() : super();
  factory Exams_Exam({
    $core.String? exam,
    $2.Timestamp? begin,
    $2.Timestamp? end,
    $core.String? venue,
    $core.String? courseName,
    $core.String? type,
    $core.String? status,
  }) {
    final _result = create();
    if (exam != null) {
      _result.exam = exam;
    }
    if (begin != null) {
      _result.begin = begin;
    }
    if (end != null) {
      _result.end = end;
    }
    if (venue != null) {
      _result.venue = venue;
    }
    if (courseName != null) {
      _result.courseName = courseName;
    }
    if (type != null) {
      _result.type = type;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory Exams_Exam.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Exams_Exam.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Exams_Exam clone() => Exams_Exam()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Exams_Exam copyWith(void Function(Exams_Exam) updates) => super.copyWith((message) => updates(message as Exams_Exam)) as Exams_Exam; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Exams_Exam create() => Exams_Exam._();
  Exams_Exam createEmptyInstance() => create();
  static $pb.PbList<Exams_Exam> createRepeated() => $pb.PbList<Exams_Exam>();
  @$core.pragma('dart2js:noInline')
  static Exams_Exam getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Exams_Exam>(create);
  static Exams_Exam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get exam => $_getSZ(0);
  @$pb.TagNumber(1)
  set exam($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExam() => $_has(0);
  @$pb.TagNumber(1)
  void clearExam() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get begin => $_getN(1);
  @$pb.TagNumber(2)
  set begin($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBegin() => $_has(1);
  @$pb.TagNumber(2)
  void clearBegin() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureBegin() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Timestamp get end => $_getN(2);
  @$pb.TagNumber(3)
  set end($2.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnd() => clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureEnd() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get venue => $_getSZ(3);
  @$pb.TagNumber(4)
  set venue($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVenue() => $_has(3);
  @$pb.TagNumber(4)
  void clearVenue() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get courseName => $_getSZ(4);
  @$pb.TagNumber(5)
  set courseName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCourseName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCourseName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);
}

class Exams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Exams', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..pc<Exams_Exam>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exams', $pb.PbFieldType.PM, subBuilder: Exams_Exam.create)
    ..aOM<$2.Timestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdate', protoName: 'lastUpdate', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Exams._() : super();
  factory Exams({
    $core.Iterable<Exams_Exam>? exams,
    $2.Timestamp? lastUpdate,
  }) {
    final _result = create();
    if (exams != null) {
      _result.exams.addAll(exams);
    }
    if (lastUpdate != null) {
      _result.lastUpdate = lastUpdate;
    }
    return _result;
  }
  factory Exams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Exams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Exams clone() => Exams()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Exams copyWith(void Function(Exams) updates) => super.copyWith((message) => updates(message as Exams)) as Exams; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Exams create() => Exams._();
  Exams createEmptyInstance() => create();
  static $pb.PbList<Exams> createRepeated() => $pb.PbList<Exams>();
  @$core.pragma('dart2js:noInline')
  static Exams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Exams>(create);
  static Exams? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Exams_Exam> get exams => $_getList(0);

  @$pb.TagNumber(2)
  $2.Timestamp get lastUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set lastUpdate($2.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastUpdate() => clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureLastUpdate() => $_ensure(1);
}

class Transcript_Session_Course extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Transcript.Session.Course', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'credit', $pb.PbFieldType.OU3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grade')
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'point', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Transcript_Session_Course._() : super();
  factory Transcript_Session_Course({
    $core.String? code,
    $core.String? name,
    $core.int? credit,
    $core.String? grade,
    $core.double? point,
  }) {
    final _result = create();
    if (code != null) {
      _result.code = code;
    }
    if (name != null) {
      _result.name = name;
    }
    if (credit != null) {
      _result.credit = credit;
    }
    if (grade != null) {
      _result.grade = grade;
    }
    if (point != null) {
      _result.point = point;
    }
    return _result;
  }
  factory Transcript_Session_Course.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transcript_Session_Course.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transcript_Session_Course clone() => Transcript_Session_Course()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transcript_Session_Course copyWith(void Function(Transcript_Session_Course) updates) => super.copyWith((message) => updates(message as Transcript_Session_Course)) as Transcript_Session_Course; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transcript_Session_Course create() => Transcript_Session_Course._();
  Transcript_Session_Course createEmptyInstance() => create();
  static $pb.PbList<Transcript_Session_Course> createRepeated() => $pb.PbList<Transcript_Session_Course>();
  @$core.pragma('dart2js:noInline')
  static Transcript_Session_Course getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transcript_Session_Course>(create);
  static Transcript_Session_Course? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get credit => $_getIZ(2);
  @$pb.TagNumber(3)
  set credit($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCredit() => $_has(2);
  @$pb.TagNumber(3)
  void clearCredit() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get grade => $_getSZ(3);
  @$pb.TagNumber(4)
  set grade($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGrade() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrade() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get point => $_getN(4);
  @$pb.TagNumber(5)
  set point($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoint() => clearField(5);
}

class Transcript_Session extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Transcript.Session', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'session')
    ..pc<Transcript_Session_Course>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'courses', $pb.PbFieldType.PM, subBuilder: Transcript_Session_Course.create)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gpa', $pb.PbFieldType.OF)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cGpa', $pb.PbFieldType.OF, protoName: 'cGpa')
    ..hasRequiredFields = false
  ;

  Transcript_Session._() : super();
  factory Transcript_Session({
    $core.String? session,
    $core.Iterable<Transcript_Session_Course>? courses,
    $core.double? gpa,
    $core.double? cGpa,
  }) {
    final _result = create();
    if (session != null) {
      _result.session = session;
    }
    if (courses != null) {
      _result.courses.addAll(courses);
    }
    if (gpa != null) {
      _result.gpa = gpa;
    }
    if (cGpa != null) {
      _result.cGpa = cGpa;
    }
    return _result;
  }
  factory Transcript_Session.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transcript_Session.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transcript_Session clone() => Transcript_Session()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transcript_Session copyWith(void Function(Transcript_Session) updates) => super.copyWith((message) => updates(message as Transcript_Session)) as Transcript_Session; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transcript_Session create() => Transcript_Session._();
  Transcript_Session createEmptyInstance() => create();
  static $pb.PbList<Transcript_Session> createRepeated() => $pb.PbList<Transcript_Session>();
  @$core.pragma('dart2js:noInline')
  static Transcript_Session getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transcript_Session>(create);
  static Transcript_Session? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Transcript_Session_Course> get courses => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get gpa => $_getN(2);
  @$pb.TagNumber(3)
  set gpa($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGpa() => $_has(2);
  @$pb.TagNumber(3)
  void clearGpa() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get cGpa => $_getN(3);
  @$pb.TagNumber(4)
  set cGpa($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCGpa() => $_has(3);
  @$pb.TagNumber(4)
  void clearCGpa() => clearField(4);
}

class Transcript extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Transcript', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'xmux.core.aaos.v4'), createEmptyInstance: create)
    ..pc<Transcript_Session>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sessions', $pb.PbFieldType.PM, subBuilder: Transcript_Session.create)
    ..hasRequiredFields = false
  ;

  Transcript._() : super();
  factory Transcript({
    $core.Iterable<Transcript_Session>? sessions,
  }) {
    final _result = create();
    if (sessions != null) {
      _result.sessions.addAll(sessions);
    }
    return _result;
  }
  factory Transcript.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transcript.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transcript clone() => Transcript()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transcript copyWith(void Function(Transcript) updates) => super.copyWith((message) => updates(message as Transcript)) as Transcript; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transcript create() => Transcript._();
  Transcript createEmptyInstance() => create();
  static $pb.PbList<Transcript> createRepeated() => $pb.PbList<Transcript>();
  @$core.pragma('dart2js:noInline')
  static Transcript getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transcript>(create);
  static Transcript? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transcript_Session> get sessions => $_getList(0);
}

