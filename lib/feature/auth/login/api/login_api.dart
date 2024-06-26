import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
import 'package:snkr_flutter/feature/auth/login/model/login_params_model.dart';
import 'package:snkr_flutter/feature/auth/login/response/login_response.dart';

class LoginAPI {
  Future<LoginResponse?> userLogin(LoginParamsModel loginParamsModel) async {
    Response? response;
    LoginResponse? loginResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + loginUrl;

    try {
      response = await dio.get(
        url,
        data: loginParamsModel.toJson(),
      );
      if (response.statusCode == 200) {
        loginResponse = LoginResponse.fromJson(response.data);

        await setStringData('token', loginResponse.access_token.toString());
        await setStringData('role', loginResponse.user!.role.toString());

        debugPrint("${await getStringData('token')}");
      }
    } catch (e) {
      debugPrint("Login Error: ${e.toString()}");
    }

    return loginResponse;
  }
}
