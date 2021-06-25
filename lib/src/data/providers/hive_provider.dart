import 'package:hive_flutter/hive_flutter.dart';

import '../models/history.dart';

class HiveProvider {
  HiveProvider() {
    Hive.openBox<History>('history');
  }

  Future<List<History>> getHistory() async {
    final box = Hive.box<History>('history');
    return box.values.toList();
  }

  Future addHistory(History history) async {
    final box = await Hive.openBox<History>('history');
    await box.add(history);
  }
}
