import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pokedex/core/constants/palette.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../domain/entities/pokemon_data.dart';

Widget stats(PokemonData pokeData, int totalStat) {
  List itemNames = ['HP', 'Attack', 'Defense', 'Sp. Atk', 'Sp. Def', 'Speed'];
  List colors = [
    Palette.hpColor,
    Palette.attackColor,
    Palette.defenseColor,
    Palette.spAtkColor,
    Palette.spDefColor,
    Palette.speedColor
  ];
  List colorsBack = [
    Palette.hpColorBack,
    Palette.attackColorBack,
    Palette.defenseColorBack,
    Palette.spAtkColorBack,
    Palette.spDefColorBack,
    Palette.speedColorBack
  ];
  TextStyle style = const TextStyle(fontWeight: FontWeight.bold);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35),
    child: Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        for (var i = 0; i < pokeData.stats.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: lineBar(
                style: style,
                baseStat: pokeData.stats[i].baseStat,
                totalStat: totalStat,
                name: itemNames[i],
                color: colors[i],
                backColor: colorsBack[i]),
          ),
        const Divider(thickness: 2),
        Row(
          children: [
            const Text(
              'Total: ',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              '$totalStat',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget lineBar(
    {required TextStyle style,
    required int baseStat,
    required int totalStat,
    required String name,
    required Color color,
    required Color backColor}) {
  return Row(
    children: [
      //'HP   ${pokeData.stats[0].baseStat}'
      SizedBox(
        width: 18.w,
        child: RichText(
          text: TextSpan(style: style, children: <TextSpan>[
            TextSpan(text: name, style: const TextStyle(color: Colors.grey, fontSize: 17)),
          ]),
        ),
      ),
      SizedBox(
        width: 9.w,
        child: RichText(
            text: TextSpan(
                text: ' $baseStat',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ))),
      ),

      Expanded(
        child: LinearPercentIndicator(
          barRadius: const Radius.circular(10),
          backgroundColor: backColor,
          progressColor: color,
          percent: baseStat / totalStat + 0.2,
          lineHeight: 10,
        ),
      ),
    ],
  );
}
