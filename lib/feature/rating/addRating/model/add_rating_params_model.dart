import 'package:json_annotation/json_annotation.dart';

part 'add_rating_params_model.g.dart';

@JsonSerializable()
class AddRatingModel {
  String? shoe_id;
  double? rating;
  String? review_text;

  AddRatingModel({
    this.shoe_id,
    this.rating,
    this.review_text,
  });

  factory AddRatingModel.fromJson(Map<String, dynamic> json) =>
      _$AddRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddRatingModelToJson(this);
}
