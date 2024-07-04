import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteControllerHotAndNew extends GetxController {
  var palettes = <String, List<Color>>{}.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> generatePalette(String imagePath) async {
    if (palettes.containsKey(imagePath)) {
      // Palette already generated for this image
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    try {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(imagePath),
        maximumColorCount: 20,
      );

      final List<Color> sideColors = [];
      if (paletteGenerator.paletteColors.isNotEmpty) {
        final List<PaletteColor> paletteColors = paletteGenerator.paletteColors;
        final int colorCount = paletteColors.length;

        sideColors.addAll([
          paletteColors[0].color.withOpacity(1.0), // Top color from image
          paletteColors[colorCount - 1]
              .color
              .withOpacity(1.0), // Bottom color from image
        ]);
      }

      palettes[imagePath] = sideColors;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  List<Color> getPalette(String imagePath) {
    return palettes[imagePath] ?? [];
  }
}
