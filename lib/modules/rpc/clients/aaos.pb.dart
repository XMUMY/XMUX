///
//  Generated code. Do not modify.
//  source: aaos.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'aaos.pbenum.dart';
import 'google/protobuf/timestamp.pb.dart' as $2;

export 'aaos.pbenum.dart';

class Info extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Info',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..e<Info_Gender>(2, 'gender', $pb.PbFieldType.OE,
        defaultOrMaker: Info_Gender.male,
        valueOf: Info_Gender.valueOf,
        enumValues: Info_Gender.values)
    ..aOS(3, 'id')
    ..aOS(4, 'programme')
    ..aOM<$2.Timestamp>(5, 'intake', subBuilder: $2.Timestamp.create)
    ..aOS(6, 'nationality')
    ..hasRequiredFields = false;

  Info._() : super();

  factory Info() => create();

  factory Info.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Info.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Info clone() => Info()..mergeFromMessage(this);

  Info copyWith(void Function(Info) updates) =>
      super.copyWith((message) => updates(message as Info));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Info create() => Info._();

  Info createEmptyInstance() => create();

  static $pb.PbList<Info> createRepeated() => $pb.PbList<Info>();

  @$core.pragma('dart2js:noInline')
  static Info getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Info>(create);
  static Info _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  Info_Gender get gender => $_getN(1);

  @$pb.TagNumber(2)
  set gender(Info_Gender v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGender() => $_has(1);

  @$pb.TagNumber(2)
  void clearGender() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get id => $_getSZ(2);

  @$pb.TagNumber(3)
  set id($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasId() => $_has(2);

  @$pb.TagNumber(3)
  void clearId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get programme => $_getSZ(3);

  @$pb.TagNumber(4)
  set programme($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProgramme() => $_has(3);

  @$pb.TagNumber(4)
  void clearProgramme() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get intake => $_getN(4);

  @$pb.TagNumber(5)
  set intake($2.Timestamp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasIntake() => $_has(4);

  @$pb.TagNumber(5)
  void clearIntake() => clearField(5);

  @$pb.TagNumber(5)
  $2.Timestamp ensureIntake() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get nationality => $_getSZ(5);

  @$pb.TagNumber(6)
  set nationality($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasNationality() => $_has(5);

  @$pb.TagNumber(6)
  void clearNationality() => clearField(6);
}

class Timetable_Class extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Timetable.Class',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'cid')
    ..aOS(2, 'name')
    ..aOS(3, 'lecturer')
    ..aOS(4, 'room')
    ..aOM<$2.Timestamp>(5, 'begin', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(6, 'end', subBuilder: $2.Timestamp.create)
    ..a<$core.int>(7, 'day', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  Timetable_Class._() : super();

  factory Timetable_Class() => create();

  factory Timetable_Class.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Timetable_Class.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Timetable_Class clone() => Timetable_Class()..mergeFromMessage(this);

  Timetable_Class copyWith(void Function(Timetable_Class) updates) =>
      super.copyWith((message) => updates(message as Timetable_Class));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Timetable_Class create() => Timetable_Class._();

  Timetable_Class createEmptyInstance() => create();

  static $pb.PbList<Timetable_Class> createRepeated() =>
      $pb.PbList<Timetable_Class>();

  @$core.pragma('dart2js:noInline')
  static Timetable_Class getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Timetable_Class>(create);
  static Timetable_Class _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cid => $_getSZ(0);

  @$pb.TagNumber(1)
  set cid($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCid() => $_has(0);

  @$pb.TagNumber(1)
  void clearCid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);

  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);

  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lecturer => $_getSZ(2);

  @$pb.TagNumber(3)
  set lecturer($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLecturer() => $_has(2);

  @$pb.TagNumber(3)
  void clearLecturer() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get room => $_getSZ(3);

  @$pb.TagNumber(4)
  set room($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasRoom() => $_has(3);

  @$pb.TagNumber(4)
  void clearRoom() => clearField(4);

  @$pb.TagNumber(5)
  $2.Timestamp get begin => $_getN(4);

  @$pb.TagNumber(5)
  set begin($2.Timestamp v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBegin() => $_has(4);

  @$pb.TagNumber(5)
  void clearBegin() => clearField(5);

  @$pb.TagNumber(5)
  $2.Timestamp ensureBegin() => $_ensure(4);

  @$pb.TagNumber(6)
  $2.Timestamp get end => $_getN(5);

  @$pb.TagNumber(6)
  set end($2.Timestamp v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasEnd() => $_has(5);

  @$pb.TagNumber(6)
  void clearEnd() => clearField(6);

  @$pb.TagNumber(6)
  $2.Timestamp ensureEnd() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get day => $_getIZ(6);

  @$pb.TagNumber(7)
  set day($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasDay() => $_has(6);

  @$pb.TagNumber(7)
  void clearDay() => clearField(7);
}

class Timetable extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Timetable',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pc<Timetable_Class>(1, 'classes', $pb.PbFieldType.PM,
        subBuilder: Timetable_Class.create)
    ..hasRequiredFields = false;

  Timetable._() : super();

  factory Timetable() => create();

  factory Timetable.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Timetable.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Timetable clone() => Timetable()..mergeFromMessage(this);

  Timetable copyWith(void Function(Timetable) updates) =>
      super.copyWith((message) => updates(message as Timetable));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Timetable create() => Timetable._();

  Timetable createEmptyInstance() => create();

  static $pb.PbList<Timetable> createRepeated() => $pb.PbList<Timetable>();

  @$core.pragma('dart2js:noInline')
  static Timetable getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Timetable>(create);
  static Timetable _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Timetable_Class> get classes => $_getList(0);
}

class Courses_Course extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Courses.Course',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'name')
    ..a<$core.int>(2, 'credit', $pb.PbFieldType.OU3)
    ..aOS(3, 'lecturer')
    ..hasRequiredFields = false;

  Courses_Course._() : super();

  factory Courses_Course() => create();

  factory Courses_Course.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Courses_Course.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Courses_Course clone() => Courses_Course()..mergeFromMessage(this);

  Courses_Course copyWith(void Function(Courses_Course) updates) =>
      super.copyWith((message) => updates(message as Courses_Course));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Courses_Course create() => Courses_Course._();

  Courses_Course createEmptyInstance() => create();

  static $pb.PbList<Courses_Course> createRepeated() =>
      $pb.PbList<Courses_Course>();

  @$core.pragma('dart2js:noInline')
  static Courses_Course getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Courses_Course>(create);
  static Courses_Course _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);

  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);

  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get credit => $_getIZ(1);

  @$pb.TagNumber(2)
  set credit($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCredit() => $_has(1);

  @$pb.TagNumber(2)
  void clearCredit() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lecturer => $_getSZ(2);

  @$pb.TagNumber(3)
  set lecturer($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasLecturer() => $_has(2);

  @$pb.TagNumber(3)
  void clearLecturer() => clearField(3);
}

class Courses extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Courses',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pc<Courses_Course>(1, 'courses', $pb.PbFieldType.PM,
        subBuilder: Courses_Course.create)
    ..hasRequiredFields = false;

  Courses._() : super();

  factory Courses() => create();

  factory Courses.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Courses.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Courses clone() => Courses()..mergeFromMessage(this);

  Courses copyWith(void Function(Courses) updates) =>
      super.copyWith((message) => updates(message as Courses));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Courses create() => Courses._();

  Courses createEmptyInstance() => create();

  static $pb.PbList<Courses> createRepeated() => $pb.PbList<Courses>();

  @$core.pragma('dart2js:noInline')
  static Courses getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Courses>(create);
  static Courses _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Courses_Course> get courses => $_getList(0);
}

class Exams_Exam extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Exams.Exam',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'exam')
    ..aOM<$2.Timestamp>(2, 'begin', subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(3, 'end', subBuilder: $2.Timestamp.create)
    ..aOS(4, 'venue')
    ..aOS(5, 'courseName', protoName: 'courseName')
    ..aOS(6, 'type')
    ..aOS(7, 'status')
    ..hasRequiredFields = false;

  Exams_Exam._() : super();

  factory Exams_Exam() => create();

  factory Exams_Exam.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Exams_Exam.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Exams_Exam clone() => Exams_Exam()..mergeFromMessage(this);

  Exams_Exam copyWith(void Function(Exams_Exam) updates) =>
      super.copyWith((message) => updates(message as Exams_Exam));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Exams_Exam create() => Exams_Exam._();

  Exams_Exam createEmptyInstance() => create();

  static $pb.PbList<Exams_Exam> createRepeated() => $pb.PbList<Exams_Exam>();

  @$core.pragma('dart2js:noInline')
  static Exams_Exam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Exams_Exam>(create);
  static Exams_Exam _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get exam => $_getSZ(0);

  @$pb.TagNumber(1)
  set exam($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExam() => $_has(0);

  @$pb.TagNumber(1)
  void clearExam() => clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get begin => $_getN(1);

  @$pb.TagNumber(2)
  set begin($2.Timestamp v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasBegin() => $_has(1);

  @$pb.TagNumber(2)
  void clearBegin() => clearField(2);

  @$pb.TagNumber(2)
  $2.Timestamp ensureBegin() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Timestamp get end => $_getN(2);

  @$pb.TagNumber(3)
  set end($2.Timestamp v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEnd() => $_has(2);

  @$pb.TagNumber(3)
  void clearEnd() => clearField(3);

  @$pb.TagNumber(3)
  $2.Timestamp ensureEnd() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get venue => $_getSZ(3);

  @$pb.TagNumber(4)
  set venue($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasVenue() => $_has(3);

  @$pb.TagNumber(4)
  void clearVenue() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get courseName => $_getSZ(4);

  @$pb.TagNumber(5)
  set courseName($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCourseName() => $_has(4);

  @$pb.TagNumber(5)
  void clearCourseName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get type => $_getSZ(5);

  @$pb.TagNumber(6)
  set type($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasType() => $_has(5);

  @$pb.TagNumber(6)
  void clearType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);

  @$pb.TagNumber(7)
  set status($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);

  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);
}

class Exams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Exams',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pc<Exams_Exam>(1, 'exams', $pb.PbFieldType.PM,
        subBuilder: Exams_Exam.create)
    ..hasRequiredFields = false;

  Exams._() : super();

  factory Exams() => create();

  factory Exams.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Exams.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Exams clone() => Exams()..mergeFromMessage(this);

  Exams copyWith(void Function(Exams) updates) =>
      super.copyWith((message) => updates(message as Exams));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Exams create() => Exams._();

  Exams createEmptyInstance() => create();

  static $pb.PbList<Exams> createRepeated() => $pb.PbList<Exams>();

  @$core.pragma('dart2js:noInline')
  static Exams getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Exams>(create);
  static Exams _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Exams_Exam> get exams => $_getList(0);
}

class Transcript_Session_Course extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transcript.Session.Course',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'code')
    ..aOS(2, 'name')
    ..a<$core.int>(3, 'credit', $pb.PbFieldType.OU3)
    ..aOS(4, 'grade')
    ..a<$core.double>(5, 'point', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  Transcript_Session_Course._() : super();

  factory Transcript_Session_Course() => create();

  factory Transcript_Session_Course.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Transcript_Session_Course.fromJson(
          $core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Transcript_Session_Course clone() =>
      Transcript_Session_Course()..mergeFromMessage(this);

  Transcript_Session_Course copyWith(
          void Function(Transcript_Session_Course) updates) =>
      super
          .copyWith((message) => updates(message as Transcript_Session_Course));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transcript_Session_Course create() => Transcript_Session_Course._();

  Transcript_Session_Course createEmptyInstance() => create();

  static $pb.PbList<Transcript_Session_Course> createRepeated() =>
      $pb.PbList<Transcript_Session_Course>();

  @$core.pragma('dart2js:noInline')
  static Transcript_Session_Course getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transcript_Session_Course>(create);
  static Transcript_Session_Course _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);

  @$pb.TagNumber(1)
  set code($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);

  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);

  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);

  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get credit => $_getIZ(2);

  @$pb.TagNumber(3)
  set credit($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCredit() => $_has(2);

  @$pb.TagNumber(3)
  void clearCredit() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get grade => $_getSZ(3);

  @$pb.TagNumber(4)
  set grade($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGrade() => $_has(3);

  @$pb.TagNumber(4)
  void clearGrade() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get point => $_getN(4);

  @$pb.TagNumber(5)
  set point($core.double v) {
    $_setFloat(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPoint() => $_has(4);

  @$pb.TagNumber(5)
  void clearPoint() => clearField(5);
}

class Transcript_Session extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transcript.Session',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..aOS(1, 'session')
    ..pc<Transcript_Session_Course>(2, 'courses', $pb.PbFieldType.PM,
        subBuilder: Transcript_Session_Course.create)
    ..a<$core.double>(3, 'gpa', $pb.PbFieldType.OF)
    ..a<$core.double>(4, 'cGpa', $pb.PbFieldType.OF, protoName: 'cGpa')
    ..hasRequiredFields = false;

  Transcript_Session._() : super();

  factory Transcript_Session() => create();

  factory Transcript_Session.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Transcript_Session.fromJson(
          $core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Transcript_Session clone() => Transcript_Session()..mergeFromMessage(this);

  Transcript_Session copyWith(void Function(Transcript_Session) updates) =>
      super.copyWith((message) => updates(message as Transcript_Session));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transcript_Session create() => Transcript_Session._();

  Transcript_Session createEmptyInstance() => create();

  static $pb.PbList<Transcript_Session> createRepeated() =>
      $pb.PbList<Transcript_Session>();

  @$core.pragma('dart2js:noInline')
  static Transcript_Session getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transcript_Session>(create);
  static Transcript_Session _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);

  @$pb.TagNumber(1)
  set session($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);

  @$pb.TagNumber(1)
  void clearSession() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Transcript_Session_Course> get courses => $_getList(1);

  @$pb.TagNumber(3)
  $core.double get gpa => $_getN(2);

  @$pb.TagNumber(3)
  set gpa($core.double v) {
    $_setFloat(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasGpa() => $_has(2);

  @$pb.TagNumber(3)
  void clearGpa() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get cGpa => $_getN(3);

  @$pb.TagNumber(4)
  set cGpa($core.double v) {
    $_setFloat(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCGpa() => $_has(3);

  @$pb.TagNumber(4)
  void clearCGpa() => clearField(4);
}

class Transcript extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transcript',
      package: const $pb.PackageName('xmux.core.aaos.v4'),
      createEmptyInstance: create)
    ..pc<Transcript_Session>(1, 'sessions', $pb.PbFieldType.PM,
        subBuilder: Transcript_Session.create)
    ..hasRequiredFields = false;

  Transcript._() : super();

  factory Transcript() => create();

  factory Transcript.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);

  factory Transcript.fromJson($core.Map<$core.String, $core.dynamic> i) =>
      create()..mergeFromProto3Json(i);

  $core.Map<$core.String, $core.dynamic> toJson() => toProto3Json();

  Transcript clone() => Transcript()..mergeFromMessage(this);

  Transcript copyWith(void Function(Transcript) updates) =>
      super.copyWith((message) => updates(message as Transcript));

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transcript create() => Transcript._();

  Transcript createEmptyInstance() => create();

  static $pb.PbList<Transcript> createRepeated() => $pb.PbList<Transcript>();

  @$core.pragma('dart2js:noInline')
  static Transcript getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transcript>(create);
  static Transcript _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transcript_Session> get sessions => $_getList(0);
}
