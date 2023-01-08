import 'package:dio/dio.dart';
import 'package:pokedex/core/services/service_locator.dart';

abstract class ApiService {
  Future getPokemonList({required String offset, required String limit});
  Future getPokemonData({required String name});
  Future getPokemonSpecies({required String name});
  Future getPokemonMove({required String moveID});
  Future getPokemonListType({required int id});
}

class ApiServiceImpl implements ApiService {
  final Dio _dio = sl<Dio>();
  String base = 'https://pokeapi.co/api/v2/';
  @override
  Future getPokemonList({required String offset, required String limit}) async {
    Response response = await _dio.get('${base}pokemon?offset=$offset&limit=$limit');
    return response;
  }

  @override
  Future getPokemonData({required String name}) async {
    Response response = await _dio.get('${base}pokemon/$name');
    return response;
  }

  @override
  Future getPokemonSpecies({required String name}) async {
    Response response = await _dio.get('${base}pokemon-species/$name');
    return response;
  }

  @override
  Future getPokemonMove({required String moveID}) async {
    Response response = await _dio.get('${base}move/$moveID');
    return response;
  }

  @override
  Future getPokemonListType({required int id}) async {
    Response response = await _dio.get('${base}type/$id');
    return response;
  }
}
