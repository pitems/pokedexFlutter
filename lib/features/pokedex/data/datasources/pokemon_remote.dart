import 'package:dio/dio.dart';
import 'package:pokedex/core/failure_success/exceptions.dart';
import 'package:pokedex/core/services/network_service.dart';
import 'package:pokedex/core/services/service_locator.dart';
import 'package:pokedex/features/pokedex/data/models/pokemon_data_model.dart';
import 'package:pokedex/features/pokedex/data/models/pokemon_list_model.dart';
import 'package:pokedex/features/pokedex/data/models/pokemon_move_model.dart';
import 'package:pokedex/features/pokedex/data/models/pokemon_species_model.dart';
import 'package:pokedex/features/pokedex/data/models/pokemon_type_model.dart';

abstract class PokemonDataFromRemoteDS {
  Future<PokemonDataModel> getPokemonData({required String name});
  Future<PokemonSpeciesModel> getPokemonSpecies({required String name});
  Future<PokemonMoveModel> getPokemonMove({required String moveID});
  Future<PokemonListModel> getPokemonList({required String offset, required String limit});
  Future<PokemonTypeModel> getPokemonListType({required int id});
}

class PokemonDataRemoteImpl implements PokemonDataFromRemoteDS {
  final ApiService _apiService = sl<ApiService>();
  Response noInternet = Response(requestOptions: RequestOptions(path: '', data: {'Error': 123}));
  @override
  Future<PokemonDataModel> getPokemonData({required String name}) async {
    try {
      Response response = await _apiService.getPokemonData(name: name);
      PokemonDataModel execution = PokemonDataModel.fromJson(response.data);
      return execution;
    } catch (e) {
      print(e);
      throw const FetchException(message: 'Failed to get Data');
    }
  }

  @override
  Future<PokemonSpeciesModel> getPokemonSpecies({required String name}) async {
    try {
      Response response = await _apiService.getPokemonSpecies(name: name);
      PokemonSpeciesModel execution = PokemonSpeciesModel.fromJson(response.data);
      return execution;
    } catch (e) {
      print(e);
      throw const FetchException(message: 'Failed to get Data');
    }
  }

  @override
  Future<PokemonMoveModel> getPokemonMove({required String moveID}) async {
    try {
      Response response = await _apiService.getPokemonMove(moveID: moveID);
      PokemonMoveModel execution = PokemonMoveModel.fromJson(response.data);
      return execution;
    } catch (e) {
      throw const FetchException(message: 'Failed to get Data');
    }
  }

  @override
  Future<PokemonListModel> getPokemonList({required String offset, required String limit}) async {
    try {
      Response response = await _apiService.getPokemonList(offset: offset, limit: limit);
      PokemonListModel execution = PokemonListModel.fromJson(response.data);
      return execution;
    } catch (e) {
      throw const FetchException(message: 'Failed to get Data');
    }
  }

  @override
  Future<PokemonTypeModel> getPokemonListType({required int id}) async {
    try {
      Response response = await _apiService.getPokemonListType(id: id);
      PokemonTypeModel execution = PokemonTypeModel.fromJson(response.data);
      return execution;
    } catch (e) {
      throw const FetchException(message: 'Failed to get Data');
    }
  }
}
