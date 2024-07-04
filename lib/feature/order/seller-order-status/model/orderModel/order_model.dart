import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  int? order_id;
  int? user_id;
  String? order_date;
  String? status;

  OrderModel({
    this.order_id,
    this.user_id,
    this.order_date,
    this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
