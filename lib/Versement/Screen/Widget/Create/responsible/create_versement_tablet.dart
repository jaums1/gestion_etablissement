import 'package:flutter/material.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import 'create_versement_desktop.dart';

class TCreateVersementTabletScreen extends StatelessWidget {
  const TCreateVersementTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: TCreateVersementDesktopScreen()
    );
  }
}