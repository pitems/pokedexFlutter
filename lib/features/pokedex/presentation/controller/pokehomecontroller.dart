import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/core/failure_success/failure.dart';
import 'package:pokedex/core/routes/app_routes.dart';
import 'package:pokedex/core/services/service_locator.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_list.dart' as listEntity;
import 'package:pokedex/features/pokedex/domain/entities/pokemon_type.dart';
import 'package:pokedex/features/pokedex/domain/usecases/pokemon_data_usecases.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class PokeHomeController extends GetxController {
  //!Objects
  Rx<listEntity.PokemonList> list =
      const listEntity.PokemonList(count: 0, next: '', results: []).obs;
  //!Booleans
  RxBool loading = true.obs;
  RxBool errorLoading = false.obs;
  RxBool isLastPage = false.obs;
  RxBool sideMenuOpen = false.obs;
  bool isFiltered = false;
  bool loadingData = false;
  bool reachedMax = false;
  //!Controllers
  late ScrollController scroll;
  //!Keys
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  //!Integers
  int limit = 20;
  int offset = 0;
  int typeId = 0;
  //!Strings
  String url = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/';
  //! UseCases
  final PokemonDataUseCases _useCases = sl<PokemonDataUseCases>();

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    initAsync();

    super.onInit();
  }

  initAsync() async {
    await getMainData();
    scroll = ScrollController()
      ..addListener(() {
        loadMore();
      });
    loading.value = false;
  }

  getMainData() async {
    loading.value = true;
    final Either<Failure, listEntity.PokemonList> fetchResult =
        await _useCases.getPokemonList(offset: offset.toString(), limit: limit.toString());
    fetchResult.fold((l) {
      loading.value = false;
      errorLoading.value = true;
    }, (r) {
      loading.value = false;
      list.value = r;
      list.refresh();
    });
  }

  loadMore({bool? noOffset = false}) async {
    var position = scroll.offset / scroll.position.maxScrollExtent;
    if (loadingData == false && position >= 0.8 && reachedMax != true && isFiltered != true) {
      loadingData = true;
      if (noOffset != true) {
        if (list.value.count < offset + limit) {
          int reach = list.value.count - offset;
          offset = offset = reach;
          reachedMax = true;
        } else {
          offset = offset + limit;
        }
      }

      try {
        final Either<Failure, listEntity.PokemonList> fetchResult =
            await _useCases.getPokemonList(offset: offset.toString(), limit: limit.toString());
        fetchResult.fold((l) {
          loadMore(noOffset: true);
        }, (r) {
          for (var element in r.results) {
            list.value.results.add(element);
          }
          list.refresh();
        });
      } catch (e) {
        print(e);
      }
      loadingData = false;
    }
  }

  filterData(int id) async {
    loading.value = true;
    isFiltered = true;
    typeId = id;
    final Either<Failure, PokemonTypeData> fetchResult = await _useCases.getPokemonByType(id: id);
    fetchResult.fold((l) {
      loading.value = false;
      errorLoading.value = true;
    }, (r) {
      list.value = listEntity.PokemonList(count: r.pokemon.length, next: 'poke', results: []);
      for (var element in r.pokemon) {
        list.value.results.add(element.pokemon);
      }
      list.refresh();
      loading.value = false;
      scroll.jumpTo(0);
    });
  }

  resetData() async {
    isFiltered = false;
    offset = 0;
    scroll.jumpTo(0);
    await getMainData();
  }

  goToPokeDataCall(int index) {
    Get.toNamed(Routes.DETAIL, arguments: {
      "name": list.value.results[index].name,
      "id": getPokemonId(list.value.results[index].url)
    });
  }

  getPokemonId(String pokeUrl) {
    var sa = pokeUrl.split('pokemon/');
    return sa[1].replaceAll('/', '');
  }

  toggleMenu() {
    final state = sideMenuKey.currentState;
    if (state!.isOpened) {
      state.closeSideMenu();
      sideMenuOpen.value = false;
    } else {
      state.openSideMenu();
      sideMenuOpen.value = true;
    }
  }
}
