import 'package:get/get.dart';

import '../modules/game_module/game_binding.dart';
import '../modules/game_module/game_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.game,
      page: () => GamePage(),
      binding: GameBinding(),
    )
  ];
}
