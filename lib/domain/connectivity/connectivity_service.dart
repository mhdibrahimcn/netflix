import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  final RxBool isConnected = true.obs;
  late StreamSubscription<List<ConnectivityResult>> subscription;
  bool _isFirstBuild = true;
  GetSnackBar? currentSnackbar;
  @override
  void onInit() {
    super.onInit();
    // Start monitoring connectivity when the service is initialized
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      updateConnectionStatus(result);
    });
  }

  @override
  void onClose() {
    // Dispose of resources when the service is closed
    subscription.cancel();
    super.onClose();
  }

  void updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      isConnected.value = true;
      Get.closeCurrentSnackbar();
      _showSnackbar(
        title: 'Internet disconnected',
        message: 'Please check your connection.',
        backgroundColor: Colors.red,
        icon: const Icon(Icons.wifi_off, color: Colors.white),
        delay: const Duration(days: 1), // More appropriate icon
      );
    } else {
      if (isConnected.value) {
        isConnected.value = false;
        if (!_isFirstBuild) {
          Get.closeCurrentSnackbar();
          _showSnackbar(
            title: 'Internet connected',
            message: 'You are back online.',
            backgroundColor: Colors.green,
            icon: const Icon(Icons.wifi, color: Colors.white),
            delay: const Duration(seconds: 5), // More appropriate icon
          );
        }
      }
    }
    _isFirstBuild = false; //
  }
}

void _showSnackbar(
    {required String title,
    required String message,
    required Color backgroundColor,
    required Icon icon,
    required Duration delay}) {
  // Check if Get.context is available
  if (Get.context != null) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      borderRadius: 30,
      margin: const EdgeInsets.all(10),
      duration: delay,
      dismissDirection: DismissDirection.horizontal,
      icon: icon,
      shouldIconPulse: true,
    );
  } else {
    // Delay the snackbar display until the context is available
    Future.delayed(const Duration(milliseconds: 500), () {
      _showSnackbar(
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        icon: icon,
        delay: delay,
      );
    });
  }
}
