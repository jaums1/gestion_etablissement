import 'package:flutter/material.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import 'create_scolarite_desktop.dart';

class TCreateScolariteTabletScreen extends StatelessWidget {
  const TCreateScolariteTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: TCreateScolariteDesktopScreen()
    );
  }
}