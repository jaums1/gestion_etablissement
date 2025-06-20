import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/Constant/colors.dart';

class TButton {
  
static Widget elevatedButton({
String? text,double? padding=15.0,VoidCallback? onPressed,bool? isPrincipal=true
  }){
    return SizedBox(
           width:TDeviceUtility.isMobileScreen(Get.context!)? 100:null,
      child: ElevatedButton(
             onPressed:onPressed,
             style: ElevatedButton.styleFrom(
             foregroundColor:isPrincipal==true?null: TColors.primary,
             backgroundColor:isPrincipal==true?null: Colors.white,  
             padding: EdgeInsets.all(padding!),     
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ),
            child:TDeviceUtility.isMobileScreen(Get.context!)?Tooltip(
              message: text,
              child:Text(text!,maxLines: 1,overflow: TextOverflow.ellipsis,) ,
            ): Text(text!,maxLines: 1,overflow: TextOverflow.ellipsis,)),
    );
  }
  
static Widget iconButton({
String? text,double? padding=15.0,VoidCallback? onPressed,bool? isPrincipal=true,
IconData? icon,double? size=20,
Color? color=Colors.white,Color? backgroundColor= TColors.primary
  }){
    return Container(
           width:TDeviceUtility.isMobileScreen(Get.context!)? 100:null,
           decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5)
           ),
      child: IconButton(
             onPressed:onPressed,
              icon: Icon(icon,size:size ,color: color,),
              tooltip: text,
            ),
    );
  }


static Widget ValidateButton({required String titre,VoidCallback? onPressed}){
  return  Align(
              alignment:TDeviceUtility.isDesktopScreen(Get.context!)? Alignment.centerLeft: Alignment.center,
              child:SizedBox(
                width:TDeviceUtility.isDesktopScreen(Get.context!)?
                 MediaQuery.of(Get.context!).size.width*0.1:  MediaQuery.of(Get.context!).size.width*0.4,
                child: TButton.elevatedButton(text:"Valider",onPressed: onPressed)),
              );
}
}

