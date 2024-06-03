import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/feature/auth/registration/model/registration_params_model.dart';
import 'package:snkr_flutter/feature/auth/registration/response/registration_response.dart';

class RegistrationAPI {
  Future<RegistrationResponse?> userRegister(
      RegistrationParamsModel registrationParamsModel) async {
    Response? response;
    RegistrationResponse? registrationResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + registrationUrl;

    try {
      response = await dio.post(
        url,
        data: registrationParamsModel.toJson(),
      );
      if (response.statusCode == 200) {
        registrationResponse = RegistrationResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Registration Error: ${e.toString()}");
    }

    return registrationResponse;
  }
}
