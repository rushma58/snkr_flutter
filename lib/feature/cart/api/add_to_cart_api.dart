import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/feature/cart/response/addToCart/add_to_cart_response.dart';
import 'package:snkr_flutter/feature/cart/response/deleteCart/delete_cart_response.dart';
import 'package:snkr_flutter/feature/cart/response/getCart/get_cart_response.dart';

import '../../../core/helper/sharedPreferences/shared_preferences.dart';

class CartAPI {
  Future<AddToCartResponse?> addToCart(String shoeId) async {
    Response? response;
    AddToCartResponse? addToCartResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + addToCartUrl;

    try {
      String? token = await getStringData("token");
      Map<String, dynamic> requestBody = {"shoe_id": shoeId};
      response = await dio.post(
        url,
        data: requestBody,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        addToCartResponse = AddToCartResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Add to Cart Error: ${e.toString()}");
    }

    return addToCartResponse;
  }

  Future<GetCartResponse?> getCart() async {
    Response? response;
    GetCartResponse? getCartResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + getCartUrl;

    try {
      String? token = await getStringData("token");
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        getCartResponse = GetCartResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Get Cart Error: ${e.toString()}");
    }

    return getCartResponse;
  }

  Future<DeleteCartResponse?> deleteCart(String id) async {
    Response? response;
    DeleteCartResponse? deleteCartResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + deleteFromCartUrl + id;
    try {
      String? token = await getStringData("token");
      response = await dio.delete(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        deleteCartResponse = DeleteCartResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Delete Cart Error: ${e.toString()}");
    }
    return deleteCartResponse;
  }
}
