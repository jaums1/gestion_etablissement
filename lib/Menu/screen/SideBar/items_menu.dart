
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Configs/cammon/widgets/layouts/sidebar/sidebar_controller.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/sizes.dart';

class TItemsMenu extends StatelessWidget {
  const TItemsMenu({
    super.key,this.text,this.iconData, this.color =Colors.white, this.route
  });
 final String? text;
 final String? route;
 final IconData? iconData;
 final Color? color;
  @override
  // ()=>
  Widget build(BuildContext context) {
    final controller = Get.find<SidebarController>();
    return InkWell(
      onTap: ()=>controller.menuOnTap(route!),
      onHover:(values)=>values ? controller.changehoverItem(route!):controller.changehoverItem(""),
      child: Obx(
        ()=> Padding(padding: EdgeInsets.symmetric(vertical: TSizes.xs),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(TSizes.cardeRaduisMd),
               color: controller.isHover(route.toString()) || controller.isActived(route.toString())? TColors.primary : Colors.transparent
             ),
             child: Row(
               // mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: TSizes.sm,vertical: TSizes.sm,),
                 child:controller.isActived(route.toString()) ? 
                  Icon(iconData,size: 22,color: TColors.white,):
                  Icon(iconData,size: 22,color:controller.isHover(route.toString())? TColors.white : TColors.darkGrey,),
                  
                 ),
        
                 if(controller.isHover(route.toString()) || controller.isActived(route.toString()))
                      Flexible(child: Text(text.toString(),style:Theme.of(context).textTheme.bodyMedium?.apply(color: TColors.white)))
                  else
                   Flexible(child: Text(text.toString(),style:Theme.of(context).textTheme.bodyMedium?.apply(color: TColors.darkGrey)))
                 
                
               ],
             ),
           ),
          ),
      ),
      
    );
  }
}