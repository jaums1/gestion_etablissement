
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/Constant/colors.dart';
import '../../../../utils/Constant/helper_function.dart';
import '../../../../utils/Constant/sizes.dart';
import '../../../../utils/Device/devices_utility.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.texte, this.icon=Iconsax.search_normal, this.showBackground=true, this.showBorder=true,
     this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });
final String texte;
final IconData? icon;
final bool showBackground,showBorder;
final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark=THelperFunction.isDarkMode(context);
    return Padding(padding: padding,
     child: Container(
       width: TDeviceUtility.getScreenWidht(),
       padding: const EdgeInsets.all(TSizes.md),
       decoration: BoxDecoration(
         color:showBackground ? dark ?TColors.dark: TColors.white : Colors.transparent,
         borderRadius: BorderRadius.circular(TSizes.cardeRaduisLg),
         border: showBorder ? Border.all(color: TColors.grey) : null,
       ),
       child: Row(
         children: [
            Icon(icon,color: TColors.darkerGrey,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text(texte,style: Theme.of(context).textTheme.bodySmall,)
         ],
       ),
     ),
    );
  }
}
