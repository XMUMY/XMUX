// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LostAndFoundForm on _LostAndFoundForm, Store {
  final _$typeAtom = Atom(name: '_LostAndFoundForm.type');

  @override
  LostAndFoundType get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(LostAndFoundType value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$nameAtom = Atom(name: '_LostAndFoundForm.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$timeAtom = Atom(name: '_LostAndFoundForm.time');

  @override
  DateTime get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(DateTime value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$locationAtom = Atom(name: '_LostAndFoundForm.location');

  @override
  String get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(String value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_LostAndFoundForm.description');

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

  final _$contactsAtom = Atom(name: '_LostAndFoundForm.contacts');

  @override
  ObservableMap<String, String> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(ObservableMap<String, String> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  @override
  String toString() {
    return '''
type: ${type},
name: ${name},
time: ${time},
location: ${location},
description: ${description},
contacts: ${contacts}
    ''';
  }
}
