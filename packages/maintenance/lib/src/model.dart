import 'dart:io';

import 'package:mobx/mobx.dart';

part 'model.g.dart';

class FaqEntry {
  final int id;
  final DateTime date;
  final String title;
  final String answer;

  FaqEntry({
    required this.id,
    required this.date,
    required this.title,
    required this.answer,
  });
}

class MyRequest {
  final String id;
  final DateTime date;
  final String title;
  final String category;
  final String usage;
  final String answer;

  MyRequest({
    required this.id,
    required this.date,
    required this.title,
    required this.category,
    required this.usage,
    required this.answer,
  });
}

class RequestForm = _RequestForm with _$RequestForm;

abstract class _RequestForm with Store {
  // Selections.
  final List<String> usages;
  final List<String> categories;
  final List<String> blocks;
  final List<String> wings;

  // Pre-defined.
  final String gender;
  final String name;
  final String email;
  final String token;

  @observable
  String? usage;

  @observable
  String? category;

  @observable
  String? block;

  @observable
  String? wing;

  @observable
  String? room;

  @observable
  bool recurringProblem = false;

  @observable
  String? description;

  @observable
  File? file;

  @observable
  String? phoneNumber;

  _RequestForm({
    required this.usages,
    required this.categories,
    required this.blocks,
    required this.wings,
    required this.gender,
    required this.name,
    required this.email,
    required this.token,
    this.phoneNumber,
  });
}
