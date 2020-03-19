// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v3_lost_and_found.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LostAndFoundBrief _$LostAndFoundBriefFromJson(Map<String, dynamic> json) {
  return LostAndFoundBrief(
    json['id'] as String,
    json['uid'] as String,
    _$enumDecodeNullable(_$LostAndFoundTypeEnumMap, json['type']),
    json['name'] as String,
    timestampFromJson(json['timestamp'] as int),
    json['location'] as String,
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$LostAndFoundTypeEnumMap = {
  LostAndFoundType.lost: 0,
  LostAndFoundType.found: 1,
};

LostAndFoundDetail _$LostAndFoundDetailFromJson(Map<String, dynamic> json) {
  return LostAndFoundDetail(
    json['id'] as String,
    json['uid'] as String,
    _$enumDecodeNullable(_$LostAndFoundTypeEnumMap, json['type']),
    json['name'] as String,
    timestampFromJson(json['timestamp'] as int),
    json['location'] as String,
    json['description'] as String,
    (json['contacts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    (json['pictures'] as List)?.map((e) => e as String)?.toList(),
    json['comment'] as String,
  );
}

NewLostAndFoundReq _$NewLostAndFoundReqFromJson(Map<String, dynamic> json) {
  return NewLostAndFoundReq()
    ..type = _$enumDecodeNullable(_$LostAndFoundTypeEnumMap, json['type'])
    ..name = json['name'] as String
    ..timestamp = timestampFromJson(json['timestamp'] as int)
    ..location = json['location'] as String
    ..description = json['description'] as String
    ..contacts = (json['contacts'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$NewLostAndFoundReqToJson(NewLostAndFoundReq instance) =>
    <String, dynamic>{
      'type': _$LostAndFoundTypeEnumMap[instance.type],
      'name': instance.name,
      'timestamp': timestampToJson(instance.timestamp),
      'location': instance.location,
      'description': instance.description,
      'contacts': instance.contacts,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewLostAndFoundReq on _NewLostAndFoundReq, Store {
  final _$typeAtom = Atom(name: '_NewLostAndFoundReq.type');

  @override
  LostAndFoundType get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(LostAndFoundType value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_NewLostAndFoundReq.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$timestampAtom = Atom(name: '_NewLostAndFoundReq.timestamp');

  @override
  DateTime get timestamp {
    _$timestampAtom.context.enforceReadPolicy(_$timestampAtom);
    _$timestampAtom.reportObserved();
    return super.timestamp;
  }

  @override
  set timestamp(DateTime value) {
    _$timestampAtom.context.conditionallyRunInAction(() {
      super.timestamp = value;
      _$timestampAtom.reportChanged();
    }, _$timestampAtom, name: '${_$timestampAtom.name}_set');
  }

  final _$locationAtom = Atom(name: '_NewLostAndFoundReq.location');

  @override
  String get location {
    _$locationAtom.context.enforceReadPolicy(_$locationAtom);
    _$locationAtom.reportObserved();
    return super.location;
  }

  @override
  set location(String value) {
    _$locationAtom.context.conditionallyRunInAction(() {
      super.location = value;
      _$locationAtom.reportChanged();
    }, _$locationAtom, name: '${_$locationAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_NewLostAndFoundReq.description');

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

  final _$contactsAtom = Atom(name: '_NewLostAndFoundReq.contacts');

  @override
  Map<String, String> get contacts {
    _$contactsAtom.context.enforceReadPolicy(_$contactsAtom);
    _$contactsAtom.reportObserved();
    return super.contacts;
  }

  @override
  set contacts(Map<String, String> value) {
    _$contactsAtom.context.conditionallyRunInAction(() {
      super.contacts = value;
      _$contactsAtom.reportChanged();
    }, _$contactsAtom, name: '${_$contactsAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'type: ${type.toString()},name: ${name.toString()},timestamp: ${timestamp.toString()},location: ${location.toString()},description: ${description.toString()},contacts: ${contacts.toString()}';
    return '{$string}';
  }
}
