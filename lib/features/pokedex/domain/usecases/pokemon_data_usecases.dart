import 'package:dartz/dartz.dart';
import 'package:pokedex/core/failure_success/failure.dart';
import 'package:pokedex/core/services/service_locator.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_list.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_move.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_species.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_type.dart' as type;
import 'package:pokedex/features/pokedex/domain/repositories/pokemon_data_contract.dart';

class PokemonDataUseCases {
  final PokemonDataRepo _repo = sl<PokemonDataRepo>();

  Future<Either<Failure, PokemonData>> getPokemonData({required String name}) {
    return _repo.getPokemonData(name: name);
  }

  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies({required String name}) {
    return _repo.getPokemonSpecies(name: name);
  }

  Future<Either<Failure, PokemonMove>> getPokemonMove({required String moveID}) {
    return _repo.getPokemonMove(moveID: moveID);
  }

  Future<Either<Failure, PokemonList>> getPokemonList(
      {required String offset, required String limit}) {
    return _repo.getPokemonList(offset: offset, limit: limit);
  }

  Future<Either<Failure, type.PokemonTypeData>> getPokemonByType({required int id}) {
    return _repo.getPokemonListType(id: id);
  }
}
