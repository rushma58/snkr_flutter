import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/helper/api/http_services.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
import 'package:snkr_flutter/feature/rating/addRating/model/add_rating_params_model.dart';
import 'package:snkr_flutter/feature/rating/addRating/response/add_rating_response.dart';
import 'package:snkr_flutter/feature/rating/viewRating/response/rating_response.dart';

class RatingAPI {
  Future<AddRatingResponse?> addRating(AddRatingModel addRatingModel) async {
    Response? response;
    AddRatingResponse? addRatingResponse;

    Dio dio = HttpServices().getDioInstance();
    String? url = baseUrl + addRatingUrl;

    try {
      String? token = await getStringData("token");

      response = await dio.post(
        url,
        data: addRatingModel.toJson(),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        addRatingResponse = AddRatingResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Add Rating API Error: ${e.toString()}");
    }

    return addRatingResponse;
  }

  Future<RatingResponse?> getRating(String id) async {
    Response? response;
    RatingResponse? ratingResponse;
    Dio dio = HttpServices().getDioInstance();

    String? url = baseUrl + getRatingUrl + id;

    try {
      response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        ratingResponse = RatingResponse.fromJson(response.data);
        // print("userCheckResponse: $response.data");
      }
    } catch (e) {
      debugPrint("Get Rating Error: ${e.toString()}");
    }

    return ratingResponse;
  }
}
