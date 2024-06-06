import 'package:snkr_flutter/feature/auth/login/api/login_api.dart';
import 'package:snkr_flutter/feature/auth/login/model/login_params_model.dart';
import 'package:snkr_flutter/feature/auth/login/response/login_response.dart';

class LoginRepository {
  Future<LoginResponse?> userLogin(LoginParamsModel loginParamsModel) async {
    return LoginAPI().userLogin(loginParamsModel);
  }
}
