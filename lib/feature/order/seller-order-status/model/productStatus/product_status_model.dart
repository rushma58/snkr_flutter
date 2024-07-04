import 'package:json_annotation/json_annotation.dart';

part 'product_status_model.g.dart';

@JsonSerializable()
class ProductStatusModel {
  int? shoe_id;
  String? name;
  String? price;
  String? status;
  int? ordered_count;
  int? delivered_count;
  String? images;

  ProductStatusModel({
    this.shoe_id,
    this.name,
    this.price,
    this.status,
    this.ordered_count,
    this.delivered_count,
    this.images,
  });

  factory ProductStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ProductStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductStatusModelToJson(this);
}
