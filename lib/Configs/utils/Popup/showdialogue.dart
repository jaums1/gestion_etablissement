import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Device/devices_utility.dart';

class TShowdialogue {


void showQuestion({String? titre,String? message,VoidCallback? onPressedValide}){

Get.dialog(
  barrierDismissible: false,
  AlertDialog(
  backgroundColor: TColors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8))
  ),
  title: Text(titre!,style: Theme.of(Get.context!).textTheme.headlineSmall,),
  titlePadding: EdgeInsets.all(10),
  actionsAlignment: MainAxisAlignment.end,
  actionsPadding: EdgeInsets.all(8),
  actions: [
    ElevatedButton(onPressed:onPressedValide,
           style: ElevatedButton.styleFrom(
           padding: EdgeInsets.symmetric(vertical:15,horizontal: 25),     
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ),
          child: Text("Valide")),

          ElevatedButton(
           onPressed:()=>Get.back(),
           style: ElevatedButton.styleFrom(
           foregroundColor: TColors.primary,
           backgroundColor: Colors.white,  
           padding: EdgeInsets.symmetric(vertical:15,horizontal: 25),   
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
            ),
          child: Text("Fermer"))
    
    
  ],
content: Text(message!,style: Theme.of(Get.context!).textTheme.bodyMedium ,),
contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),

));
}



void showWidget({String? titre,Widget? widgets,VoidCallback? onPressedValide,VoidCallback? onPressedFerme}){

Get.dialog(
  barrierDismissible: false,
  AlertDialog(
  backgroundColor: TColors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8))
  ),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child:titre ==""?SizedBox(): Text(titre.toString(),style: Theme.of(Get.context!).textTheme.titleLarge,)),
      Expanded(
        flex: TDeviceUtility.isMobileScreen(Get.context!)?1:1,
        child: Align(
          alignment: Alignment.centerRight,
          child: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.close))))
    ],
  ),
  titlePadding: EdgeInsets.all(10),
  actionsAlignment: MainAxisAlignment.end,
  // actionsPadding: EdgeInsets.all(8),
  // actions: [
  //   ElevatedButton(onPressed:onPressedValide,
  //          style: ElevatedButton.styleFrom(
  //          padding: EdgeInsets.symmetric(vertical:15,horizontal: 25),     
  //          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
  //           ),
  //         child: Text("Valide")),

  //         ElevatedButton(
  //          onPressed:()=>Get.back(),
  //          style: ElevatedButton.styleFrom(
  //          foregroundColor: TColors.primary,
  //          backgroundColor: Colors.white,  
  //          padding: EdgeInsets.symmetric(vertical:15,horizontal: 25),   
  //          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
  //           ),
  //         child: Text("Fermer"))
    
    
  // ],
content: widgets,
contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),

));
}

void showWidgetLoad({Widget? widgets}){
Get.dialog(
  barrierDismissible: false,
  AlertDialog(
   backgroundColor: Colors.transparent,
  content: widgets,
  // contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 15),

));
}

}