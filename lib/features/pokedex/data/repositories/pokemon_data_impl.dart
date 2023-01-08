import 'package:pokedex/core/failure_success/exceptions.dart';
import 'package:pokedex/core/services/service_locator.dart';
import 'package:pokedex/features/pokedex/data/datasources/pokemon_remote.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';
import 'package:pokedex/core/failure_success/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_list.dart' as list;
import 'package:pokedex/features/pokedex/domain/entities/pokemon_move.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_species.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/features/pokedex/domain/repositories/pokemon_data_contract.dart';

class PokemonDataImpl implements PokemonDataRepo {
  final PokemonDataFromRemoteDS _remoteDS = sl<PokemonDataFromRemoteDS>();
  @override
  Future<Either<Failure, PokemonData>> getPokemonData({required String name}) async {
    try {
      return Right(await _remoteDS.getPokemonData(name: name));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, PokemonSpecies>> getPokemonSpecies({required String name}) async {
    try {
      return Right(await _remoteDS.getPokemonSpecies(name: name));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, PokemonMove>> getPokemonMove({required String moveID}) async {
    try {
      return Right(await _remoteDS.getPokemonMove(moveID: moveID));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, list.PokemonList>> getPokemonList(
      {required String offset, required String limit}) async {
    try {
      return Right(await _remoteDS.getPokemonList(offset: offset, limit: limit));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, PokemonTypeData>> getPokemonListType({required int id}) async {
    try {
      return Right(await _remoteDS.getPokemonListType(id: id));
    } on FetchException catch (e) {
      return Left(FetchFailure(message: e.message));
    }
  }
}
