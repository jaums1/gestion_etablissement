
import 'package:flutter/material.dart';

import '../../../Configs/utils/Constant/sizes.dart';


class TViewConfigScreen extends StatelessWidget {
  const TViewConfigScreen({super.key, required this.route, this.title});
   final String route;
   final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: TSizes.md),
        child: Column(
          children: [
          
          ],
        ),
        ),
      ],
    );
  }
}