import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004ac6),
      surfaceTint: Color(0xff0053db),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2563eb),
      onPrimaryContainer: Color(0xffeeefff),
      secondary: Color(0xff495c95),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffacbfff),
      onSecondaryContainer: Color(0xff394c84),
      tertiary: Color(0xff8723a4),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa341bf),
      onTertiaryContainer: Color(0xffffeafe),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff191b23),
      onSurfaceVariant: Color(0xff434655),
      outline: Color(0xff737686),
      outlineVariant: Color(0xffc3c6d7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3039),
      inversePrimary: Color(0xffb4c5ff),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff00174b),
      primaryFixedDim: Color(0xffb4c5ff),
      onPrimaryFixedVariant: Color(0xff003ea8),
      secondaryFixed: Color(0xffdbe1ff),
      onSecondaryFixed: Color(0xff00174b),
      secondaryFixedDim: Color(0xffb4c5ff),
      onSecondaryFixedVariant: Color(0xff31447b),
      tertiaryFixed: Color(0xfffcd7ff),
      onTertiaryFixed: Color(0xff340043),
      tertiaryFixedDim: Color(0xfff2afff),
      onTertiaryFixedVariant: Color(0xff770994),
      surfaceDim: Color(0xffd9d9e5),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fe),
      surfaceContainer: Color(0xffededf9),
      surfaceContainerHigh: Color(0xffe7e7f3),
      surfaceContainerHighest: Color(0xffe1e2ed),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002f84),
      surfaceTint: Color(0xff0053db),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2563eb),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff1f3369),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff586ba5),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5e0077),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa341bf),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff0f1119),
      onSurfaceVariant: Color(0xff323643),
      outline: Color(0xff4e5261),
      outlineVariant: Color(0xff696c7c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3039),
      inversePrimary: Color(0xffb4c5ff),
      primaryFixed: Color(0xff2563eb),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff004ac6),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff586ba5),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3f528a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa341bf),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff8723a4),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c6d1),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f3fe),
      surfaceContainer: Color(0xffe7e7f3),
      surfaceContainerHigh: Color(0xffdcdce7),
      surfaceContainerHighest: Color(0xffd0d1dc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00266e),
      surfaceTint: Color(0xff0053db),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0040ad),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff13295f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff33477e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4e0063),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff790f97),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff282c39),
      outlineVariant: Color(0xff454957),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3039),
      inversePrimary: Color(0xffb4c5ff),
      primaryFixed: Color(0xff0040ad),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002c7c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff33477e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1b2f66),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff790f97),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff580070),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7b8c3),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f0fb),
      surfaceContainer: Color(0xffe1e2ed),
      surfaceContainerHigh: Color(0xffd3d3df),
      surfaceContainerHighest: Color(0xffc5c6d1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb4c5ff),
      surfaceTint: Color(0xffb4c5ff),
      onPrimary: Color(0xff002a78),
      primaryContainer: Color(0xff2563eb),
      onPrimaryContainer: Color(0xffeeefff),
      secondary: Color(0xffb4c5ff),
      onSecondary: Color(0xff182d63),
      secondaryContainer: Color(0xff33467e),
      onSecondaryContainer: Color(0xffa4b6f5),
      tertiary: Color(0xfff2afff),
      onTertiary: Color(0xff55006c),
      tertiaryContainer: Color(0xffa341bf),
      onTertiaryContainer: Color(0xffffeafe),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff11131b),
      onSurface: Color(0xffe1e2ed),
      onSurfaceVariant: Color(0xffc3c6d7),
      outline: Color(0xff8d90a0),
      outlineVariant: Color(0xff434655),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2ed),
      inversePrimary: Color(0xff0053db),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff00174b),
      primaryFixedDim: Color(0xffb4c5ff),
      onPrimaryFixedVariant: Color(0xff003ea8),
      secondaryFixed: Color(0xffdbe1ff),
      onSecondaryFixed: Color(0xff00174b),
      secondaryFixedDim: Color(0xffb4c5ff),
      onSecondaryFixedVariant: Color(0xff31447b),
      tertiaryFixed: Color(0xfffcd7ff),
      onTertiaryFixed: Color(0xff340043),
      tertiaryFixedDim: Color(0xfff2afff),
      onTertiaryFixedVariant: Color(0xff770994),
      surfaceDim: Color(0xff11131b),
      surfaceBright: Color(0xff373942),
      surfaceContainerLowest: Color(0xff0c0e16),
      surfaceContainerLow: Color(0xff191b23),
      surfaceContainer: Color(0xff1d1f27),
      surfaceContainerHigh: Color(0xff282a32),
      surfaceContainerHighest: Color(0xff32343d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd2dbff),
      surfaceTint: Color(0xffb4c5ff),
      onPrimary: Color(0xff002061),
      primaryContainer: Color(0xff618bff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd2dbff),
      onSecondary: Color(0xff0a2258),
      secondaryContainer: Color(0xff7c8fcb),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffaceff),
      onTertiary: Color(0xff440057),
      tertiaryContainer: Color(0xffcb67e6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11131b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd9dbed),
      outline: Color(0xffaeb1c2),
      outlineVariant: Color(0xff8c90a0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2ed),
      inversePrimary: Color(0xff003faa),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff000e35),
      primaryFixedDim: Color(0xffb4c5ff),
      onPrimaryFixedVariant: Color(0xff002f84),
      secondaryFixed: Color(0xffdbe1ff),
      onSecondaryFixed: Color(0xff000e35),
      secondaryFixedDim: Color(0xffb4c5ff),
      onSecondaryFixedVariant: Color(0xff1f3369),
      tertiaryFixed: Color(0xfffcd7ff),
      onTertiaryFixed: Color(0xff23002f),
      tertiaryFixedDim: Color(0xfff2afff),
      onTertiaryFixedVariant: Color(0xff5e0077),
      surfaceDim: Color(0xff11131b),
      surfaceBright: Color(0xff42444d),
      surfaceContainerLowest: Color(0xff05070e),
      surfaceContainerLow: Color(0xff1b1d25),
      surfaceContainer: Color(0xff252830),
      surfaceContainerHigh: Color(0xff30323b),
      surfaceContainerHighest: Color(0xff3b3d46),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffedefff),
      surfaceTint: Color(0xffb4c5ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffaec1ff),
      onPrimaryContainer: Color(0xff000928),
      secondary: Color(0xffedefff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffaec1ff),
      onSecondaryContainer: Color(0xff000928),
      tertiary: Color(0xffffeafe),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff0a9ff),
      onTertiaryContainer: Color(0xff1a0023),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff11131b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffedefff),
      outlineVariant: Color(0xffbfc2d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2ed),
      inversePrimary: Color(0xff003faa),
      primaryFixed: Color(0xffdbe1ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb4c5ff),
      onPrimaryFixedVariant: Color(0xff000e35),
      secondaryFixed: Color(0xffdbe1ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb4c5ff),
      onSecondaryFixedVariant: Color(0xff000e35),
      tertiaryFixed: Color(0xfffcd7ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff2afff),
      onTertiaryFixedVariant: Color(0xff23002f),
      surfaceDim: Color(0xff11131b),
      surfaceBright: Color(0xff4e5059),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d1f27),
      surfaceContainer: Color(0xff2e3039),
      surfaceContainerHigh: Color(0xff393b44),
      surfaceContainerHighest: Color(0xff444650),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
