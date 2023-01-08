import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

// Calculate dominant color from ImageProvider
Future<Color> getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor!.color;
}

Future<Color> getImagePaletteDark(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
  return paletteGenerator.darkMutedColor!.color;
}
