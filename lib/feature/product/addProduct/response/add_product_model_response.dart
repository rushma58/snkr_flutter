import 'package:json_annotation/json_annotation.dart';

part 'add_product_model_response.g.dart';

@JsonSerializable()
class AddProductModelResponse {
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
  String? user_id;

  AddProductModelResponse({
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
  });

  factory AddProductModelResponse.fromJson(Map<String, dynamic> json) =>
      _$AddProductModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductModelResponseToJson(this);
}
