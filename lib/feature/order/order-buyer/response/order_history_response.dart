import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/orderHistory/order/order_model.dart';

part 'order_history_response.g.dart';

@JsonSerializable()
class OrderHistoryResponse {
  bool? success;
  String? message;
  List<OrderHistoryModel>? orders;

  OrderHistoryResponse({
    this.success,
    this.message,
    this.orders,
  });

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryResponseToJson(this);
}
