import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/colors.dart';

// void showSnackBar(String message, {bool isError = false}) {
//   Get.snackbar(
//     isError ? 'Error' : 'Success',
//     message,
//     snackPosition: SnackPosition.BOTTOM,
//     backgroundColor: isError ? cRed : cGreen,
//     colorText: cWhite,
//   );
// }
// void showSnackBar(String message, {bool isError = true}) {
//   if (Get.isSnackbarOpen) {
//     Get.back(); // Close the currently open snackbar
//   }

//   Get.snackbar(
//     isError ? 'Error' : 'Success',
//     message,
//     snackPosition: SnackPosition.BOTTOM,
//     backgroundColor: isError ? cRed : cGreen,
//     colorText: cWhite,
//     duration: const Duration(seconds: 3),
//   );
// }

void customSuccessSnackBar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      title: "Success",
      message: message,
      icon: const Icon(Icons.check_circle),
      duration: const Duration(seconds: 3),
      backgroundColor: cGreen,
    ),
  );
}

void customErrorSnackBar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      title: "Error",
      message: message,
      icon: const Icon(Icons.dangerous),
      duration: const Duration(seconds: 3),
      backgroundColor: cRed,
    ),
  );
}

void customInfoSnackBar(String message) {
  Get.showSnackbar(
    GetSnackBar(
      title: "Information",
      message: message,
      icon: const Icon(Icons.info),
      duration: const Duration(seconds: 3),
      backgroundColor: cBlue,
    ),
  );
}
