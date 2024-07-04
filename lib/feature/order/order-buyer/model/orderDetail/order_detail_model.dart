import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/payment/payment_model.dart';

part 'order_detail_model.g.dart';

@JsonSerializable()
class OrderDetailModel {
  int? order_id;
  String? order_date;
  String? delivery_location;
  String? remarks;
  String? status;
  int? user_id;
  double? total_price;
  double? delivery_price;
  double? final_price;
  PaymentModel? payment_details;
  String? updated_at;
  String? created_at;

  OrderDetailModel({
    this.order_id,
    this.order_date,
    this.delivery_location,
    this.remarks,
    this.status,
    this.user_id,
    this.total_price,
    this.delivery_price,
    this.final_price,
    this.payment_details,
    this.created_at,
    this.updated_at,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);
}
