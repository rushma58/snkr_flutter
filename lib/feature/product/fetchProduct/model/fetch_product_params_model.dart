import 'package:json_annotation/json_annotation.dart';

part 'fetch_product_params_model.g.dart';

@JsonSerializable()
class FetchProductParamsModel {
  String? status;
  String? category;
  String? brand;
  String? name;
  String? min_price;
  String? max_price;

  FetchProductParamsModel({
    this.status,
    this.category,
    this.brand,
    this.name,
    this.min_price,
    this.max_price,
  });

  factory FetchProductParamsModel.fromJson(Map<String, dynamic> json) =>
      _$FetchProductParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FetchProductParamsModelToJson(this);
}
