import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';

bool _isSaving = false;

void saveMiddleware<State>(Store<State> store, action, NextDispatcher next) {
  next(action);

  print(
      "Redux/saveMiddleware: Invoked (Action: ${action.runtimeType} IsSaving: ${_isSaving.toString()} NeedSave: ${action.needSave} Sync: ${action.sync}) ");

  if (!_isSaving && action.needSave) {
    _isSaving = true;
    _fileSave(jsonEncode(mainAppStore.state.toMap()), "state.dat",
            sync: action.sync)
        .then((n) => _isSaving = false);
  }
}

Future<Null> _fileSave(String fileText, String fileName, {bool sync}) async {
  if (!sync) await new Future.delayed(new Duration(seconds: 3));
  print("Redux/saveMiddleware: Saving state.");
  String appDocDir = (await getApplicationDocumentsDirectory()).path;
  await (new File('$appDocDir/$fileName')).writeAsString(fileText);
}
