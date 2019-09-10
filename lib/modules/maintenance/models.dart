import 'dart:io';

import 'package:mobx/mobx.dart';

part 'models.g.dart';

class FaqQuestion {
  final int id;
  final DateTime date;
  final String title;
  final String answer;

  FaqQuestion({this.id, this.date, this.title, this.answer});
}

class MyRequest {
  final String id;
  final DateTime date;
  final String title;
  final String category;
  final String usage;
  final String answer;

  MyRequest(
      {this.id, this.date, this.title, this.category, this.usage, this.answer});
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
  String usage;

  @observable
  String category;

  @observable
  String block;

  @observable
  String wing;

  @observable
  String room;

  @observable
  bool recurringProblem = false;

  @observable
  String description;

  @observable
  File file;

  @observable
  String phoneNumber;

  _RequestForm(
      {this.usages,
      this.categories,
      this.blocks,
      this.wings,
      this.gender,
      this.name,
      this.email,
      this.token,
      this.phoneNumber});
}
