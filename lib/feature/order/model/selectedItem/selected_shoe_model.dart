import 'package:json_annotation/json_annotation.dart';

part 'selected_shoe_model.g.dart';

@JsonSerializable()
class SelectedShoeModel {
  int? shoe_id;
  int? quantity;
  double? unit_price;
  double? total_price;

  SelectedShoeModel({
    this.shoe_id,
    this.quantity,
    this.unit_price,
    this.total_price,
  });

  factory SelectedShoeModel.fromJson(Map<String, dynamic> json) =>
      _$SelectedShoeModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedShoeModelToJson(this);
}
