import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/core/constants/app_assets.dart';
import 'package:pokedex/core/constants/palette.dart';
import 'package:pokedex/core/routes/app_routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PokeSplash extends StatefulWidget {
  const PokeSplash({Key? key}) : super(key: key);

  @override
  State<PokeSplash> createState() => _PokeSplashState();
}

class _PokeSplashState extends State<PokeSplash> {
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  Timer? _timer;
  int _start = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: Stack(children: [
        SizedBox(
          height: 100.h,
          child: ElasticIn(
            duration: const Duration(seconds: 5),
            child: SizedBox(
              height: 300,
              child: Image.asset('${AppAssets.root}pokeball.png'),
            ),
          ),
        ),
        Positioned(top: 5.h, child: Image.asset('${AppAssets.root}pokedex.png'))
      ]),
    );
  }

  void startTimer() async {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (_start == 0) {
          Get.offNamed(Routes.INITIAL);
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
