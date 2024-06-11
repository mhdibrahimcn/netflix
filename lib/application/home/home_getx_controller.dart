import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class PaletteController extends GetxController {
  var sideColors = RxList<Color>([]); // Use RxList to store multiple colors
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> generatePalette(String imagePath) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(imagePath),
        maximumColorCount: 20,
      );
      // Clear previous side colors
      sideColors.clear();

      // Add colors from different parts of the image
      if (paletteGenerator.paletteColors.isNotEmpty) {
        final List<PaletteColor> paletteColors = paletteGenerator.paletteColors;
        final int colorCount = paletteColors.length;
        // Add colors from the top, bottom, left, and right sides of the image
        sideColors.addAll([
          paletteColors[0].color.withOpacity(1.0), // Top color
          paletteColors[colorCount ~/ 4].color.withOpacity(1.0), // Left color
          paletteColors[colorCount ~/ 2].color.withOpacity(1.0), // Center color
          paletteColors[(3 * colorCount) ~/ 4]
              .color
              .withOpacity(1.0), // Right color
          paletteColors[colorCount - 1].color.withOpacity(1.0), // Bottom color
        ]);
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
