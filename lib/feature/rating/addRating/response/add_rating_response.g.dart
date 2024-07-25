// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRatingResponse _$AddRatingResponseFromJson(Map<String, dynamic> json) =>
    AddRatingResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddRatingResponseToJson(AddRatingResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'rating': instance.rating,
    };
