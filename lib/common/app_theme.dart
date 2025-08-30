import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Color black = AppThemes.darkBackground;

Color white = AppThemes.offWhiteColor;
Color white54 = HexColor("E1E0E4");

Color primaryColors = AppThemes.primaryColor;
Color titlePrimaryColors = AppThemes.primaryblue;
Color redColors = AppThemes.redColors;

Color transactionImageColor = HexColor("FCE196");
Color textColor = HexColor('656565');

const TextStyle appTextStyle = TextStyle(fontFamily: "Roboto");

const double bodyHorizontalPading = 15.0;

class AppThemes {
  // Palette de couleurs
  static final Color primaryColor = HexColor("05cdc2");
  static final Color whiteColor = HexColor("FFFFFF");
  static final Color offWhiteColor = HexColor("FFFFFF");
  static final Color lightGray = HexColor("f5f5f5");
  static final Color darkGray = HexColor("4A4A4A");
  static final Color primaryblue = HexColor("1A1F71");
  static final Color redColors = HexColor("cf1d4c");
  static final Color darkBackground = HexColor("000000");

  // Thème clair
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: offWhiteColor, // Blanc cassé
    appBarTheme: AppBarTheme(
      backgroundColor: offWhiteColor,
      foregroundColor: darkBackground,
      surfaceTintColor: offWhiteColor,
      elevation: 0,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: textColor, fontFamily: "Roboto"),
      bodyMedium: TextStyle(color: textColor, fontFamily: "Roboto"),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: darkBackground,
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: primaryblue,
      surface: offWhiteColor,
      onSurface: darkBackground,
      tertiary: lightGray,
      onTertiary: darkBackground,
    ),
  );

  // Thème sombre
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackground, // Fond sombre mais pas noir
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackground,
      surfaceTintColor: darkBackground,
      foregroundColor: offWhiteColor,
      elevation: 0,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: offWhiteColor, fontFamily: "Poppins"),
      bodyMedium: TextStyle(color: offWhiteColor, fontFamily: "Poppins"),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: primaryblue,
      surface: darkBackground,
      onSurface: offWhiteColor,
      tertiary: darkGray,
      onTertiary: white,
    ),
  );
}

extension ColorExtentionn on BuildContext {
  Color get tertiary => Theme.of(this).colorScheme.tertiary;
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get titleLargeColor => Theme.of(this).textTheme.titleLarge!.color!;
  // ColorFilter iconColor(Color color) =>
  //     ColorFilter.mode(color, BlendMode.srcIn);
}

extension ColorsExtensions on Color {
  Color withAppOppacity(double val) {
    assert(val <= 1 && val > 0, "La valeur est comprise entre 0 et 1");
    return withAlpha((val * 255).round());
  }
}

extension TextExtensions on String {
  String get initials {
    return split(' ').map((e) => e[0].toUpperCase()).join();
  }
}
