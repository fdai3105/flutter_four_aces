import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_four_aces/src/data/models/history.dart';
import 'package:flutter_four_aces/src/modules/game_module/game_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/modules/game_module/game_binding.dart';
import 'src/modules/game_module/game_page.dart';
import 'src/routes/app_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryAdapter());
  Hive.registerAdapter(GameCardAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialBinding: GameBinding(),
      home: const GamePage(),
    );
  }
}
