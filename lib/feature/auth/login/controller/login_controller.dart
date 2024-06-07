import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/core/utils/layout.dart';
import 'package:snkr_flutter/feature/auth/login/model/login_params_model.dart';
import 'package:snkr_flutter/feature/auth/login/repository/login_repository.dart';
import 'package:snkr_flutter/feature/auth/login/response/login_response.dart';

class LoginController extends GetxController {
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  final LoginRepository _loginRepository = LoginRepository();

  final isLoading = false.obs;

  Future<LoginResponse?> userLogin() async {
    isLoading.value = true;
    try {
      LoginResponse? loginResponse;
      final loginParamsModel = LoginParamsModel(
        email: email_controller.text,
        password: password_controller.text,
      );

      loginResponse = await _loginRepository.userLogin(loginParamsModel);

      if (loginResponse!.success == true) {
        Get.off(() => const LayoutScreen());
        customSuccessSnackBar("Login Sucess");
      } else {
        customErrorSnackBar(
            "Error occurred while Logging In. Please try again");
      }

      return loginResponse;
    } on DioException catch (e) {
      // Handle DioError separately for better debugging
      // showSnackBar(
      //   "Login Error: ${e.message}",
      //   isError: true,
      // );
      debugPrint("${e.message}");
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
