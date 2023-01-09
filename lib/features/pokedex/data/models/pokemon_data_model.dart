import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';

class PokemonDataModel extends PokemonData {
  PokemonDataModel(
      {required List<Abilities> abilities,
      required int baseExperience,
      required int height,
      required int id,
      required bool isDefault,
      required String locationAreaEncounters,
      required List<Moves> moves,
      required String name,
      required int order,
      required Species species,
      required Sprites sprites,
      required List<Stats> stats,
      required List<Types> types,
      required int weight})
      : super(
            abilities: abilities,
            baseExperience: baseExperience,
            height: height,
            id: id,
            isDefault: isDefault,
            locationAreaEncounters: locationAreaEncounters,
            moves: moves,
            name: name,
            order: order,
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
      height: asT<int>(json['height'])!,
      id: asT<int>(json['id'])!,
      isDefault: asT<bool>(json['is_default'])!,
      locationAreaEncounters: asT<String>(json['location_area_encounters'])!,
      moves: moves!,
      name: asT<String>(json['name'])!,
      order: asT<int>(json['order'])!,
      species: Species.fromJson(asT<Map<String, dynamic>>(json['species'])!),
      sprites: Sprites.fromJson(asT<Map<String, dynamic>>(json['sprites'])!),
      stats: stats!,
      types: types!,
      weight: asT<int>(json['weight'])!,
    );
  }
}
