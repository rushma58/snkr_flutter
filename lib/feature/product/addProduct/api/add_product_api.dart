import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
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
      String? token = await getStringData("token");

      // Read the image file
      final imageBytes = await File(addProductModel.images!).readAsBytes();
      final base64Image = base64Encode(imageBytes);

      // Prepare the form data
      final formData = FormData.fromMap({
        'name': addProductModel.name,
        'brand': addProductModel.brand,
        'model': addProductModel.model,
        'category': addProductModel.category,
        'size': addProductModel.size,
        'color': addProductModel.color,
        'price': addProductModel.price,
        'discount_price': addProductModel.discount_price,
        'commission': addProductModel.commission,
        'final_price': addProductModel.final_price,
        'description': addProductModel.description,
        'material': addProductModel.material,
        'sku': addProductModel.sku,
        'release_date': addProductModel.release_date,
        'weight': addProductModel.weight,
        'dimensions': addProductModel.dimensions,
        'gender': addProductModel.gender,
        'status': addProductModel.status,
        'user_id': addProductModel.user_id,
        'images': base64Image,
        // if (addProductModel.images != null)
        //   'images': await MultipartFile.fromFile(addProductModel.images!,
        //       filename: addProductModel.images!.split('/').last),
      });

      response = await dio.post(
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),

        url,
        //data: addProductModel.toJson(),
        data: formData,
      );
      if (response.statusCode == 200) {
        addProductResponse = AddProductResponse.fromJson(response.data);
        debugPrint("Added");
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("AddProduct Error: ${e.toString()}");
    }

    return addProductResponse;
  }
}
