//Felipe Rudloff (9/03/2022)
import 'dart:convert';
import 'dart:developer';

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

class PokemonData {
  const PokemonData({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<Abilities> abilities;
  final int baseExperience;
  final int height;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Moves> moves;
  final String name;
  final int order;
  final List<Object> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stats> stats;
  final List<Types> types;
  final int weight;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'abilities': abilities,
        'base_experience': baseExperience,
        'height': height,
        'id': id,
        'is_default': isDefault,
        'location_area_encounters': locationAreaEncounters,
        'moves': moves,
        'name': name,
        'order': order,
        'past_types': pastTypes,
        'species': species,
        'sprites': sprites,
        'stats': stats,
        'types': types,
        'weight': weight,
      };
}

class Abilities {
  const Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) => Abilities(
        ability: Ability.fromJson(asT<Map<String, dynamic>>(json['ability'])!),
        isHidden: asT<bool>(json['is_hidden'])!,
        slot: asT<int>(json['slot'])!,
      );

  final Ability ability;
  final bool isHidden;
  final int slot;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ability': ability,
        'is_hidden': isHidden,
        'slot': slot,
      };
}

class Ability {
  const Ability({
    required this.name,
    required this.url,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
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
    required this.move,
    required this.versionGroupDetails,
  });

  factory Moves.fromJson(Map<String, dynamic> json) {
    final List<VersionGroupDetails>? versionGroupDetails =
        json['version_group_details'] is List ? <VersionGroupDetails>[] : null;
    if (versionGroupDetails != null) {
      for (final dynamic item in json['version_group_details']!) {
        if (item != null) {
          tryCatch(() {
            versionGroupDetails.add(VersionGroupDetails.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return Moves(
      move: Move.fromJson(asT<Map<String, dynamic>>(json['move'])!),
      versionGroupDetails: versionGroupDetails!,
    );
  }

  final Move move;
  final List<VersionGroupDetails> versionGroupDetails;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'move': move,
        'version_group_details': versionGroupDetails,
      };
}

class Move {
  const Move({
    required this.name,
    required this.url,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
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

class VersionGroupDetails {
  const VersionGroupDetails({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetails.fromJson(Map<String, dynamic> json) => VersionGroupDetails(
        levelLearnedAt: asT<int>(json['level_learned_at'])!,
        moveLearnMethod:
            MoveLearnMethod.fromJson(asT<Map<String, dynamic>>(json['move_learn_method'])!),
        versionGroup: VersionGroup.fromJson(asT<Map<String, dynamic>>(json['version_group'])!),
      );

  final int levelLearnedAt;
  final MoveLearnMethod moveLearnMethod;
  final VersionGroup versionGroup;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'level_learned_at': levelLearnedAt,
        'move_learn_method': moveLearnMethod,
        'version_group': versionGroup,
      };
}

class MoveLearnMethod {
  const MoveLearnMethod({
    required this.name,
    required this.url,
  });

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) => MoveLearnMethod(
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

class VersionGroup {
  const VersionGroup({
    required this.name,
    required this.url,
  });

  factory VersionGroup.fromJson(Map<String, dynamic> json) => VersionGroup(
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

class Species {
  const Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
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

class Sprites {
  const Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: asT<String?>(json['back_default']),
        backFemale: asT<String?>(json['back_female']),
        backShiny: asT<String?>(json['back_shiny']),
        backShinyFemale: asT<String?>(json['back_shiny_female']),
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<String?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final Object? frontShinyFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_female': backFemale,
        'back_shiny': backShiny,
        'back_shiny_female': backShinyFemale,
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class Stats {
  const Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        baseStat: asT<int>(json['base_stat'])!,
        effort: asT<int>(json['effort'])!,
        stat: Stat.fromJson(asT<Map<String, dynamic>>(json['stat'])!),
      );

  final int baseStat;
  final int effort;
  final Stat stat;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat,
      };
}

class Stat {
  const Stat({
    required this.name,
    required this.url,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
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

class Types {
  const Types({
    required this.slot,
    required this.type,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        slot: asT<int>(json['slot'])!,
        type: Type.fromJson(asT<Map<String, dynamic>>(json['type'])!),
      );

  final int slot;
  final Type type;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'slot': slot,
        'type': type,
      };
}

class Type {
  const Type({
    required this.name,
    required this.url,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
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
