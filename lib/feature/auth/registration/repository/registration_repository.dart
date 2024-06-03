import 'package:snkr_flutter/feature/auth/registration/api/registration_api.dart';
import 'package:snkr_flutter/feature/auth/registration/model/registration_params_model.dart';
import 'package:snkr_flutter/feature/auth/registration/response/registration_response.dart';

class RegistrationRepository {
  Future<RegistrationResponse?> userRegister(
      RegistrationParamsModel registrationParamsModel) async {
    return RegistrationAPI().userRegister(registrationParamsModel);
  }
}
