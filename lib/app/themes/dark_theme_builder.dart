import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'themes.dart';

class DarkThemeBuilder implements ThemeBuilder {
  const DarkThemeBuilder();

  @override
  ThemeData build({
    Radiuses radiuses = const Radiuses.regular(),
    Spacings spacings = const Spacings.regular(),
  }) {
    const palette = Palette.dark();

    const fontFamily = 'Rubik';

    final textTheme = _defaultTextTheme.apply(
      bodyColor: palette.textPrimary,
      displayColor: palette.textPrimary,
    );

    final defaultTextTheme = _buildDefaultTextTheme(
      fontFamily: fontFamily,
      defaultColor: palette.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      splashColor: Colors.transparent,
      // <- Here
      highlightColor: Colors.transparent,
      // <- Here
      hoverColor: Colors.transparent,
      colorSchemeSeed: palette.buttonPrimary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: palette.bgPrimary,
      textTheme: textTheme,
      bottomNavigationBarTheme: _buildBottomNavigationBar(
        palette: palette,
        insets: spacings,
        radiuses: radiuses,
        textTheme: textTheme,
      ),
      elevatedButtonTheme: _buildElevatedButtonTheme(
        palette: palette,
        insets: spacings,
        radiuses: radiuses,
        textTheme: defaultTextTheme,
      ),
      outlinedButtonTheme: _buildOutlinedButtonTheme(
        palette: palette,
        insets: spacings,
        radiuses: radiuses,
        textTheme: defaultTextTheme,
      ),
      textButtonTheme: _buildTextButtonTheme(
        palette: palette,
        insets: spacings,
        radiuses: radiuses,
        textTheme: defaultTextTheme,
      ),
      appBarTheme: _buildAppBarTheme(
        palette: palette,
      ),
      snackBarTheme:
          _buildSnackBarTheme(insets: spacings, textTheme: textTheme),
      extensions: [
        palette,
        radiuses,
        spacings,
      ],
    );
  }

  SnackBarThemeData _buildSnackBarTheme({
    required Spacings insets,
    required TextTheme textTheme,
  }) {
    return SnackBarThemeData(
      contentTextStyle: textTheme.bodySmall,
      insetPadding: EdgeInsets.symmetric(horizontal: insets.x4),
    );
  }

  TextTheme _buildDefaultTextTheme({
    required String fontFamily,
    required Color defaultColor,
  }) {
    final platform = defaultTargetPlatform;
    final typography = Typography.material2021(platform: platform);
    final textTheme = typography.white.merge(typography.englishLike).apply(
          bodyColor: defaultColor,
          displayColor: defaultColor,
          fontFamily: fontFamily,
        );

    return textTheme;
  }

  BottomNavigationBarThemeData _buildBottomNavigationBar({
    required Palette palette,
    required Spacings insets,
    required Radiuses radiuses,
    required TextTheme textTheme,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: palette.bgPrimary,
    );
  }

  ElevatedButtonThemeData _buildElevatedButtonTheme({
    required Palette palette,
    required Spacings insets,
    required Radiuses radiuses,
    required TextTheme textTheme,
  }) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(radiuses.x3),
          ),
        ),
        backgroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return palette.buttonPrimary;
          },
        ),
        foregroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return palette.textSecondary;
          },
        ),
        textStyle: MaterialStateProperty.all(
          textTheme.bodyLarge,
        ),
      ),
    );
  }

  OutlinedButtonThemeData _buildOutlinedButtonTheme({
    required Palette palette,
    required Spacings insets,
    required Radiuses radiuses,
    required TextTheme textTheme,
  }) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(radiuses.x3),
          ),
        ),
        backgroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return Colors.transparent;
          },
        ),
        foregroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return palette.textPrimary;
          },
        ),
        textStyle: MaterialStateProperty.all(
          textTheme.bodyLarge,
        ),
      ),
    );
  }

  TextButtonThemeData _buildTextButtonTheme({
    required Palette palette,
    required Spacings insets,
    required Radiuses radiuses,
    required TextTheme textTheme,
  }) {
    return TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(radiuses.x2),
          ),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.zero,
        ),
        foregroundColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            return palette.buttonPrimary;
          },
        ),
        textStyle: MaterialStateProperty.all(
          textTheme.bodyMedium,
        ),
      ),
    );
  }

  AppBarTheme _buildAppBarTheme({
    required Palette palette,
  }) {
    return AppBarTheme(
      backgroundColor: palette.bgPrimary,
      surfaceTintColor: palette.bgPrimary,
      iconTheme: IconThemeData(color: palette.iconPrimary),
    );
  }

  TextTheme get _defaultTextTheme => const TextTheme(
    displayLarge: TextStyle(),
    displayMedium: TextStyle(),
    displaySmall: TextStyle(),
    headlineLarge: TextStyle(),
    headlineMedium: TextStyle(),
    headlineSmall: TextStyle(),
    titleLarge: TextStyle(
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      height: 16 / 11,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    ),
  );
}
