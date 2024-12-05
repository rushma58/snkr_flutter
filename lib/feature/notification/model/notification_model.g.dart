// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      fcmToken: json['fcmToken'] as String?,
      message: json['message'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'title': instance.title,
      'message': instance.message,
    };
