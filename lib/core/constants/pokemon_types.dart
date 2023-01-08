import 'dart:ui';

import 'package:pokedex/core/constants/palette.dart';

abstract class PokeTypes {
  static const bug = 'bug';

  static const List listTypes = [
    'bug',
    'dark',
    'dragon',
    'electric',
    'fairy',
    'fighting',
    'fire',
    'flying',
    'ghost',
    'grass',
    'ground',
    'ice',
    'normal',
    'poison',
    'psychic',
    'rock',
    'steel',
    'water'
  ];
  static List<Color> listColors = [
    Palette.bugType,
    Palette.darkType,
    Palette.dragonType,
    Palette.electricType,
    Palette.fairyType,
    Palette.fightingType,
    Palette.fireType,
    Palette.flyingType,
    Palette.ghostType,
    Palette.grassType,
    Palette.groundType,
    Palette.iceType,
    Palette.normalType,
    Palette.poisonType,
    Palette.psychicType,
    Palette.rockType,
    Palette.steelType,
    Palette.waterType
  ];

  static getTypeID(String name) {
    switch (name) {
      case 'bug':
        return 7;
      case 'dark':
        return 17;
      case 'dragon':
        return 16;
      case 'electric':
        return 13;
      case 'fairy':
        return 18;
      case 'fighting':
        return 2;
      case 'fire':
        return 10;
      case 'flying':
        return 3;
      case 'ghost':
        return 8;
      case 'grass':
        return 12;
      case 'ground':
        return 5;
      case 'ice':
        return 15;
      case 'normal':
        return 1;
      case 'poison':
        return 4;
      case 'psychic':
        return 14;
      case 'rock':
        return 6;
      case 'steel':
        return 9;
      case 'water':
        return 11;
    }
  }
}
