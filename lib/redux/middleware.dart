import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';
import 'package:xmux/globals.dart';

void saveMiddleware<State>(Store<State> store, action, NextDispatcher next) {
  next(action);
  _fileSave(JSON.encode(mainAppStore.state.toMap()), "state.dat");
}

Future<Null> _fileSave(String fileText, String fileName) async {
  String appDocDir = (await getApplicationDocumentsDirectory()).path;
  await (new File('$appDocDir/$fileName')).writeAsString(fileText);
}
