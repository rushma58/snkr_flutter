import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/rating/viewRating/model/user_model.dart';

part 'rating_model.g.dart';

@JsonSerializable()
class RatingModel {
  int? id;
  dynamic shoe_id;
  double? rating;
  int? user_id;
  String? review_text;
  String? updated_at;
  String? created_at;
  UserModel? user;

  RatingModel({
    this.id,
    this.shoe_id,
    this.rating,
    this.user_id,
    this.review_text,
    this.created_at,
    this.updated_at,
    this.user,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
