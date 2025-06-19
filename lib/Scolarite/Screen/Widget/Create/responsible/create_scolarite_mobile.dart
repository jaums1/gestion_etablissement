import 'package:flutter/material.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import 'create_scolarite_desktop.dart';

class TCreateScolariteMobileScreen extends StatelessWidget {
  const TCreateScolariteMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: TCreateScolariteDesktopScreen()
    );
  }
}