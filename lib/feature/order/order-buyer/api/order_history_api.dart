import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/feature/order/order-buyer/response/order_history_response.dart';

import '../../../../core/helper/api/http_services.dart';
import '../../../../core/helper/sharedPreferences/shared_preferences.dart';

class OrderHistoryAPI {
  Future<OrderHistoryResponse?> orderHistory() async {
    Response? response;
    OrderHistoryResponse? orderHistoryResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + orderHistoryUrl;

    try {
      String? token = await getStringData("token");
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        orderHistoryResponse = OrderHistoryResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Order History API: ${e.toString()}");
    }

    return orderHistoryResponse;
  }
}
