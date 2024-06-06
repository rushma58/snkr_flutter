import 'package:json_annotation/json_annotation.dart';

part 'add_product_model.g.dart';

@JsonSerializable()
class AddProductModel {
  int? id;
  String? name;
  String? brand;
  String? model;
  String? category;
  String? size;
  String? color;
  int? price;
  int? discount_price;
  String? description;
  String? material;
  String? sku;
  String? release_date;
  String? images;
  double? weight;
  String? dimensions;
  String? gender;
  String? status;
  int? user_id;

  AddProductModel({
    this.id,
    this.name,
    this.brand,
    this.model,
    this.category,
    this.size,
    this.color,
    this.price,
    this.discount_price,
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

  factory AddProductModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddProductModelToJson(this);
}
