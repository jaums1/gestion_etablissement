
import 'package:flutter/material.dart';

class TChipTheme{
  TChipTheme._();

  static ChipThemeData lightChipTheme=ChipThemeData(
    disabledColor: Colors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor: Colors.white,
     selectedColor: Colors.blue
  );

  static ChipThemeData darkChipTheme=const ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle:  TextStyle(color: Colors.white),
    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor: Colors.white,
    selectedColor: Colors.blue
  );
}