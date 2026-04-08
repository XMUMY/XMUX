// This is a generated file - do not edit.
//
// Generated from aaos/v4/aaos.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Info extends $pb.GeneratedMessage {
  factory Info({
    $core.String? name,
    $core.String? gender,
    $core.String? id,
    $core.String? programme,
    $2.Timestamp? intake,
    $core.String? nationality,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (gender != null) result.gender = gender;
    if (id != null) result.id = id;
    if (programme != null) result.programme = programme;
    if (intake != null) result.intake = intake;
    if (nationality != null) result.nationality = nationality;
    return result;
  }

  Info._();

  factory Info.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Info.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Info',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'gender')
    ..aOS(3, _omitFieldNames ? '' : 'id')
    ..aOS(4, _omitFieldNames ? '' : 'programme')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'intake',
        subBuilder: $2.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'nationality')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Info clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Info copyWith(void Function(Info) updates) =>
      super.copyWith((message) => updates(message as Info)) as Info;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Info create() => Info._();
  @$core.override
  Info createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Info getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Info>(create);
  static Info? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get gender => $_getSZ(1);
  @$pb.TagNumber(2)
  set gender($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);
  @$pb.TagNumber(2)
  void clearGender() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);
  @$pb.TagNumber(3)
  set id($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);
  @$pb.TagNumber(3)
  void clearId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get programme => $_getSZ(3);
  @$pb.TagNumber(4)
  set programme($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasProgramme() => $_has(3);
  @$pb.TagNumber(4)
  void clearProgramme() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get intake => $_getN(4);
  @$pb.TagNumber(5)
  set intake($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasIntake() => $_has(4);
  @$pb.TagNumber(5)
  void clearIntake() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureIntake() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get nationality => $_getSZ(5);
  @$pb.TagNumber(6)
  set nationality($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNationality() => $_has(5);
  @$pb.TagNumber(6)
  void clearNationality() => $_clearField(6);
}

class Timetable_Class extends $pb.GeneratedMessage {
  factory Timetable_Class({
    $core.String? cid,
    $core.String? name,
    $core.String? lecturer,
    $core.String? room,
    $2.Timestamp? begin,
    $2.Timestamp? end,
    $core.int? day,
  }) {
    final result = create();
    if (cid != null) result.cid = cid;
    if (name != null) result.name = name;
    if (lecturer != null) result.lecturer = lecturer;
    if (room != null) result.room = room;
    if (begin != null) result.begin = begin;
    if (end != null) result.end = end;
    if (day != null) result.day = day;
    return result;
  }

  Timetable_Class._();

  factory Timetable_Class.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Timetable_Class.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Timetable.Class',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'lecturer')
    ..aOS(4, _omitFieldNames ? '' : 'room')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'begin',
        subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'end',
        subBuilder: $2.Timestamp.create)
    ..aI(7, _omitFieldNames ? '' : 'day', fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Timetable_Class clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Timetable_Class copyWith(void Function(Timetable_Class) updates) =>
      super.copyWith((message) => updates(message as Timetable_Class))
          as Timetable_Class;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Timetable_Class create() => Timetable_Class._();
  @$core.override
  Timetable_Class createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Timetable_Class getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Timetable_Class>(create);
  static Timetable_Class? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cid => $_getSZ(0);
  @$pb.TagNumber(1)
  set cid($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);
  @$pb.TagNumber(1)
  void clearCid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lecturer => $_getSZ(2);
  @$pb.TagNumber(3)
  set lecturer($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLecturer() => $_has(2);
  @$pb.TagNumber(3)
  void clearLecturer() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get room => $_getSZ(3);
  @$pb.TagNumber(4)
  set room($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoom() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get begin => $_getN(4);
  @$pb.TagNumber(5)
  set begin($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasBegin() => $_has(4);
  @$pb.TagNumber(5)
  void clearBegin() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureBegin() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.Timestamp get end => $_getN(5);
  @$pb.TagNumber(6)
  set end($2.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasEnd() => $_has(5);
  @$pb.TagNumber(6)
  void clearEnd() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureEnd() => $_ensure(5);

  /// Day of week. Start from 1 (Monday).
  @$pb.TagNumber(7)
  $core.int get day => $_getIZ(6);
  @$pb.TagNumber(7)
  set day($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDay() => $_has(6);
  @$pb.TagNumber(7)
  void clearDay() => $_clearField(7);
}

class Timetable extends $pb.GeneratedMessage {
  factory Timetable({
    $core.Iterable<Timetable_Class>? classes,
    $2.Timestamp? lastUpdate,
  }) {
    final result = create();
    if (classes != null) result.classes.addAll(classes);
    if (lastUpdate != null) result.lastUpdate = lastUpdate;
    return result;
  }

  Timetable._();

  factory Timetable.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Timetable.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Timetable',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pPM<Timetable_Class>(1, _omitFieldNames ? '' : 'classes',
        subBuilder: Timetable_Class.create)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'lastUpdate',
        protoName: 'lastUpdate', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Timetable clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Timetable copyWith(void Function(Timetable) updates) =>
      super.copyWith((message) => updates(message as Timetable)) as Timetable;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Timetable create() => Timetable._();
  @$core.override
  Timetable createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Timetable getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timetable>(create);
  static Timetable? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Timetable_Class> get classes => $_getList(0);

  @$pb.TagNumber(2)
  $2.Timestamp get lastUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set lastUpdate($2.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLastUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastUpdate() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureLastUpdate() => $_ensure(1);
}

class Courses_Course extends $pb.GeneratedMessage {
  factory Courses_Course({
    $core.String? name,
    $core.int? credit,
    $core.String? lecturer,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (credit != null) result.credit = credit;
    if (lecturer != null) result.lecturer = lecturer;
    return result;
  }

  Courses_Course._();

  factory Courses_Course.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Courses_Course.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Courses.Course',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aI(2, _omitFieldNames ? '' : 'credit', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'lecturer')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Courses_Course clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Courses_Course copyWith(void Function(Courses_Course) updates) =>
      super.copyWith((message) => updates(message as Courses_Course))
          as Courses_Course;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Courses_Course create() => Courses_Course._();
  @$core.override
  Courses_Course createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Courses_Course getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Courses_Course>(create);
  static Courses_Course? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get credit => $_getIZ(1);
  @$pb.TagNumber(2)
  set credit($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCredit() => $_has(1);
  @$pb.TagNumber(2)
  void clearCredit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get lecturer => $_getSZ(2);
  @$pb.TagNumber(3)
  set lecturer($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLecturer() => $_has(2);
  @$pb.TagNumber(3)
  void clearLecturer() => $_clearField(3);
}

class Courses extends $pb.GeneratedMessage {
  factory Courses({
    $core.Iterable<Courses_Course>? courses,
  }) {
    final result = create();
    if (courses != null) result.courses.addAll(courses);
    return result;
  }

  Courses._();

  factory Courses.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Courses.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Courses',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pPM<Courses_Course>(1, _omitFieldNames ? '' : 'courses',
        subBuilder: Courses_Course.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Courses clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Courses copyWith(void Function(Courses) updates) =>
      super.copyWith((message) => updates(message as Courses)) as Courses;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Courses create() => Courses._();
  @$core.override
  Courses createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Courses getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Courses>(create);
  static Courses? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Courses_Course> get courses => $_getList(0);
}

class Exams_Exam extends $pb.GeneratedMessage {
  factory Exams_Exam({
    $core.String? exam,
    $2.Timestamp? begin,
    $2.Timestamp? end,
    $core.String? venue,
    $core.String? courseName,
    $core.String? type,
    $core.String? status,
  }) {
    final result = create();
    if (exam != null) result.exam = exam;
    if (begin != null) result.begin = begin;
    if (end != null) result.end = end;
    if (venue != null) result.venue = venue;
    if (courseName != null) result.courseName = courseName;
    if (type != null) result.type = type;
    if (status != null) result.status = status;
    return result;
  }

  Exams_Exam._();

  factory Exams_Exam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Exams_Exam.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Exams.Exam',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'exam')
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'begin',
        subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'end',
        subBuilder: $2.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'venue')
    ..aOS(5, _omitFieldNames ? '' : 'courseName', protoName: 'courseName')
    ..aOS(6, _omitFieldNames ? '' : 'type')
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Exams_Exam clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Exams_Exam copyWith(void Function(Exams_Exam) updates) =>
      super.copyWith((message) => updates(message as Exams_Exam)) as Exams_Exam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Exams_Exam create() => Exams_Exam._();
  @$core.override
  Exams_Exam createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Exams_Exam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Exams_Exam>(create);
  static Exams_Exam? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get exam => $_getSZ(0);
  @$pb.TagNumber(1)
  set exam($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasExam() => $_has(0);
  @$pb.TagNumber(1)
  void clearExam() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get begin => $_getN(1);
  @$pb.TagNumber(2)
  set begin($2.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBegin() => $_has(1);
  @$pb.TagNumber(2)
  void clearBegin() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureBegin() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Timestamp get end => $_getN(2);
  @$pb.TagNumber(3)
  set end($2.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnd() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureEnd() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get venue => $_getSZ(3);
  @$pb.TagNumber(4)
  set venue($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVenue() => $_has(3);
  @$pb.TagNumber(4)
  void clearVenue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get courseName => $_getSZ(4);
  @$pb.TagNumber(5)
  set courseName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCourseName() => $_has(4);
  @$pb.TagNumber(5)
  void clearCourseName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);
  @$pb.TagNumber(6)
  set type($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);
  @$pb.TagNumber(6)
  void clearType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);
}

class Exams extends $pb.GeneratedMessage {
  factory Exams({
    $core.Iterable<Exams_Exam>? exams,
    $2.Timestamp? lastUpdate,
  }) {
    final result = create();
    if (exams != null) result.exams.addAll(exams);
    if (lastUpdate != null) result.lastUpdate = lastUpdate;
    return result;
  }

  Exams._();

  factory Exams.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Exams.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Exams',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pPM<Exams_Exam>(1, _omitFieldNames ? '' : 'exams',
        subBuilder: Exams_Exam.create)
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'lastUpdate',
        protoName: 'lastUpdate', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Exams clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Exams copyWith(void Function(Exams) updates) =>
      super.copyWith((message) => updates(message as Exams)) as Exams;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Exams create() => Exams._();
  @$core.override
  Exams createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Exams getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Exams>(create);
  static Exams? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Exams_Exam> get exams => $_getList(0);

  @$pb.TagNumber(2)
  $2.Timestamp get lastUpdate => $_getN(1);
  @$pb.TagNumber(2)
  set lastUpdate($2.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLastUpdate() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastUpdate() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureLastUpdate() => $_ensure(1);
}

class Transcript_Session_Course extends $pb.GeneratedMessage {
  factory Transcript_Session_Course({
    $core.String? code,
    $core.String? name,
    $core.int? credit,
    $core.String? grade,
    $core.double? point,
  }) {
    final result = create();
    if (code != null) result.code = code;
    if (name != null) result.name = name;
    if (credit != null) result.credit = credit;
    if (grade != null) result.grade = grade;
    if (point != null) result.point = point;
    return result;
  }

  Transcript_Session_Course._();

  factory Transcript_Session_Course.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transcript_Session_Course.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transcript.Session.Course',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aI(3, _omitFieldNames ? '' : 'credit', fieldType: $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : 'grade')
    ..aD(5, _omitFieldNames ? '' : 'point', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transcript_Session_Course clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transcript_Session_Course copyWith(
          void Function(Transcript_Session_Course) updates) =>
      super.copyWith((message) => updates(message as Transcript_Session_Course))
          as Transcript_Session_Course;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transcript_Session_Course create() => Transcript_Session_Course._();
  @$core.override
  Transcript_Session_Course createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transcript_Session_Course getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transcript_Session_Course>(create);
  static Transcript_Session_Course? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get credit => $_getIZ(2);
  @$pb.TagNumber(3)
  set credit($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCredit() => $_has(2);
  @$pb.TagNumber(3)
  void clearCredit() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get grade => $_getSZ(3);
  @$pb.TagNumber(4)
  set grade($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGrade() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrade() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get point => $_getN(4);
  @$pb.TagNumber(5)
  set point($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPoint() => $_has(4);
  @$pb.TagNumber(5)
  void clearPoint() => $_clearField(5);
}

class Transcript_Session extends $pb.GeneratedMessage {
  factory Transcript_Session({
    $core.String? session,
    $core.Iterable<Transcript_Session_Course>? courses,
    $core.double? gpa,
    $core.double? cGpa,
  }) {
    final result = create();
    if (session != null) result.session = session;
    if (courses != null) result.courses.addAll(courses);
    if (gpa != null) result.gpa = gpa;
    if (cGpa != null) result.cGpa = cGpa;
    return result;
  }

  Transcript_Session._();

  factory Transcript_Session.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transcript_Session.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transcript.Session',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..pPM<Transcript_Session_Course>(2, _omitFieldNames ? '' : 'courses',
        subBuilder: Transcript_Session_Course.create)
    ..aD(3, _omitFieldNames ? '' : 'gpa', fieldType: $pb.PbFieldType.OF)
    ..aD(4, _omitFieldNames ? '' : 'cGpa',
        protoName: 'cGpa', fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transcript_Session clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transcript_Session copyWith(void Function(Transcript_Session) updates) =>
      super.copyWith((message) => updates(message as Transcript_Session))
          as Transcript_Session;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transcript_Session create() => Transcript_Session._();
  @$core.override
  Transcript_Session createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transcript_Session getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transcript_Session>(create);
  static Transcript_Session? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<Transcript_Session_Course> get courses => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get gpa => $_getN(2);
  @$pb.TagNumber(3)
  set gpa($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGpa() => $_has(2);
  @$pb.TagNumber(3)
  void clearGpa() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get cGpa => $_getN(3);
  @$pb.TagNumber(4)
  set cGpa($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCGpa() => $_has(3);
  @$pb.TagNumber(4)
  void clearCGpa() => $_clearField(4);
}

class Transcript extends $pb.GeneratedMessage {
  factory Transcript({
    $core.Iterable<Transcript_Session>? sessions,
  }) {
    final result = create();
    if (sessions != null) result.sessions.addAll(sessions);
    return result;
  }

  Transcript._();

  factory Transcript.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transcript.fromJson($core.Map<$core.String, $core.dynamic> json) =>
      create()..mergeFromProto3Json(json);
  $core.Map<$core.String, $core.dynamic> toJson() =>
      toProto3Json() as $core.Map<$core.String, $core.dynamic>;

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transcript',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pPM<Transcript_Session>(1, _omitFieldNames ? '' : 'sessions',
        subBuilder: Transcript_Session.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transcript clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transcript copyWith(void Function(Transcript) updates) =>
      super.copyWith((message) => updates(message as Transcript)) as Transcript;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transcript create() => Transcript._();
  @$core.override
  Transcript createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Transcript getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transcript>(create);
  static Transcript? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Transcript_Session> get sessions => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
