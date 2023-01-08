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

class PokemonList {
  const PokemonList({
    required this.count,
    required this.next,
    required this.results,
  });

  final int count;
  final String next;
  final List<Pokemons> results;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': count,
        'next': next,
        'results': results,
      };
}

// class Pokemons {
//   const Pokemons({
//     required this.name,
//     required this.url,
//   });

//   factory Pokemons.fromJson(Map<String, dynamic> json) => Pokemons(
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
