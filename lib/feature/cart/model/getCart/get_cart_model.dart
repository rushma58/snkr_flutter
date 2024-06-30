import 'package:json_annotation/json_annotation.dart';

import '../../../product/addProduct/response/add_product_model_response.dart';

part 'get_cart_model.g.dart';

@JsonSerializable()
class GetCartModel {
  int? id;
  int? shoe_id;
  int? user_id;
  String? created_at;
  String? updated_at;
  AddProductModelResponse? shoe;

  GetCartModel({
    this.id,
    this.shoe_id,
    this.user_id,
    this.created_at,
    this.updated_at,
    this.shoe,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartModelToJson(this);
}
