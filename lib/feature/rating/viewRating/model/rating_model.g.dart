// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => RatingModel(
      id: (json['id'] as num?)?.toInt(),
      shoe_id: json['shoe_id'],
      rating: (json['rating'] as num?)?.toDouble(),
      user_id: (json['user_id'] as num?)?.toInt(),
      review_text: json['review_text'] as String?,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingModelToJson(RatingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shoe_id': instance.shoe_id,
      'rating': instance.rating,
      'user_id': instance.user_id,
      'review_text': instance.review_text,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'user': instance.user,
    };
