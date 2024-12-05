import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/rating/viewRating/model/rating_model.dart';

part 'rating_response.g.dart';

@JsonSerializable()
class RatingResponse {
  bool? success;
  String? message;
  List<RatingModel>? ratings;
  double? average_rating;
  int? rating_count;

  RatingResponse({
    this.success,
    this.message,
    this.ratings,
    this.average_rating,
    this.rating_count,
  });

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
}
