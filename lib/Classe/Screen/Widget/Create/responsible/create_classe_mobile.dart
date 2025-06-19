import 'package:flutter/material.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import 'create_classe_desktop.dart';

class TCreateClasseMobileScreen extends StatelessWidget {
  const TCreateClasseMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: TCreateClasseDesktopScreen()
    );
  }
}