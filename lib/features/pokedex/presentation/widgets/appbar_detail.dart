import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/app_assets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

PreferredSizeWidget appbarDetail(Color color, String id) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: color,
      title: const Text('Pokedex'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Image.asset(
                "${AppAssets.root}pokeball.png",
                scale: 8,
              ),
              SizedBox(width: 2.w),
              Text(
                "# $id",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
        )
      ],
    ),
  );
}
