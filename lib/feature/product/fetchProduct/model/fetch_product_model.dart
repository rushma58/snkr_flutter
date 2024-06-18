import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/auth/registration/response/registration_response_model.dart';

part 'fetch_product_model.g.dart';

@JsonSerializable()
class FetchProductModel {
  int? id;
  String? name;
  String? brand;
  String? model;
  String? category;
  String? size;
  String? color;
  String? price;
  String? discount_price;
  String? commission;
  String? final_price;
  String? description;
  String? material;
  String? sku;
  String? release_date;
  String? images;
  String? weight;
  String? dimensions;
  String? gender;
  String? status;
  int? user_id;
  RegistrationResponseModel? user;

  FetchProductModel({
    this.id,
    this.name,
    this.brand,
    this.model,
    this.category,
    this.size,
    this.color,
    this.price,
    this.discount_price,
    this.commission,
    this.final_price,
    this.description,
    this.material,
    this.sku,
    this.release_date,
    this.images,
    this.weight,
    this.dimensions,
    this.gender,
    this.status,
    this.user_id,
    this.user,
  });

  factory FetchProductModel.fromJson(Map<String, dynamic> json) =>
      _$FetchProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$FetchProductModelToJson(this);
}
