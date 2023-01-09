import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_species.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget details(PokemonData pokeData, PokemonSpecies pokeSpecies) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pokeSpecies.genera[7].genus,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  pokeSpecies.flavorTextEntries[0].flavorText
                      .replaceAll('\n', ' ')
                      .replaceAll('\f', ' '),
                  // softWrap: true,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.black, fontSize: 19),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    '${(pokeData.weight / 10)} Kg.',
                    style: const TextStyle(
                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text('Weight')
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                children: [
                  Text(
                    '${(pokeData.height / 10)} M',
                    style: const TextStyle(
                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text('Height')
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Growth Rate: ${pokeSpecies.growthRate.name}',
                  style: const TextStyle(fontSize: 20))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    ),
  );
}
