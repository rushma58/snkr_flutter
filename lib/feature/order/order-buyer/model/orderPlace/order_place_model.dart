import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/payment/payment_model.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/selectedItem/selected_shoe_model.dart';

part 'order_place_model.g.dart';

@JsonSerializable()
class OrderPlaceModel {
  double? total_price;
  double? delivery_price;
  double? final_price;
  String? delivery_location;
  String? remarks;
  PaymentModel? payment_details;
  List<SelectedShoeModel>? items;

  OrderPlaceModel({
    this.total_price,
    this.delivery_location,
    this.final_price,
    this.delivery_price,
    this.remarks,
    this.payment_details,
    this.items,
  });

  factory OrderPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPlaceModelToJson(this);
}
