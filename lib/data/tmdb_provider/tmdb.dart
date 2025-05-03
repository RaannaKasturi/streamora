import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamora/data/api_keys.dart';

class Tmdb {
  final baseTMDBEndpoint =
      "https://movie-proxy.screeneross3083.workers.dev/?destination=https://api.themoviedb.org/3";
  final dio = Dio(BaseOptions(
    followRedirects: true,
  ));
  final headers = {
    "Authorization": "Bearer $tmdbApiReadAccessToken",
  };
  Future<String> get countryCode async {
    final userPreferences = await SharedPreferences.getInstance();
    final countryCode = userPreferences.getString("countryCode") ?? "US";
    return countryCode;
  }
}
