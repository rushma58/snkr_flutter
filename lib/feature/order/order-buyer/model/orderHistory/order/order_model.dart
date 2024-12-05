import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/orderHistory/orderedItem/ordered_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderHistoryModel {
  int? order_id;
  String? order_date;
  String? status;
  String? delivery_location;
  String? delivery_price;
  String? total_price;
  String? final_price;
  String? remarks;
  List<OrderedItemModel>? items;

  OrderHistoryModel({
    this.order_id,
    this.order_date,
    this.status,
    this.delivery_location,
    this.delivery_price,
    this.total_price,
    this.final_price,
    this.remarks,
    this.items,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryModelToJson(this);
}
