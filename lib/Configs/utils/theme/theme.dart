
import 'package:flutter/material.dart';
import '../Constant/texte_string.dart';
import 'custom_theme/appbar_theme.dart';
import 'custom_theme/button_sheet_theme.dart';
import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_buttom_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';


class TAppTheme{
  TAppTheme._();

  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    fontFamily: TText.fontFamilyPrimary,
    fontFamilyFallback: [TText.fontFamilySecond],
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lignhtElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lignhtElevatedButtonTheme,
    inputDecorationTheme: TTextFromFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme=ThemeData(
     useMaterial3: true,
    fontFamily: TText.fontFamilyPrimary,
    fontFamilyFallback: [TText.fontFamilySecond],
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
     chipTheme: TChipTheme.darkChipTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFromFieldTheme.darkInputDecorationTheme
  );

}