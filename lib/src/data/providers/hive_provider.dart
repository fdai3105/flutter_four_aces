import 'package:hive_flutter/hive_flutter.dart';

import '../models/history.dart';

class HiveProvider {
  Future<List<History>> getHistory() async {
    final box = await Hive.openBox<History>('history');
    return box.values.toList();
  }

  Future<Stream<History>> getItem() async {
    final box = await Hive.openBox<History>('history');
    return box.watch().map<History>((event) {
      return History(
        dateTime: event.value.dateTime,
        choice: event.value.choice,
        result: event.value.result,
      );
    });
  }

  Future addHistory(History history) async {
    final box = await Hive.openBox<History>('history');
    await box.add(history);
  }
}
