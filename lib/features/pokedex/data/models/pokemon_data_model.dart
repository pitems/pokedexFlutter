import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';

class PokemonDataModel extends PokemonData {
  PokemonDataModel(
      {required List<Abilities> abilities,
      required int baseExperience,
      required List<Forms> forms,
      required List<GameIndices> gameIndices,
      required int height,
      required List<Object> heldItems,
      required int id,
      required bool isDefault,
      required String locationAreaEncounters,
      required List<Moves> moves,
      required String name,
      required int order,
      required List<Object> pastTypes,
      required Species species,
      required Sprites sprites,
      required List<Stats> stats,
      required List<Types> types,
      required int weight})
      : super(
            abilities: abilities,
            baseExperience: baseExperience,
            forms: forms,
            gameIndices: gameIndices,
            height: height,
            heldItems: heldItems,
            id: id,
            isDefault: isDefault,
            locationAreaEncounters: locationAreaEncounters,
            moves: moves,
            name: name,
            order: order,
            pastTypes: pastTypes,
            species: species,
            sprites: sprites,
            stats: stats,
            types: types,
            weight: weight);

  factory PokemonDataModel.fromJson(Map<String, dynamic> json) {
    final List<Abilities>? abilities = json['abilities'] is List ? <Abilities>[] : null;
    if (abilities != null) {
      for (final dynamic item in json['abilities']!) {
        if (item != null) {
          tryCatch(() {
            abilities.add(Abilities.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Forms>? forms = json['forms'] is List ? <Forms>[] : null;
    if (forms != null) {
      for (final dynamic item in json['forms']!) {
        if (item != null) {
          tryCatch(() {
            forms.add(Forms.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<GameIndices>? gameIndices = json['game_indices'] is List ? <GameIndices>[] : null;
    if (gameIndices != null) {
      for (final dynamic item in json['game_indices']!) {
        if (item != null) {
          tryCatch(() {
            gameIndices.add(GameIndices.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Object>? heldItems = json['held_items'] is List ? <Object>[] : null;
    if (heldItems != null) {
      for (final dynamic item in json['held_items']!) {
        if (item != null) {
          tryCatch(() {
            heldItems.add(asT<Object>(item)!);
          });
        }
      }
    }

    final List<Moves>? moves = json['moves'] is List ? <Moves>[] : null;
    if (moves != null) {
      for (final dynamic item in json['moves']!) {
        if (item != null) {
          tryCatch(() {
            moves.add(Moves.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Object>? pastTypes = json['past_types'] is List ? <Object>[] : null;
    if (pastTypes != null) {
      for (final dynamic item in json['past_types']!) {
        if (item != null) {
          tryCatch(() {
            pastTypes.add(asT<Object>(item)!);
          });
        }
      }
    }

    final List<Stats>? stats = json['stats'] is List ? <Stats>[] : null;
    if (stats != null) {
      for (final dynamic item in json['stats']!) {
        if (item != null) {
          tryCatch(() {
            stats.add(Stats.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<Types>? types = json['types'] is List ? <Types>[] : null;
    if (types != null) {
      for (final dynamic item in json['types']!) {
        if (item != null) {
          tryCatch(() {
            types.add(Types.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return PokemonDataModel(
      abilities: abilities!,
      baseExperience: asT<int>(json['base_experience'])!,
      forms: forms!,
      gameIndices: gameIndices!,
      height: asT<int>(json['height'])!,
      heldItems: heldItems!,
      id: asT<int>(json['id'])!,
      isDefault: asT<bool>(json['is_default'])!,
      locationAreaEncounters: asT<String>(json['location_area_encounters'])!,
      moves: moves!,
      name: asT<String>(json['name'])!,
      order: asT<int>(json['order'])!,
      pastTypes: pastTypes!,
      species: Species.fromJson(asT<Map<String, dynamic>>(json['species'])!),
      sprites: Sprites.fromJson(asT<Map<String, dynamic>>(json['sprites'])!),
      stats: stats!,
      types: types!,
      weight: asT<int>(json['weight'])!,
    );
  }
}
