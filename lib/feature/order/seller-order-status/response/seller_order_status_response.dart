import 'package:snkr_flutter/feature/order/seller-order-status/model/productStatus/product_status_model.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/model/recentOrder/recent_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'seller_order_status_response.g.dart';

@JsonSerializable()
class SellerOrderStatusResponse {
  bool? success;
  String? message;
  List<ProductStatusModel>? products;
  List<RecentOrderModel>? recent_orders;

  SellerOrderStatusResponse({
    this.success,
    this.message,
    this.products,
    this.recent_orders,
  });

  factory SellerOrderStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$SellerOrderStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SellerOrderStatusResponseToJson(this);
}
