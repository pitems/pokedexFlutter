import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/core/routes/app_routes.dart';
import 'package:pokedex/features/pokedex/presentation/pages/poke_splash.dart';
import 'package:pokedex/features/pokedex/presentation/pages/pokedata.dart';
import 'package:pokedex/features/pokedex/presentation/pages/pokehome.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => ResponsivePage(const PokeHome()),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.DETAIL,
        page: () => ResponsivePage(const PokeDataPage()),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.SPLASH,
        page: () => ResponsivePage(const PokeSplash()),
        transition: Transition.leftToRight),
  ];
}

ResponsiveSizer ResponsivePage(Widget page) {
  return ResponsiveSizer(
    builder: (context, orientation, deviceType) {
      return page;
    },
  );
}
