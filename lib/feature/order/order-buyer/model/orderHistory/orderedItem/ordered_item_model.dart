import 'package:json_annotation/json_annotation.dart';

part 'ordered_item_model.g.dart';

@JsonSerializable()
class OrderedItemModel {
  int? order_item_id;
  int? shoe_id;
  String? name;
  String? brand;
  int? quantity;
  String? unit_price;
  String? total_price;
  String? images;

  OrderedItemModel({
    this.order_item_id,
    this.shoe_id,
    this.name,
    this.brand,
    this.quantity,
    this.unit_price,
    this.total_price,
    this.images,
  });

  factory OrderedItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderedItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderedItemModelToJson(this);
}
