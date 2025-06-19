import 'package:flutter/material.dart';

import '../../../../../Configs/utils/Constant/colors.dart';
import 'update_scolarite_desktop.dart';

class TUpdateScolariteMobileScreen extends StatelessWidget {
  const TUpdateScolariteMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        backgroundColor: TColors.softGrey,
      body: TUpdateScolariteDesktopScreen(),
    );
  }
}

