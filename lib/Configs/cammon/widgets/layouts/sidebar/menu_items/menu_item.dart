import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/Constant/colors.dart';
import '../../../../../utils/Constant/sizes.dart';
import '../sidebar_controller.dart';


class TMenuItem extends StatelessWidget {
  const TMenuItem({super.key, this.itemName, this.route, this.icon});
  final String? itemName;
  final String? route;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final menuController  = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route!),
      onHover: (value) => value ? menuController.changehoverItem(route!): menuController.changehoverItem(""),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.cardeRaduisMd),
              color:menuController.isHover(route.toString()) || menuController.isActived(route.toString())? TColors.primary : Colors.transparent
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.only(left: TSizes.lg,right: TSizes.md,top: TSizes.md,bottom: TSizes.md),
                child:menuController.isActived(route.toString()) ? 
                Icon(icon,size: 22,color: TColors.white,):
                Icon(icon,size: 22,color:menuController.isHover(route.toString())? TColors.white : TColors.darkGrey,),
                
                
                ), 
                 
                if(menuController.isHover(route.toString()) || menuController.isActived(route.toString()))
                    Flexible(child: Text(itemName!,style:Theme.of(context).textTheme.bodyMedium?.apply(color: TColors.white)))
                else
                 Flexible(child: Text(itemName!,style:Theme.of(context).textTheme.bodyMedium?.apply(color: TColors.darkGrey)))
               
              ],
            ),            
          ),
        ),
      ),
    );
  }
}