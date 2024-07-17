import 'package:snkr_flutter/feature/rating/addRating/api/add_rating_api.dart';
import 'package:snkr_flutter/feature/rating/addRating/model/add_rating_params_model.dart';
import 'package:snkr_flutter/feature/rating/addRating/response/add_rating_response.dart';
import 'package:snkr_flutter/feature/rating/viewRating/response/rating_response.dart';

class RatingRepository {
  Future<AddRatingResponse?> addRating(AddRatingModel addRatingModel) async {
    return RatingAPI().addRating(addRatingModel);
  }

  Future<RatingResponse?> getRating(String id) async {
    return RatingAPI().getRating(id);
  }
}
