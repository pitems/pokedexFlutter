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
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
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
  final List<Forms> forms;
  final List<GameIndices> gameIndices;
  final int height;
  final List<Object> heldItems;
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
        'forms': forms,
        'game_indices': gameIndices,
        'height': height,
        'held_items': heldItems,
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

class Forms {
  const Forms({
    required this.name,
    required this.url,
  });

  factory Forms.fromJson(Map<String, dynamic> json) => Forms(
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
    required this.version,
  });

  factory GameIndices.fromJson(Map<String, dynamic> json) => GameIndices(
        gameIndex: asT<int>(json['game_index'])!,
        version: Version.fromJson(asT<Map<String, dynamic>>(json['version'])!),
      );

  final int gameIndex;
  final Version version;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'game_index': gameIndex,
        'version': version,
      };
}

class Version {
  const Version({
    required this.name,
    required this.url,
  });

  factory Version.fromJson(Map<String, dynamic> json) => Version(
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
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    required this.other,
    required this.versions,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: asT<String>(json['back_default'])!,
        backFemale: asT<Object?>(json['back_female']),
        backShiny: asT<String>(json['back_shiny'])!,
        backShinyFemale: asT<Object?>(json['back_shiny_female']),
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
        other: Other.fromJson(asT<Map<String, dynamic>>(json['other'])!),
        versions: Versions.fromJson(asT<Map<String, dynamic>>(json['versions'])!),
      );

  final String? backDefault;
  final Object? backFemale;
  final String? backShiny;
  final Object? backShinyFemale;
  final String? frontDefault;
  final Object? frontFemale;
  final String? frontShiny;
  final Object? frontShinyFemale;
  final Other other;
  final Versions versions;

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
        'other': other,
        'versions': versions,
      };
}

class Other {
  const Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(asT<Map<String, dynamic>>(json['dream_world'])!),
        home: Home.fromJson(asT<Map<String, dynamic>>(json['home'])!),
        officialArtwork:
            OfficialArtwork.fromJson(asT<Map<String, dynamic>>(json['official-artwork'])!),
      );

  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dream_world': dreamWorld,
        'home': home,
        'official-artwork': officialArtwork,
      };
}

class DreamWorld {
  const DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
      );

  final String frontDefault;
  final Object? frontFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_female': frontFemale,
      };
}

class Home {
  const Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final String frontDefault;
  final Object? frontFemale;
  final String frontShiny;
  final Object? frontShinyFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class OfficialArtwork {
  const OfficialArtwork({
    required this.frontDefault,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: asT<String>(json['front_default'])!,
      );

  final String frontDefault;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
      };
}

class Versions {
  const Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(asT<Map<String, dynamic>>(json['generation-i'])!),
        generationIi: GenerationIi.fromJson(asT<Map<String, dynamic>>(json['generation-ii'])!),
        generationIii: GenerationIii.fromJson(asT<Map<String, dynamic>>(json['generation-iii'])!),
        generationIv: GenerationIv.fromJson(asT<Map<String, dynamic>>(json['generation-iv'])!),
        generationV: GenerationV.fromJson(asT<Map<String, dynamic>>(json['generation-v'])!),
        generationVi: GenerationVi.fromJson(asT<Map<String, dynamic>>(json['generation-vi'])!),
        generationVii: GenerationVii.fromJson(asT<Map<String, dynamic>>(json['generation-vii'])!),
        generationViii:
            GenerationViii.fromJson(asT<Map<String, dynamic>>(json['generation-viii'])!),
      );

  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final GenerationVi generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'generation-i': generationI,
        'generation-ii': generationIi,
        'generation-iii': generationIii,
        'generation-iv': generationIv,
        'generation-v': generationV,
        'generation-vi': generationVi,
        'generation-vii': generationVii,
        'generation-viii': generationViii,
      };
}

class GenerationI {
  const GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(asT<Map<String, dynamic>>(json['red-blue'])!),
        yellow: Yellow.fromJson(asT<Map<String, dynamic>>(json['yellow'])!),
      );

  final RedBlue redBlue;
  final Yellow yellow;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'red-blue': redBlue,
        'yellow': yellow,
      };
}

class RedBlue {
  const RedBlue({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: asT<Object?>(json['back_default']),
        backGray: asT<Object?>(json['back_gray']),
        backTransparent: asT<Object?>(json['back_transparent']),
        frontDefault: asT<Object?>(json['front_default']),
        frontGray: asT<Object?>(json['front_gray']),
        frontTransparent: asT<Object?>(json['front_transparent']),
      );

  final Object? backDefault;
  final Object? backGray;
  final Object? backTransparent;
  final Object? frontDefault;
  final Object? frontGray;
  final Object? frontTransparent;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_gray': backGray,
        'back_transparent': backTransparent,
        'front_default': frontDefault,
        'front_gray': frontGray,
        'front_transparent': frontTransparent,
      };
}

class Yellow {
  const Yellow({
    this.backDefault,
    this.backGray,
    this.backTransparent,
    this.frontDefault,
    this.frontGray,
    this.frontTransparent,
  });

  factory Yellow.fromJson(Map<String, dynamic> json) => Yellow(
        backDefault: asT<Object?>(json['back_default']),
        backGray: asT<Object?>(json['back_gray']),
        backTransparent: asT<Object?>(json['back_transparent']),
        frontDefault: asT<Object?>(json['front_default']),
        frontGray: asT<Object?>(json['front_gray']),
        frontTransparent: asT<Object?>(json['front_transparent']),
      );

  final Object? backDefault;
  final Object? backGray;
  final Object? backTransparent;
  final Object? frontDefault;
  final Object? frontGray;
  final Object? frontTransparent;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_gray': backGray,
        'back_transparent': backTransparent,
        'front_default': frontDefault,
        'front_gray': frontGray,
        'front_transparent': frontTransparent,
      };
}

class GenerationIi {
  const GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(asT<Map<String, dynamic>>(json['crystal'])!),
        gold: Gold.fromJson(asT<Map<String, dynamic>>(json['gold'])!),
        silver: Silver.fromJson(asT<Map<String, dynamic>>(json['silver'])!),
      );

  final Crystal crystal;
  final Gold gold;
  final Silver silver;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'crystal': crystal,
        'gold': gold,
        'silver': silver,
      };
}

class Crystal {
  const Crystal({
    this.backDefault,
    this.backShiny,
    this.backShinyTransparent,
    this.backTransparent,
    this.frontDefault,
    this.frontShiny,
    this.frontShinyTransparent,
    this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: asT<Object?>(json['back_default']),
        backShiny: asT<Object?>(json['back_shiny']),
        backShinyTransparent: asT<Object?>(json['back_shiny_transparent']),
        backTransparent: asT<Object?>(json['back_transparent']),
        frontDefault: asT<Object?>(json['front_default']),
        frontShiny: asT<Object?>(json['front_shiny']),
        frontShinyTransparent: asT<Object?>(json['front_shiny_transparent']),
        frontTransparent: asT<Object?>(json['front_transparent']),
      );

  final Object? backDefault;
  final Object? backShiny;
  final Object? backShinyTransparent;
  final Object? backTransparent;
  final Object? frontDefault;
  final Object? frontShiny;
  final Object? frontShinyTransparent;
  final Object? frontTransparent;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_shiny': backShiny,
        'back_shiny_transparent': backShinyTransparent,
        'back_transparent': backTransparent,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_shiny_transparent': frontShinyTransparent,
        'front_transparent': frontTransparent,
      };
}

class Gold {
  const Gold({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: asT<Object?>(json['back_default']),
        backShiny: asT<Object?>(json['back_shiny']),
        frontDefault: asT<Object?>(json['front_default']),
        frontShiny: asT<Object?>(json['front_shiny']),
        frontTransparent: asT<Object?>(json['front_transparent']),
      );

  final Object? backDefault;
  final Object? backShiny;
  final Object? frontDefault;
  final Object? frontShiny;
  final Object? frontTransparent;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_transparent': frontTransparent,
      };
}

class Silver {
  const Silver({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
    this.frontTransparent,
  });

  factory Silver.fromJson(Map<String, dynamic> json) => Silver(
        backDefault: asT<Object?>(json['back_default']),
        backShiny: asT<Object?>(json['back_shiny']),
        frontDefault: asT<Object?>(json['front_default']),
        frontShiny: asT<Object?>(json['front_shiny']),
        frontTransparent: asT<Object?>(json['front_transparent']),
      );

  final Object? backDefault;
  final Object? backShiny;
  final Object? frontDefault;
  final Object? frontShiny;
  final Object? frontTransparent;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
        'front_transparent': frontTransparent,
      };
}

class GenerationIii {
  const GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromJson(asT<Map<String, dynamic>>(json['emerald'])!),
        fireredLeafgreen:
            FireredLeafgreen.fromJson(asT<Map<String, dynamic>>(json['firered-leafgreen'])!),
        rubySapphire: RubySapphire.fromJson(asT<Map<String, dynamic>>(json['ruby-sapphire'])!),
      );

  final Emerald emerald;
  final FireredLeafgreen fireredLeafgreen;
  final RubySapphire rubySapphire;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'emerald': emerald,
        'firered-leafgreen': fireredLeafgreen,
        'ruby-sapphire': rubySapphire,
      };
}

class Emerald {
  const Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: asT<Object?>(json['front_default']),
        frontShiny: asT<Object?>(json['front_shiny']),
      );

  final Object? frontDefault;
  final Object? frontShiny;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}

class FireredLeafgreen {
  const FireredLeafgreen({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory FireredLeafgreen.fromJson(Map<String, dynamic> json) => FireredLeafgreen(
        backDefault: asT<Object?>(json['back_default']),
        backShiny: asT<Object?>(json['back_shiny']),
        frontDefault: asT<Object?>(json['front_default']),
        frontShiny: asT<Object?>(json['front_shiny']),
      );

  final Object? backDefault;
  final Object? backShiny;
  final Object? frontDefault;
  final Object? frontShiny;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}

class RubySapphire {
  const RubySapphire({
    this.backDefault,
    this.backShiny,
    this.frontDefault,
    this.frontShiny,
  });

  factory RubySapphire.fromJson(Map<String, dynamic> json) => RubySapphire(
        backDefault: asT<Object?>(json['back_default']),
        backShiny: asT<Object?>(json['back_shiny']),
        frontDefault: asT<Object?>(json['front_default']),
        frontShiny: asT<Object?>(json['front_shiny']),
      );

  final Object? backDefault;
  final Object? backShiny;
  final Object? frontDefault;
  final Object? frontShiny;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'back_default': backDefault,
        'back_shiny': backShiny,
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}

class GenerationIv {
  const GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: DiamondPearl.fromJson(asT<Map<String, dynamic>>(json['diamond-pearl'])!),
        heartgoldSoulsilver:
            HeartgoldSoulsilver.fromJson(asT<Map<String, dynamic>>(json['heartgold-soulsilver'])!),
        platinum: Platinum.fromJson(asT<Map<String, dynamic>>(json['platinum'])!),
      );

  final DiamondPearl diamondPearl;
  final HeartgoldSoulsilver heartgoldSoulsilver;
  final Platinum platinum;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'diamond-pearl': diamondPearl,
        'heartgold-soulsilver': heartgoldSoulsilver,
        'platinum': platinum,
      };
}

class DiamondPearl {
  const DiamondPearl({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory DiamondPearl.fromJson(Map<String, dynamic> json) => DiamondPearl(
        backDefault: asT<Object?>(json['back_default']),
        backFemale: asT<Object?>(json['back_female']),
        backShiny: asT<Object?>(json['back_shiny']),
        backShinyFemale: asT<Object?>(json['back_shiny_female']),
        frontDefault: asT<Object?>(json['front_default']),
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<Object?>(json['front_shiny']),
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final Object? backDefault;
  final Object? backFemale;
  final Object? backShiny;
  final Object? backShinyFemale;
  final Object? frontDefault;
  final Object? frontFemale;
  final Object? frontShiny;
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

class HeartgoldSoulsilver {
  const HeartgoldSoulsilver({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory HeartgoldSoulsilver.fromJson(Map<String, dynamic> json) => HeartgoldSoulsilver(
        backDefault: asT<Object?>(json['back_default']),
        backFemale: asT<Object?>(json['back_female']),
        backShiny: asT<Object?>(json['back_shiny']),
        backShinyFemale: asT<Object?>(json['back_shiny_female']),
        frontDefault: asT<Object?>(json['front_default']),
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<Object?>(json['front_shiny']),
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final Object? backDefault;
  final Object? backFemale;
  final Object? backShiny;
  final Object? backShinyFemale;
  final Object? frontDefault;
  final Object? frontFemale;
  final Object? frontShiny;
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

class Platinum {
  const Platinum({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Platinum.fromJson(Map<String, dynamic> json) => Platinum(
        backDefault: asT<Object?>(json['back_default']),
        backFemale: asT<Object?>(json['back_female']),
        backShiny: asT<Object?>(json['back_shiny']),
        backShinyFemale: asT<Object?>(json['back_shiny_female']),
        frontDefault: asT<Object?>(json['front_default']),
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<Object?>(json['front_shiny']),
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final Object? backDefault;
  final Object? backFemale;
  final Object? backShiny;
  final Object? backShinyFemale;
  final Object? frontDefault;
  final Object? frontFemale;
  final Object? frontShiny;
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

class GenerationV {
  const GenerationV({
    required this.blackWhite,
  });

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: BlackWhite.fromJson(asT<Map<String, dynamic>>(json['black-white'])!),
      );

  final BlackWhite blackWhite;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'black-white': blackWhite,
      };
}

class BlackWhite {
  const BlackWhite({
    required this.animated,
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory BlackWhite.fromJson(Map<String, dynamic> json) => BlackWhite(
        animated: Animated.fromJson(asT<Map<String, dynamic>>(json['animated'])!),
        backDefault: asT<String>(json['back_default'])!,
        backFemale: asT<Object?>(json['back_female']),
        backShiny: asT<String>(json['back_shiny'])!,
        backShinyFemale: asT<Object?>(json['back_shiny_female']),
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final Animated animated;
  final String backDefault;
  final Object? backFemale;
  final String backShiny;
  final Object? backShinyFemale;
  final String frontDefault;
  final Object? frontFemale;
  final String frontShiny;
  final Object? frontShinyFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'animated': animated,
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

class Animated {
  const Animated({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Animated.fromJson(Map<String, dynamic> json) => Animated(
        backDefault: asT<String>(json['back_default'])!,
        backFemale: asT<Object?>(json['back_female']),
        backShiny: asT<String>(json['back_shiny'])!,
        backShinyFemale: asT<Object?>(json['back_shiny_female']),
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final String backDefault;
  final Object? backFemale;
  final String backShiny;
  final Object? backShinyFemale;
  final String frontDefault;
  final Object? frontFemale;
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

class GenerationVi {
  const GenerationVi({
    required this.omegarubyAlphasapphire,
    required this.xY,
  });

  factory GenerationVi.fromJson(Map<String, dynamic> json) => GenerationVi(
        omegarubyAlphasapphire: OmegarubyAlphasapphire.fromJson(
            asT<Map<String, dynamic>>(json['omegaruby-alphasapphire'])!),
        xY: XY.fromJson(asT<Map<String, dynamic>>(json['x-y'])!),
      );

  final OmegarubyAlphasapphire omegarubyAlphasapphire;
  final XY xY;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'omegaruby-alphasapphire': omegarubyAlphasapphire,
        'x-y': xY,
      };
}

class OmegarubyAlphasapphire {
  const OmegarubyAlphasapphire({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory OmegarubyAlphasapphire.fromJson(Map<String, dynamic> json) => OmegarubyAlphasapphire(
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final String frontDefault;
  final Object? frontFemale;
  final String frontShiny;
  final Object? frontShinyFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class XY {
  const XY({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory XY.fromJson(Map<String, dynamic> json) => XY(
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final String frontDefault;
  final Object? frontFemale;
  final String frontShiny;
  final Object? frontShinyFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class GenerationVii {
  const GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: IconsGenVII.fromJson(asT<Map<String, dynamic>>(json['icons'])!),
        ultraSunUltraMoon:
            UltraSunUltraMoon.fromJson(asT<Map<String, dynamic>>(json['ultra-sun-ultra-moon'])!),
      );

  final IconsGenVII icons;
  final UltraSunUltraMoon ultraSunUltraMoon;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'icons': icons,
        'ultra-sun-ultra-moon': ultraSunUltraMoon,
      };
}

class IconsGenVII {
  const IconsGenVII({
    required this.frontDefault,
    this.frontFemale,
  });

  factory IconsGenVII.fromJson(Map<String, dynamic> json) => IconsGenVII(
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
      );

  final String frontDefault;
  final Object? frontFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_female': frontFemale,
      };
}

class UltraSunUltraMoon {
  const UltraSunUltraMoon({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory UltraSunUltraMoon.fromJson(Map<String, dynamic> json) => UltraSunUltraMoon(
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
        frontShiny: asT<String>(json['front_shiny'])!,
        frontShinyFemale: asT<Object?>(json['front_shiny_female']),
      );

  final String frontDefault;
  final Object? frontFemale;
  final String frontShiny;
  final Object? frontShinyFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}

class GenerationViii {
  const GenerationViii({
    required this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: IconsGenVIII.fromJson(asT<Map<String, dynamic>>(json['icons'])!),
      );

  final IconsGenVIII icons;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'icons': icons,
      };
}

class IconsGenVIII {
  const IconsGenVIII({
    required this.frontDefault,
    this.frontFemale,
  });

  factory IconsGenVIII.fromJson(Map<String, dynamic> json) => IconsGenVIII(
        frontDefault: asT<String>(json['front_default'])!,
        frontFemale: asT<Object?>(json['front_female']),
      );

  final String frontDefault;
  final Object? frontFemale;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'front_default': frontDefault,
        'front_female': frontFemale,
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
