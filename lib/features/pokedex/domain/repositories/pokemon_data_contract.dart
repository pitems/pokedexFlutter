import 'package:dartz/dartz.dart';
import 'package:pokedex/core/failure_success/failure.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_list.dart' as list;
import 'package:pokedex/features/pokedex/domain/entities/pokemon_move.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_species.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_type.dart';

abstract class PokemonDataRepo {
  Future<Either<Failure, PokemonData>> getPokemonData({required String name});
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies({required String name});
  Future<Either<Failure, PokemonMove>> getPokemonMove({required String moveID});
  Future<Either<Failure, list.PokemonList>> getPokemonList(
      {required String offset, required String limit});
  Future<Either<Failure, PokemonTypeData>> getPokemonListType({required int id});
}
