import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/response/fetch_product_response.dart';

class FetchProductAPI {
  Future<FetchProductResponse?> fetchProduct() async {
    Response? response;
    FetchProductResponse? fetchProductResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + fetchProductUrl;

    try {
      response = await dio.post(
        url,
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
