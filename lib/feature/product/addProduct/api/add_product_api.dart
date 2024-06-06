import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/feature/product/addProduct/model/add_product_model.dart';
import 'package:snkr_flutter/feature/product/addProduct/response/add_product_response.dart';

class AddProductAPI {
  Future<AddProductResponse?> addProduct(
      AddProductModel addProductModel) async {
    Response? response;
    AddProductResponse? addProductResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + addProductUrl;

    try {
      response = await dio.post(
        url,
        data: addProductModel.toJson(),
      );
      if (response.statusCode == 200) {
        addProductResponse = AddProductResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("AddProduct Error: ${e.toString()}");
    }

    return addProductResponse;
  }
}
