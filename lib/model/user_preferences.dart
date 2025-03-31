import 'package:json_annotation/json_annotation.dart';

part 'user_preferences.g.dart';

@JsonSerializable()
class UserPreferencesModel {
  final String country;
  final String countryCode;
  final String theme;

  UserPreferencesModel(
      {required this.country, required this.countryCode, required this.theme});

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesModelToJson(this);
}
