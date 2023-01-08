import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/palette.dart';
import 'package:pokedex/features/pokedex/presentation/controller/pokehomecontroller.dart';

PreferredSizeWidget appbarHome(PokeHomeController _) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Palette.background,
      title: const Text('Pokedex'),
      actions: [
        IconButton(
            onPressed: () {
              _.toggleMenu();
            },
            icon: const Icon(CommunityMaterialIcons.filter_menu))
      ],
    ),
  );
}
