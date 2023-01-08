import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pokedex/core/routes/app_pages.dart';
import 'package:pokedex/core/routes/app_routes.dart';
import 'package:pokedex/core/services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(GetMaterialApp(
      title: 'Pokedex',
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
    ));
  });
}
