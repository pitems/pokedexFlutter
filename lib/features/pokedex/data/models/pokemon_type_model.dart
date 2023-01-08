import 'package:pokedex/features/pokedex/domain/entities/pokemon_type.dart';

class PokemonTypeModel extends PokemonTypeData {
  PokemonTypeModel(
      {required DamageRelations damageRelations,
      required List<GameIndices> gameIndices,
      required GenerationII generation,
      required int id,
      required List<Moves> moves,
      required String name,
      required List<Names> names,
      required List<PokemonList> pokemon})
      : super(
            damageRelations: damageRelations,
            gameIndices: gameIndices,
            generation: generation,
            id: id,
            moves: moves,
            name: name,
            names: names,
            pokemon: pokemon);

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
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

    final List<Names>? names = json['names'] is List ? <Names>[] : null;
    if (names != null) {
      for (final dynamic item in json['names']!) {
        if (item != null) {
          tryCatch(() {
            names.add(Names.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }

    final List<PokemonList>? pokemon = json['pokemon'] is List ? <PokemonList>[] : null;
    if (pokemon != null) {
      for (final dynamic item in json['pokemon']!) {
        if (item != null) {
          tryCatch(() {
            pokemon.add(PokemonList.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return PokemonTypeModel(
      damageRelations:
          DamageRelations.fromJson(asT<Map<String, dynamic>>(json['damage_relations'])!),
      gameIndices: gameIndices!,
      generation: GenerationII.fromJson(asT<Map<String, dynamic>>(json['generation'])!),
      id: asT<int>(json['id'])!,
      moves: moves!,
      name: asT<String>(json['name'])!,
      names: names!,
      pokemon: pokemon!,
    );
  }
}
