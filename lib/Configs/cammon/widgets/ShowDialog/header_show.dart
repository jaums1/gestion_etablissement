import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/sizes.dart';

class THeaderShowDialog extends StatelessWidget {
  const THeaderShowDialog({super.key, required this.tilte});
  final String tilte;
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      padding: const EdgeInsets.only(left: TSizes.md,top: TSizes.sm,bottom: TSizes.lg/2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(tilte,style: Theme.of(context).textTheme.bodyMedium!.apply(
            color: TColors.darkerGrey,fontSizeDelta: 10,letterSpacingDelta: 1.2
          ),),
          IconButton(onPressed: ()=>Get.back(), icon: Icon(Iconsax.close_square))
        ],
      ),
    );
  }
}