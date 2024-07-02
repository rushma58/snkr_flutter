import 'package:json_annotation/json_annotation.dart';
import 'package:snkr_flutter/feature/order/model/orderDetail/order_detail_model.dart';

part 'order_place_response.g.dart';

@JsonSerializable()
class OrderPlaceResponse {
  bool? success;
  String? message;
  OrderDetailModel? order_detail;

  OrderPlaceResponse({
    this.success,
    this.message,
    this.order_detail,
  });

  factory OrderPlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderPlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPlaceResponseToJson(this);
}
