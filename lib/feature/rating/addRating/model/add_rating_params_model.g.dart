// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_rating_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRatingModel _$AddRatingModelFromJson(Map<String, dynamic> json) =>
    AddRatingModel(
      shoe_id: json['shoe_id'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      review_text: json['review_text'] as String?,
    );

Map<String, dynamic> _$AddRatingModelToJson(AddRatingModel instance) =>
    <String, dynamic>{
      'shoe_id': instance.shoe_id,
      'rating': instance.rating,
      'review_text': instance.review_text,
    };
