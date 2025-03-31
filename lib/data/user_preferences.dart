import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/user_preferences.dart';

part 'user_preferences.g.dart';

@riverpod
class UserPreferences extends _$UserPreferences {
  @override
  Future<UserPreferencesModel?> build() async {
    return await _loadPreferences();
  }

  Future<UserPreferencesModel?> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final country = prefs.getString('country') ?? '';
    final countryCode = prefs.getString('countryCode') ?? '';
    final theme = prefs.getString('theme') ?? 'dark';

    if (country.isNotEmpty && countryCode.isNotEmpty) {
      return UserPreferencesModel(
          country: country, countryCode: countryCode, theme: theme);
    }
    return null;
  }

  Future<void> savePreferences(
      String country, String countryCode, String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('country', country);
    await prefs.setString('countryCode', countryCode);
    await prefs.setString('theme', theme);

    state = AsyncData(
      UserPreferencesModel(
          country: country, countryCode: countryCode, theme: theme),
    );
  }
}
