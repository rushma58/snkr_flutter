import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/rating/viewRating/model/rating_model.dart';

part 'add_rating_response.g.dart';

@JsonSerializable()
class AddRatingResponse {
  bool? success;
  String? message;
  RatingModel? rating;

  AddRatingResponse({
    this.success,
    this.message,
    this.rating,
  });

  factory AddRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$AddRatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddRatingResponseToJson(this);
}
