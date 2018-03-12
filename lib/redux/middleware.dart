import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';

bool _isSaving = false;

void saveMiddleware<State>(Store<State> store, action, NextDispatcher next) {
  next(action);

  if (!_isSaving) {
    _isSaving = true;
    _fileSave(JSON.encode(mainAppStore.state.toMap()), "state.dat")
        .then((n) => _isSaving = false);
  }
}

Future<Null> _fileSave(String fileText, String fileName) async {
  await new Future.delayed(new Duration(seconds: 5));
  String appDocDir = (await getApplicationDocumentsDirectory()).path;
  await (new File('$appDocDir/$fileName')).writeAsString(fileText);
}
