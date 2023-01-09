import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';

import '../../../../core/constants/app_assets.dart';

Widget spriteTab(PokemonData pokeData) {
  List<Widget> images = [
    Image.network(pokeData.sprites.frontDefault, fit: BoxFit.fitWidth),
    networkSprite(pokeData.sprites.backDefault),
    Image.network(pokeData.sprites.frontShiny, fit: BoxFit.fitWidth),
    networkSprite(pokeData.sprites.backShiny)
  ];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [CarouselSlider(items: images, options: CarouselOptions())],
  );
}

Widget networkSprite(String? url) {
  return url == null
      ? Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: const AssetImage(
              '${AppAssets.root}pokeball.png',
            ),
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
          )),
          child: const Center(
              child: Text(
            'Sin Imagen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )))
      : CachedNetworkImage(
          fit: BoxFit.fill,
          fadeInCurve: Curves.easeInOut,
          placeholder: (context, url) {
            return Image.asset(
              '${AppAssets.root}pokeball.png',
              scale: 6,
            );
          },
          errorWidget: (context, url, error) {
            return Image.asset(
              '${AppAssets.root}pokeball.png',
              scale: 6,
            );
          },
          imageUrl: url);
}
