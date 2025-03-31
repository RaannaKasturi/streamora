// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferencesModel _$UserPreferencesModelFromJson(
        Map<String, dynamic> json) =>
    UserPreferencesModel(
      country: json['country'] as String,
      countryCode: json['countryCode'] as String,
      theme: json['theme'] as String,
    );

Map<String, dynamic> _$UserPreferencesModelToJson(
        UserPreferencesModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'countryCode': instance.countryCode,
      'theme': instance.theme,
    };
