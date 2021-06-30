import 'package:hive_flutter/hive_flutter.dart';

import '../models/history.dart';

class HiveProvider {
  static Future initialize() async {
    await Hive.openBox<History>('history');
  }

  List<History> getHistory() {
    final box = Hive.box<History>('history');
    return box.values.toList();
  }

  void addHistory(History history) {
    final box = Hive.box<History>('history');
    if (box.values.length >= 10) {
      box.deleteAt(0);
    }
    box.add(history);
  }
}
