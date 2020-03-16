// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestForm on _RequestForm, Store {
  final _$usageAtom = Atom(name: '_RequestForm.usage');

  @override
  String get usage {
    _$usageAtom.context.enforceReadPolicy(_$usageAtom);
    _$usageAtom.reportObserved();
    return super.usage;
  }

  @override
  set usage(String value) {
    _$usageAtom.context.conditionallyRunInAction(() {
      super.usage = value;
      _$usageAtom.reportChanged();
    }, _$usageAtom, name: '${_$usageAtom.name}_set');
  }

  final _$categoryAtom = Atom(name: '_RequestForm.category');

  @override
  String get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$blockAtom = Atom(name: '_RequestForm.block');

  @override
  String get block {
    _$blockAtom.context.enforceReadPolicy(_$blockAtom);
    _$blockAtom.reportObserved();
    return super.block;
  }

  @override
  set block(String value) {
    _$blockAtom.context.conditionallyRunInAction(() {
      super.block = value;
      _$blockAtom.reportChanged();
    }, _$blockAtom, name: '${_$blockAtom.name}_set');
  }

  final _$wingAtom = Atom(name: '_RequestForm.wing');

  @override
  String get wing {
    _$wingAtom.context.enforceReadPolicy(_$wingAtom);
    _$wingAtom.reportObserved();
    return super.wing;
  }

  @override
  set wing(String value) {
    _$wingAtom.context.conditionallyRunInAction(() {
      super.wing = value;
      _$wingAtom.reportChanged();
    }, _$wingAtom, name: '${_$wingAtom.name}_set');
  }

  final _$roomAtom = Atom(name: '_RequestForm.room');

  @override
  String get room {
    _$roomAtom.context.enforceReadPolicy(_$roomAtom);
    _$roomAtom.reportObserved();
    return super.room;
  }

  @override
  set room(String value) {
    _$roomAtom.context.conditionallyRunInAction(() {
      super.room = value;
      _$roomAtom.reportChanged();
    }, _$roomAtom, name: '${_$roomAtom.name}_set');
  }

  final _$recurringProblemAtom = Atom(name: '_RequestForm.recurringProblem');

  @override
  bool get recurringProblem {
    _$recurringProblemAtom.context.enforceReadPolicy(_$recurringProblemAtom);
    _$recurringProblemAtom.reportObserved();
    return super.recurringProblem;
  }

  @override
  set recurringProblem(bool value) {
    _$recurringProblemAtom.context.conditionallyRunInAction(() {
      super.recurringProblem = value;
      _$recurringProblemAtom.reportChanged();
    }, _$recurringProblemAtom, name: '${_$recurringProblemAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_RequestForm.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$fileAtom = Atom(name: '_RequestForm.file');

  @override
  File get file {
    _$fileAtom.context.enforceReadPolicy(_$fileAtom);
    _$fileAtom.reportObserved();
    return super.file;
  }

  @override
  set file(File value) {
    _$fileAtom.context.conditionallyRunInAction(() {
      super.file = value;
      _$fileAtom.reportChanged();
    }, _$fileAtom, name: '${_$fileAtom.name}_set');
  }

  final _$phoneNumberAtom = Atom(name: '_RequestForm.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.context.enforceReadPolicy(_$phoneNumberAtom);
    _$phoneNumberAtom.reportObserved();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.context.conditionallyRunInAction(() {
      super.phoneNumber = value;
      _$phoneNumberAtom.reportChanged();
    }, _$phoneNumberAtom, name: '${_$phoneNumberAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'usage: ${usage.toString()},category: ${category.toString()},block: ${block.toString()},wing: ${wing.toString()},room: ${room.toString()},recurringProblem: ${recurringProblem.toString()},description: ${description.toString()},file: ${file.toString()},phoneNumber: ${phoneNumber.toString()}';
    return '{$string}';
  }
}
