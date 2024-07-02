import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
import 'package:snkr_flutter/feature/order/model/orderPlace/order_place_model.dart';
import 'package:snkr_flutter/feature/order/response/order_place_response.dart';

class OrderPlaceAPI {
  Future<OrderPlaceResponse?> placeOrder(
      OrderPlaceModel orderPlaceModel) async {
    Response? response;
    OrderPlaceResponse? orderPlaceResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + orderPlaceUrl;

    try {
      String? token = await getStringData("token");

      response = await dio.post(
        url,
        data: orderPlaceModel.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        orderPlaceResponse = OrderPlaceResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Order Place Error: ${e.toString()}");
    }

    return orderPlaceResponse;
  }
}
