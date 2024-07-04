import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonController extends GetxController {
  DateTime? lastPressed;

  bool shouldExit() {
    final now = DateTime.now();
    if (lastPressed == null ||
        now.difference(lastPressed!) > const Duration(seconds: 2)) {
      lastPressed = now;
      Get.snackbar('Hold on!', 'Press back again to exit',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          borderRadius: 30);
      return false;
    }
    return true;
  }
}
