import 'package:hive/hive.dart';

import '../../modules/game_module/game_controller.dart';

part 'history.g.dart';

@HiveType(typeId: 1)
class History extends HiveObject {
  @HiveField(0)
  final DateTime dateTime;

  @HiveField(1)
  final List<GameCard> choice;

  @HiveField(2)
  final GameCard result;

  History({
    required this.dateTime,
    required this.choice,
    required this.result,
  });

  @override
  String toString() {
    return 'History{dateTime: $dateTime, choice: $choice, result: $result}';
  }
}
