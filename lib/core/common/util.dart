import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:streamora/data/user_preferences.dart';

Future<bool> isAccessible(
    {required String url, Map<String, dynamic>? headers}) async {
  debugPrint("Checking URL: $url");
  if (url.isEmpty) return false;
  try {
    final response = await Dio()
        .get(url, options: Options(headers: headers, followRedirects: true))
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        debugPrint("Request timed out for URL: $url");
        return Response(
          statusCode: 408,
          requestOptions: RequestOptions(path: url),
        );
      },
    );
    if (response.statusCode == 200) {
      debugPrint("PASS\n\n\n");
      return true;
    } else {
      debugPrint("FAIL\n\n\n");
      return false;
    }
  } catch (e) {
    debugPrint("Error: $e\n\n\n");
    return false;
  }
}

String fixPadding(String input) {
  final padding = input.length % 4;
  if (padding == 0) return input;
  return input + '=' * (4 - padding);
}

String base64Decoder({required String encodedData}) {
  final fixedData = fixPadding(encodedData);
  final decodedBytes = base64.decode(fixedData);
  final decodedData = utf8.decode(decodedBytes);
  return decodedData;
}

String getLogo(ref) {
  final isDark = ref.watch(userPreferencesProvider).value?.theme == "dark";
  return isDark ? 'assets/brand/logo_dark.png' : 'assets/brand/logo_light.png';
}
