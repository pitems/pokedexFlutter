//Felipe Rudloff (9/03/2022)
import 'dart:convert';
import 'dart:developer';

import 'package:pokedex/features/pokedex/domain/entities/pokemon_entity.dart';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class PokemonTypeData {
  const PokemonTypeData({
    required this.damageRelations,
    required this.gameIndices,
    required this.generation,
    required this.id,
    required this.moves,
    required this.name,
    required this.names,
    required this.pokemon,
  });

  final DamageRelations damageRelations;
  final List<GameIndices> gameIndices;
  final GenerationII generation;
  final int id;
  final List<Moves> moves;
  final String name;
  final List<Names> names;
  final List<PokemonList> pokemon;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'damage_relations': damageRelations,
        'game_indices': gameIndices,
        'generation': generation,
        'id': id,
        'moves': moves,
        'name': name,
        'names': names,
        'pokemon': pokemon,
      };
}

class DamageRelations {
  const DamageRelations({
    required this.doubleDamageFrom,
    required this.doubleDamageTo,
    required this.halfDamageFrom,
    required this.halfDamageTo,
    required this.noDamageFrom,
    required this.noDamageTo,
  });

  factory DamageRelations.fromJson(Map<String, dynamic> json) {
    final List<DoubleDamageFrom>? doubleDamageFrom =
        json['double_damage_from'] is List ? <DoubleDamageFrom>[] : null;
    if (doubleDamageFrom != null) {
      for (final dynamic item in json['double_damage_from']!) {
        if (item != null) {
          tryCatch(() {
            doubleDamageFrom.add(DoubleDamageFrom.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<DoubleDamageTo>? doubleDamageTo =
        json['double_damage_to'] is List ? <DoubleDamageTo>[] : null;
    if (doubleDamageTo != null) {
      for (final dynamic item in json['double_damage_to']!) {
        if (item != null) {
          tryCatch(() {
            doubleDamageTo.add(DoubleDamageTo.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<HalfDamageFrom>? halfDamageFrom =
        json['half_damage_from'] is List ? <HalfDamageFrom>[] : null;
    if (halfDamageFrom != null) {
      for (final dynamic item in json['half_damage_from']!) {
        if (item != null) {
          tryCatch(() {
            halfDamageFrom.add(HalfDamageFrom.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<HalfDamageTo>? halfDamageTo =
        json['half_damage_to'] is List ? <HalfDamageTo>[] : null;
    if (halfDamageTo != null) {
      for (final dynamic item in json['half_damage_to']!) {
        if (item != null) {
          tryCatch(() {
            halfDamageTo.add(HalfDamageTo.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Object>? noDamageFrom = json['no_damage_from'] is List ? <Object>[] : null;
    if (noDamageFrom != null) {
      for (final dynamic item in json['no_damage_from']!) {
        if (item != null) {
          tryCatch(() {
            noDamageFrom.add(asT<Object>(item)!);
          });
        }
      }
    }

    final List<Object>? noDamageTo = json['no_damage_to'] is List ? <Object>[] : null;
    if (noDamageTo != null) {
      for (final dynamic item in json['no_damage_to']!) {
        if (item != null) {
          tryCatch(() {
            noDamageTo.add(asT<Object>(item)!);
          });
        }
      }
    }
    return DamageRelations(
      doubleDamageFrom: doubleDamageFrom!,
      doubleDamageTo: doubleDamageTo!,
      halfDamageFrom: halfDamageFrom!,
      halfDamageTo: halfDamageTo!,
      noDamageFrom: noDamageFrom!,
      noDamageTo: noDamageTo!,
    );
  }

  final List<DoubleDamageFrom> doubleDamageFrom;
  final List<DoubleDamageTo> doubleDamageTo;
  final List<HalfDamageFrom> halfDamageFrom;
  final List<HalfDamageTo> halfDamageTo;
  final List<Object> noDamageFrom;
  final List<Object> noDamageTo;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'double_damage_from': doubleDamageFrom,
        'double_damage_to': doubleDamageTo,
        'half_damage_from': halfDamageFrom,
        'half_damage_to': halfDamageTo,
        'no_damage_from': noDamageFrom,
        'no_damage_to': noDamageTo,
      };
}

class DoubleDamageFrom {
  const DoubleDamageFrom({
    required this.name,
    required this.url,
  });

  factory DoubleDamageFrom.fromJson(Map<String, dynamic> json) => DoubleDamageFrom(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class DoubleDamageTo {
  const DoubleDamageTo({
    required this.name,
    required this.url,
  });

  factory DoubleDamageTo.fromJson(Map<String, dynamic> json) => DoubleDamageTo(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class HalfDamageFrom {
  const HalfDamageFrom({
    required this.name,
    required this.url,
  });

  factory HalfDamageFrom.fromJson(Map<String, dynamic> json) => HalfDamageFrom(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class HalfDamageTo {
  const HalfDamageTo({
    required this.name,
    required this.url,
  });

  factory HalfDamageTo.fromJson(Map<String, dynamic> json) => HalfDamageTo(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class GameIndices {
  const GameIndices({
    required this.gameIndex,
    required this.generation,
  });

  factory GameIndices.fromJson(Map<String, dynamic> json) => GameIndices(
        gameIndex: asT<int>(json['game_index'])!,
        generation: GenerationI.fromJson(asT<Map<String, dynamic>>(json['generation'])!),
      );

  final int gameIndex;
  final GenerationI generation;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'game_index': gameIndex,
        'generation': generation,
      };
}

class GenerationI {
  const GenerationI({
    required this.name,
    required this.url,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class GenerationII {
  const GenerationII({
    required this.name,
    required this.url,
  });

  factory GenerationII.fromJson(Map<String, dynamic> json) => GenerationII(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class MoveDamageClass {
  const MoveDamageClass({
    required this.name,
    required this.url,
  });

  factory MoveDamageClass.fromJson(Map<String, dynamic> json) => MoveDamageClass(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Moves {
  const Moves({
    required this.name,
    required this.url,
  });

  factory Moves.fromJson(Map<String, dynamic> json) => Moves(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class Names {
  const Names({
    required this.language,
    required this.name,
  });

  factory Names.fromJson(Map<String, dynamic> json) => Names(
        language: Language.fromJson(asT<Map<String, dynamic>>(json['language'])!),
        name: asT<String>(json['name'])!,
      );

  final Language language;
  final String name;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'language': language,
        'name': name,
      };
}

class Language {
  const Language({
    required this.name,
    required this.url,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: asT<String>(json['name'])!,
        url: asT<String>(json['url'])!,
      );

  final String name;
  final String url;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'url': url,
      };
}

class PokemonList {
  const PokemonList({
    required this.pokemon,
    required this.slot,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) => PokemonList(
        pokemon: Pokemons.fromJson(asT<Map<String, dynamic>>(json['pokemon'])!),
        slot: asT<int>(json['slot'])!,
      );

  final Pokemons pokemon;
  final int slot;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pokemon': pokemon,
        'slot': slot,
      };
}

// class Pokemon {
//   const Pokemon({
//     required this.name,
//     required this.url,
//   });

//   factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
//         name: asT<String>(json['name'])!,
//         url: asT<String>(json['url'])!,
//       );

//   final String name;
//   final String url;

//   @override
//   String toString() {
//     return jsonEncode(this);
//   }

//   Map<String, dynamic> toJson() => <String, dynamic>{
//         'name': name,
//         'url': url,
//       };
// }
