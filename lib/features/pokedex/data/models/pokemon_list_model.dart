import 'package:pokedex/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_list.dart';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class PokemonListModel extends PokemonList {
  PokemonListModel({
    required int count,
    required String next,
    required List<Pokemons> results,
  }) : super(count: count, next: next, results: results);

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    final List<Pokemons>? results = json['results'] is List ? <Pokemons>[] : null;
    if (results != null) {
      for (final dynamic item in json['results']!) {
        if (item != null) {
          tryCatch(() {
            results.add(Pokemons.fromJson(asT<Map<String, dynamic>>(item)!));
          });
        }
      }
    }
    return PokemonListModel(
      count: asT<int>(json['count'])!,
      next: asT<String>(json['next'])!,
      results: results!,
    );
  }
}
