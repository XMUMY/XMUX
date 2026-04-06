// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LostAndFoundForm on _LostAndFoundForm, Store {
  late final _$typeAtom =
      Atom(name: '_LostAndFoundForm.type', context: context);

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

  late final _$nameAtom =
      Atom(name: '_LostAndFoundForm.name', context: context);

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

  late final _$timeAtom =
      Atom(name: '_LostAndFoundForm.time', context: context);

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

  late final _$locationAtom =
      Atom(name: '_LostAndFoundForm.location', context: context);

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

  late final _$descriptionAtom =
      Atom(name: '_LostAndFoundForm.description', context: context);

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

  late final _$contactsAtom =
      Atom(name: '_LostAndFoundForm.contacts', context: context);

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
