import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';

import '../../../../core/helper/api/http_services.dart';
import '../../../../core/helper/sharedPreferences/shared_preferences.dart';
import '../response/seller_order_status_response.dart';

class SellerOrderStatusAPI {
  Future<SellerOrderStatusResponse?> sellerORderStatus() async {
    Response? response;
    SellerOrderStatusResponse? sellerOrderStatusResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + sellerOrderStatusUrl;

    try {
      String? token = await getStringData("token");
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        sellerOrderStatusResponse =
            SellerOrderStatusResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Seller Order Status: ${e.toString()}");
    }

    return sellerOrderStatusResponse;
  }
}
