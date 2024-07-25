import 'package:json_annotation/json_annotation.dart';

import '../orderModel/order_model.dart';

part 'recent_order_model.g.dart';

@JsonSerializable()
class RecentOrderModel {
  int? order_item_id;
  int? order_id;
  int? shoe_id;
  int? quantity;
  String? shoe_name;
  String? shoe_image;
  String? unit_price;
  String? total_price;
  String? created_at;
  String? updated_at;
  OrderModel? order;

  RecentOrderModel({
    this.order_item_id,
    this.order_id,
    this.shoe_id,
    this.quantity,
    this.shoe_name,
    this.shoe_image,
    this.unit_price,
    this.total_price,
    this.created_at,
    this.updated_at,
    this.order,
  });
  factory RecentOrderModel.fromJson(Map<String, dynamic> json) =>
      _$RecentOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecentOrderModelToJson(this);
}
