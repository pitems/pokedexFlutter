import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';

Widget spriteTab(PokemonData pokeData) {
  List<Widget> images = [
    Image.network(pokeData.sprites.frontDefault, fit: BoxFit.fitWidth),
    Image.network(pokeData.sprites.backDefault, fit: BoxFit.fitWidth),
    Image.network(pokeData.sprites.frontShiny, fit: BoxFit.fitWidth),
    Image.network(pokeData.sprites.backShiny!, fit: BoxFit.fitWidth)
  ];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [CarouselSlider(items: images, options: CarouselOptions())],
  );
}
