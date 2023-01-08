import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pokedex/core/constants/app_assets.dart';
import 'package:pokedex/core/constants/palette.dart';
import 'package:pokedex/core/services/service_locator.dart';
import 'package:pokedex/features/pokedex/presentation/controller/pokedatacontroller.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/rotating_pokeball.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DialogMove extends StatefulWidget {
  const DialogMove({Key? key}) : super(key: key);

  @override
  State<DialogMove> createState() => _DialogMoveState();
}

class _DialogMoveState extends State<DialogMove> {
  final PokeDataController _pokeDataController = sl<PokeDataController>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Obx(() {
          return _pokeDataController.loadingMove.value == true
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [SizedBox(height: 22.h, child: const PokeBallLoading())])
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringUtils.capitalize(
                              _pokeDataController.pokeMove.name.replaceAll('-', ' ')),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text('Type'),
                            SizedBox(
                              height: 1.h,
                            ),
                            Image.asset(
                                '${AppAssets.types}${_pokeDataController.pokeMove.type.name}.png'),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_pokeDataController.pokeMove.flavorTextEntries[0].flavorText
                            .replaceAll('\f', '')
                            .replaceAll('\n', ' '))
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        CardData(
                            title: 'Power',
                            value: _pokeDataController.pokeMove.power,
                            background: Palette.attackColorBack,
                            border: Palette.attackColor),
                        CardData(
                            title: 'PP',
                            value: _pokeDataController.pokeMove.pp,
                            background: Palette.speedColorBack,
                            border: Palette.speedColor),
                      ],
                    ),
                    Row(
                      children: [
                        CardData(
                            value: _pokeDataController.pokeMove.priority,
                            background: Palette.defenseColorBack,
                            border: Palette.defenseColor,
                            title: 'Priority'),
                        CardData(
                            value: _pokeDataController.pokeMove.accuracy ?? 100,
                            background: Palette.hpColorBack,
                            border: Palette.hpColor,
                            title: 'Accuracy')
                      ],
                    )
                  ],
                );
        }),
      ),
    );
  }
}

Widget CardData(
    {int? value, required Color background, required Color border, required String title}) {
  return Expanded(
    child: Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: border, width: 2), borderRadius: BorderRadius.circular(10)),
      color: background,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(title),
        ),
        Divider(
          thickness: 2,
          color: border,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(value == null ? '0' : value.toString()),
        )
      ]),
    ),
  );
}
