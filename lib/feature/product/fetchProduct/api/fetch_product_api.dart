import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/response/fetch_product_response.dart';

import '../model/fetch_product_params_model.dart';

class FetchProductAPI {
  Future<FetchProductResponse?> fetchProduct(
      FetchProductParamsModel fetchProductParamsModel) async {
    Response? response;
    FetchProductResponse? fetchProductResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + fetchProductUrl;

    try {
      //String? token = await getStringData("token");
      response = await dio.post(
        url,
        data: fetchProductParamsModel.toJson(),
        // options: Options(
        //   headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        // ),
      );
      if (response.statusCode == 200) {
        fetchProductResponse = FetchProductResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Fetch Product Error: ${e.toString()}");
    }

    return fetchProductResponse;
  }
}
