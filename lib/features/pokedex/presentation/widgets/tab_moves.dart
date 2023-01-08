import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/features/pokedex/domain/entities/pokemon_data.dart';
import 'package:pokedex/features/pokedex/presentation/controller/pokedatacontroller.dart';
import 'package:pokedex/features/pokedex/presentation/widgets/dialog_page.dart';

Widget pokemoves(PokemonData pokeData, PokeDataController _) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 35),
    child: ListView.builder(
      shrinkWrap: true,
      itemCount: pokeData.moves.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
                onTap: () async {
                  if (_.loadingMove.value == false) {
                    _.callPokemonMove(
                        moveID:
                            pokeData.moves[index].move.url.split('move/')[1].replaceAll('/', ''));
                    Get.dialog(
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: DialogMove(),
                      ),
                    );
                  }
                },
                title: Text(
                    StringUtils.capitalize(pokeData.moves[index].move.name.replaceAll('-', ' ')))),
            const Divider(
              thickness: 2,
            )
          ],
        );
      },
    ),
  );
}
