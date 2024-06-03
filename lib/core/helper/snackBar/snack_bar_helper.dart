import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/colors.dart';

void showSnackBar(String message, {bool isError = false}) {
  Get.snackbar(
    isError ? 'Error' : 'Success',
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: isError ? cRed : cGreen,
    colorText: cWhite,
  );
}
