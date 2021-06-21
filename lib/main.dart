import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/modules/game_module/game_binding.dart';
import 'src/modules/game_module/game_page.dart';
import 'src/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeRight,
  //   DeviceOrientation.landscapeLeft,
  // ]);
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
      home: GamePage(),
    );
  }
}
