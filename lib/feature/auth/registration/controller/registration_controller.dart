import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/feature/auth/registration/model/registration_params_model.dart';
import 'package:snkr_flutter/feature/auth/registration/repository/registration_repository.dart';
import 'package:snkr_flutter/feature/auth/registration/response/registration_response.dart';
import 'package:snkr_flutter/screen/login/login_screen.dart';

class RegistrationController extends GetxController {
  final first_name_controller = TextEditingController();
  final last_name_controller = TextEditingController();
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();
  final contact_number_controller = TextEditingController();
  final payment_number_controller = TextEditingController();
  final role_controller = TextEditingController();
  final current_address_controller = TextEditingController();

  final RegistrationRepository _registrationRepository =
      RegistrationRepository();

  final isLoading = false.obs;

  Future<RegistrationResponse?> userRegister() async {
    isLoading.value = true;
    try {
      RegistrationResponse? registrationResponse;
      final registrationParamsModel = RegistrationParamsModel(
        first_name: first_name_controller.text,
        last_name: last_name_controller.text,
        email: email_controller.text,
        password: password_controller.text,
        contact_number: contact_number_controller.text,
        payment_method: payment_number_controller.text,
        role: role_controller.text,
        current_address: current_address_controller.text,
      );

      registrationResponse =
          await _registrationRepository.userRegister(registrationParamsModel);

      if (registrationResponse?.success == true) {
        Get.to(
          () => const LoginScreen(),
        );
        showSnackBar("${registrationResponse?.message}", isError: false);
      } else {
        showSnackBar("Error occured while registering. Please Try Again",
            isError: true);
      }

      return registrationResponse;
    } finally {
      isLoading.value = false;
    }
  }
}
