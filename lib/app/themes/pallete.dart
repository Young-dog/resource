import 'package:flutter/material.dart';

class Palette extends ThemeExtension<Palette> {
  const Palette({
    required this.bgPrimary,
    required this.bgSecondary,
    required this.buttonPrimary,
    required this.textPrimary,
    required this.iconPrimary,
    required this.textSecondary,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.textTertiary,
    required this.iconSecondary,
    required this.bottomBarElevation,
    required this.buttonAccent,
    required this.buttonShare,
    required this.buttonCheck,
    required this.buttonTertiary,
    required this.iconTertiary,
  });

  const Palette.dark()
      : this(
          // Background
          bgPrimary: const Color(0xFF131515),
          bgSecondary: const Color(0xFFFFFFFF),
          // Button
          buttonPrimary: const Color(0xFFffffff),
          buttonAccent: const Color(0xFFd00000),
          buttonShare: const Color(0xFF0077b6),
          buttonCheck: const Color(0xFF008000),
          buttonTertiary: const Color(0xFF6c757d),
          //Text
          textPrimary: const Color(0xFFffffff),
          textSecondary: const Color(0xFF000000),
          textTertiary: const Color(0xFF6c757d),
          //Icon
          iconPrimary: const Color(0xFFffffff),
          iconSecondary: const Color(0xFF6c757d),
          iconTertiary: const Color(0xFF2D4354),
          //Border
          borderPrimary: const Color(0xFFffffff),
          borderSecondary: const Color(0xFF6c757d),
          //Elevation
          bottomBarElevation: const Color(0xFF0a0908),
        );

  // const Palette.light()
  //     : this(
  //         // Text
  //         textPrimary: const Color(0xFF343A40),
  //         textSecondary: const Color(0xFF707C8C),
  //         textTertiary: const Color(0xFFA0A9B2),
  //         // Icon
  //         iconPrimary: const Color(0xFF343A40),
  //         iconSecondary: const Color(0xFF707C8C),
  //         // Background
  //         bgPrimary: const Color(0xFFF4F4F4),
  //         bgSecondary: const Color(0xFFF2F3F7),
  //         // Button
  //         buttonPrimary: const Color(0xFFDE0A26),
  //         buttonTertiary: const Color(0xFF343A40),
  //
  //         buttonAccent: const Color(0xFFd00000),
  //         buttonShare: const Color(0xFF0077b6),
  //         buttonCheck: const Color(0xFF008000),
  //         //Border
  //         borderPrimary: const Color(0xFFffffff),
  //         borderSecondary: const Color(0xFF6c757d),
  //         //Elevation
  //         bottomBarElevation: const Color(0xFF0a0908),
  //       );

  // Background
  final Color bgPrimary;
  final Color bgSecondary;

  // Button
  final Color buttonPrimary;
  final Color buttonTertiary;
  final Color buttonAccent;
  final Color buttonShare;
  final Color buttonCheck;

  //Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  //Icon
  final Color iconPrimary;
  final Color iconSecondary;
  final Color iconTertiary;

  //Border
  final Color borderPrimary;
  final Color borderSecondary;

  //Elevation
  final Color bottomBarElevation;

  @override
  Palette copyWith({
    Color? bgPrimary,
    Color? buttonPrimary,
    Color? textPrimary,
    Color? iconPrimary,
    Color? textSecondary,
    Color? borderPrimary,
    Color? borderSecondary,
    Color? textTertiary,
    Color? iconSecondary,
    Color? iconTertiary,
    Color? bottomBarElevation,
    Color? buttonAccent,
    Color? bgSecondary,
    Color? buttonShare,
    Color? buttonCheck,
    Color? buttonTertiary,
  }) {
    return Palette(
      // Background
      bgPrimary: bgPrimary ?? this.bgPrimary,
      bgSecondary: bgSecondary ?? this.bgSecondary,
      // Button
      buttonPrimary: buttonPrimary ?? this.buttonPrimary,
      buttonAccent: buttonAccent ?? this.buttonAccent,
      buttonShare: buttonShare ?? this.buttonShare,
      buttonCheck: buttonCheck ?? this.buttonCheck,
      buttonTertiary: buttonTertiary ?? this.buttonTertiary,
      //Text
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      //Icon
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      iconTertiary: iconTertiary ?? this.iconTertiary,
      //Border
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      //Elevation
      bottomBarElevation: bottomBarElevation ?? this.bottomBarElevation,
    );
  }

  @override
  ThemeExtension<Palette> lerp(ThemeExtension<Palette>? other, double t) {
    if (other is! Palette) {
      return this;
    }

    return Palette(
      // Background
      bgPrimary: Color.lerp(bgPrimary, other.bgPrimary, t)!,
      bgSecondary: Color.lerp(bgSecondary, other.bgSecondary, t)!,
      // Button
      buttonPrimary: Color.lerp(buttonPrimary, other.buttonPrimary, t)!,
      buttonAccent: Color.lerp(buttonAccent, other.buttonAccent, t)!,
      buttonShare: Color.lerp(buttonShare, other.buttonShare, t)!,
      buttonCheck: Color.lerp(buttonCheck, other.buttonCheck, t)!,
      buttonTertiary: Color.lerp(buttonTertiary, other.buttonTertiary, t)!,
      //Text
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      //Icon
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      iconTertiary: Color.lerp(iconTertiary, other.iconTertiary, t)!,
      //Border
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
      //Elevation
      bottomBarElevation:
          Color.lerp(bottomBarElevation, other.bottomBarElevation, t)!,
    );
  }
}
