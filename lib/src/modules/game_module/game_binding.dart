import 'package:get/get.dart';

import '../../data/providers/hive_provider.dart';
import 'game_controller.dart';

class GameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameController(hiveProvider: HiveProvider()));
  }
}
