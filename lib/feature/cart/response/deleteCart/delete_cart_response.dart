import 'package:json_annotation/json_annotation.dart';

part 'delete_cart_response.g.dart';

@JsonSerializable()
class DeleteCartResponse {
  bool? success;
  String? message;

  DeleteCartResponse({
    this.success,
    this.message,
  });

  factory DeleteCartResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCartResponseToJson(this);
}
