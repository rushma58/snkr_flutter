import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/feature/rating/addRating/model/add_rating_params_model.dart';
import 'package:snkr_flutter/feature/rating/addRating/repository/rating_repository.dart';
import 'package:snkr_flutter/feature/rating/addRating/response/add_rating_response.dart';
import 'package:snkr_flutter/feature/rating/viewRating/model/rating_model.dart';
import 'package:snkr_flutter/feature/rating/viewRating/response/rating_response.dart';

class RatingController extends GetxController {
  final shoe_id_controller = TextEditingController();
  final rating_controller = TextEditingController();
  final review_text_controller = TextEditingController();

  final RatingRepository _ratingRepository = RatingRepository();
  // final isLoading = false.obs;

  bool isLoading = false;

  final _getRatingResponse = Rx<RatingResponse?>(null);
  double get averageRating => _getRatingResponse.value?.average_rating ?? 0.0;
  int get ratingCount => _getRatingResponse.value?.rating_count ?? 0;
  List<RatingModel>? get getRatingList => _getRatingResponse.value?.ratings;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    shoe_id_controller.clear();
    rating_controller.clear();
    review_text_controller.clear();

    shoe_id_controller.dispose();
    rating_controller.dispose();
    review_text_controller.dispose();
  }

  Future<AddRatingResponse?> addRating() async {
    isLoading = true;
    update();
    try {
      AddRatingResponse? addRatingResponse;

      final addRatingModel = AddRatingModel(
        shoe_id: shoe_id_controller.text,
        rating: double.parse(rating_controller.text),
        review_text: review_text_controller.text,
      );

      addRatingResponse = await _ratingRepository.addRating(addRatingModel);
      if (addRatingResponse?.success == true) {
        customSuccessSnackBar("Added Review");
      } else {
        customErrorSnackBar(
            "Error occurred while adding review. Please try again");
      }
    } on DioException catch (e) {
      debugPrint("${e.message}");
      return null;
    } finally {
      isLoading = false;
      update();
    }
    return null;
  }

  Future<RatingResponse?> getRating() async {
    isLoading = true;
    update();
    try {
      RatingResponse? ratingResponse;

      String id = shoe_id_controller.text;
      ratingResponse = await _ratingRepository.getRating(id);
      _getRatingResponse.value = ratingResponse;
    } catch (e) {
      debugPrint('Error fetching Rating List: $e');
    } finally {
      isLoading = false;
      update();
    }
    return null;
  }
}
