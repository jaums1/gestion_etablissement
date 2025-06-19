import 'package:flutter/material.dart';

import '../../../../../Configs/utils/Constant/colors.dart';
import 'update_scolarite_desktop.dart';

class TUpdateScolariteTabletScreen extends StatelessWidget {
  const TUpdateScolariteTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        backgroundColor: TColors.softGrey,
      body: TUpdateScolariteDesktopScreen(),
    );
    
   
  }
}

