import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/core/services/network_service.dart';
import 'package:pokedex/features/pokedex/data/datasources/pokemon_remote.dart';
import 'package:pokedex/features/pokedex/data/repositories/pokemon_data_impl.dart';
import 'package:pokedex/features/pokedex/domain/repositories/pokemon_data_contract.dart';
import 'package:pokedex/features/pokedex/domain/usecases/pokemon_data_usecases.dart';
import 'package:pokedex/features/pokedex/presentation/controller/pokedatacontroller.dart';

final GetIt sl = GetIt.instance;

void setUpServices() {
  //Shared Preferences
  // sl.registerSingleton<Storage>(Storage());
  //Registering the APi Serivice across the app
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiService>(ApiServiceImpl());
  //Repo Implementation Remote
  sl.registerSingleton<PokemonDataFromRemoteDS>(PokemonDataRemoteImpl());
  //Repos
  sl.registerSingleton<PokemonDataRepo>(PokemonDataImpl());
  //Use Cases
  sl.registerSingleton<PokemonDataUseCases>(PokemonDataUseCases());

  //Controller
  sl.registerSingleton<PokeDataController>(PokeDataController());
}
