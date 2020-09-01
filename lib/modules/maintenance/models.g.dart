// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestForm on _RequestForm, Store {
  final _$usageAtom = Atom(name: '_RequestForm.usage');

  @override
  String get usage {
    _$usageAtom.reportRead();
    return super.usage;
  }

  @override
  set usage(String value) {
    _$usageAtom.reportWrite(value, super.usage, () {
      super.usage = value;
    });
  }

  final _$categoryAtom = Atom(name: '_RequestForm.category');

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$blockAtom = Atom(name: '_RequestForm.block');

  @override
  String get block {
    _$blockAtom.reportRead();
    return super.block;
  }

  @override
  set block(String value) {
    _$blockAtom.reportWrite(value, super.block, () {
      super.block = value;
    });
  }

  final _$wingAtom = Atom(name: '_RequestForm.wing');

  @override
  String get wing {
    _$wingAtom.reportRead();
    return super.wing;
  }

  @override
  set wing(String value) {
    _$wingAtom.reportWrite(value, super.wing, () {
      super.wing = value;
    });
  }

  final _$roomAtom = Atom(name: '_RequestForm.room');

  @override
  String get room {
    _$roomAtom.reportRead();
    return super.room;
  }

  @override
  set room(String value) {
    _$roomAtom.reportWrite(value, super.room, () {
      super.room = value;
    });
  }

  final _$recurringProblemAtom = Atom(name: '_RequestForm.recurringProblem');

  @override
  bool get recurringProblem {
    _$recurringProblemAtom.reportRead();
    return super.recurringProblem;
  }

  @override
  set recurringProblem(bool value) {
    _$recurringProblemAtom.reportWrite(value, super.recurringProblem, () {
      super.recurringProblem = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_RequestForm.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$fileAtom = Atom(name: '_RequestForm.file');

  @override
  File get file {
    _$fileAtom.reportRead();
    return super.file;
  }

  @override
  set file(File value) {
    _$fileAtom.reportWrite(value, super.file, () {
      super.file = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_RequestForm.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  @override
  String toString() {
    return '''
usage: ${usage},
category: ${category},
block: ${block},
wing: ${wing},
room: ${room},
recurringProblem: ${recurringProblem},
description: ${description},
file: ${file},
phoneNumber: ${phoneNumber}
    ''';
  }
}
