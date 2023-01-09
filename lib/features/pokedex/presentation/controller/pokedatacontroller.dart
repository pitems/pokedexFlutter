import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/core/failure_success/failure.dart';
import 'package:pokedex/core/global_functions/palette_generator.dart';
import 'package:pokedex/core/services/service_locator.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_move.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_species.dart' hide Color;
import 'package:pokedex/features/pokedex/domain/usecases/pokemon_data_usecases.dart';

class PokeDataController extends GetxController {
  //Variables
  //!Bool
  RxBool loading = true.obs;
  RxBool errorLoading = false.obs;
  RxBool visibility = true.obs;
  RxBool loadingMove = false.obs;
  //!Arguments
  var data;
  //!Strings
  RxString pokeName = ''.obs;
  RxString pokeDescription = ''.obs;
  //!UseCases
  final PokemonDataUseCases _useCases = sl<PokemonDataUseCases>();
  //!Pokemon Data
  late PokemonData pokeData;
  late PokemonSpecies pokeSpecies;
  late PokemonMove pokeMove;
  //!Palette Color
  late Color mainColor;
  //! Total Stats
  RxInt totalStat = 0.obs;
  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    initAsync();

    super.onInit();
  }

  initAsync() async {
    data = Get.arguments;
    pokeName.value = data['name'];
    callPokeData();
  }

  callPokeData() async {
    //Usecase for callin poke data later on

    final Either<Failure, PokemonData> fetchResult =
        await _useCases.getPokemonData(name: pokeName.value);
    fetchResult.fold((l) {
      loading.value = false;
      errorLoading.value = true;
    }, (r) async {
      pokeData = r;
      mainColor = await getImagePalette(NetworkImage(pokeData.sprites.frontDefault));
      for (var element in pokeData.stats) {
        totalStat + element.baseStat;
      }
      await callPokemonSpecies();
      loading.value = false;
    });
  }

  callPokemonSpecies() async {
    final Either<Failure, PokemonSpecies> fetchResult =
        await _useCases.getPokemonSpecies(name: pokeName.value);
    fetchResult.fold((l) {
      loading.value = false;
      errorLoading.value = true;
    }, (r) {
      pokeSpecies = r;
      pokeDescription.value = pokeSpecies.flavorTextEntries[0].flavorText.replaceAll('\n', '');
    });
  }

  callPokemonMove({required String moveID}) async {
    loadingMove.value = true;
    final Either<Failure, PokemonMove> fetchResult = await _useCases.getPokemonMove(moveID: moveID);
    fetchResult.fold((l) {
      loadingMove.value = false;
      Get.back();
    }, (r) {
      pokeMove = r;
      loadingMove.value = false;
    });
  }
}
