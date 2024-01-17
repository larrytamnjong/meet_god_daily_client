import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBarSuccess({required String message}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: Colors.lightGreen,
      title: "Message",
      message: message,
      icon: const Icon(Icons.add_alert_rounded),
      duration: const Duration(seconds: 3),
    ),
  );
}

void showSnackBarFailure({required String message}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: Colors.redAccent,
      title: "Message",
      message: message,
      icon: const Icon(Icons.warning),
      duration: const Duration(seconds: 3),
    ),
  );
}
