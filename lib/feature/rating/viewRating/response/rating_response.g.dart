// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) =>
    RatingResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => RatingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      average_rating: (json['average_rating'] as num?)?.toDouble(),
      rating_count: (json['rating_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RatingResponseToJson(RatingResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'ratings': instance.ratings,
      'average_rating': instance.average_rating,
      'rating_count': instance.rating_count,
    };
