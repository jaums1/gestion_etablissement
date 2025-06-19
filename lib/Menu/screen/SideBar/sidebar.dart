
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Configs/routes/route.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/image_string.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import 'items_menu.dart';

class TSideBar extends StatelessWidget {
  const TSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      backgroundColor: TColors.white,
      child:SingleChildScrollView(
        child: Column(
          children: [
            ///// IMAGES 
          Image.asset(TImages.appLogo,width: 100,height: 100,),
           SizedBox(height: TSizes.spaceBtwSections,),
           Align(
            alignment: Alignment.centerLeft,
             child: Padding(padding: EdgeInsets.all(8),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
              children: [
                      //// TEXTE APP NAME
              Text(TText.appName,style: Theme.of(context).textTheme.bodyMedium!.apply(letterSpacingDelta: 1.2),) ,
               SizedBox(height: TSizes.spaceBtwItems,),
               TItemsMenu(text: "Eleve",iconData: Iconsax.user,route: TRoutes.menu,),
               TItemsMenu(text: "Direction",iconData: Iconsax.direct_right,route: TRoutes.config,),
               ElevatedButton(onPressed: (){
                // TConfigurationScreen().shows();
               }, child: Text("Clique"))
              //  TItemsMenu(text: "Direction",iconData: Iconsax.direct_right,),
              //  TItemsMenu(text: "Direction",iconData: Iconsax.direct_right,),
              //  TItemsMenu(text: "Direction",iconData: Iconsax.direct_right,),
              //  TItemsMenu(text: "Direction",iconData: Iconsax.direct_right,),
              //  TItemsMenu(text: "Direction",iconData: Iconsax.direct_right,),
              //  TItemsMenu(text: "Direction",iconData: Iconsax.direct_right,),
              
              ],
             ),
             ),
           ),
            

            SizedBox(height: TSizes.sm,),  
           
           
          ],
        ),
      ) ,
    );
  }
}
