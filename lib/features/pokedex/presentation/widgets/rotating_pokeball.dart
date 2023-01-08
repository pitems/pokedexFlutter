import 'package:flutter/material.dart';

class PokeBallLoading extends StatefulWidget {
  const PokeBallLoading({Key? key}) : super(key: key);

  @override
  State<PokeBallLoading> createState() => _PokeBallLoadingState();
}

class _PokeBallLoadingState extends State<PokeBallLoading> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    controller.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: Center(
        child: Image.asset(
          'assets/pokeball.png',
          width: 100,
        ),
      ),
    );
  }
}
