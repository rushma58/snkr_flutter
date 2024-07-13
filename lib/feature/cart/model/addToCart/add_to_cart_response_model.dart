import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response_model.g.dart';

@JsonSerializable()
class AddToCartResponseModel {
  int? user_id;
  String? shoe_id;
  String? updated_at;
  String? created_at;
  int? id;

  AddToCartResponseModel({
    this.user_id,
    this.shoe_id,
    this.id,
    this.created_at,
    this.updated_at,
  });

  factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseModelToJson(this);
}
