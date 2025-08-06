import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../Constant/colors.dart';
import '../Constant/texte_string.dart';
import '../helpers/helpers_function.dart';

class TLoader {
  static hideSnackBar ()=> ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        width: 500,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunctions.isDarkMode(Get.context!) ? TColors.darkerGrey.withValues(alpha: 0.9) : TColors.grey.withValues(alpha: 0.9),
          ),
          child: Center(child: Text(message,style: Theme.of(Get.context!).textTheme.labelLarge,)),
        ))
    );
  } 
  
  
  
  
   static successSnack({required title,message='',duration=3}){
    Get.snackbar(title.toString().toUpperCase(), message,
    maxWidth: 600,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: TColors.primary,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: duration),
    margin: const EdgeInsets.all(10),
    icon: const Icon(Iconsax.chart_success,color: TColors.white,)
    );

  }

  static warningSnack({required title,message=''}){
    Get.snackbar(title.toString().toUpperCase(), message,
    maxWidth: 600,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: Colors.orange,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2,color: TColors.white,)
    );

  } 
  
  static errorSnack({required title,message=''}){
    Get.snackbar(title.toString().toUpperCase(), message,
    maxWidth: 400,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: Colors.red.shade600,
    snackPosition: SnackPosition.BOTTOM,
    duration: Duration(seconds: 3),
    margin: const EdgeInsets.all(10),
    icon: const Icon(Icons.error_outline,color: TColors.white,)
    );

    // ignore: unused_element
     show(){
      return showDialog(
        context: Get.context!, builder: (BuildContext context){
        return SimpleDialog(
          title: Text("Super"),
        );
      });
    }

  }

 


  static messageEnregistrer(route){
    Get.offNamed(route);
    successSnack(title:TText.enregistrer, message: TText.messageEnregistrer);
      
  }

  static messageModifier(String route){
    successSnack(title: TText.modifier, message: TText.messageModifier);
      Get.offNamed(route);
  }
  
  static messageEnregistrerDialog(){
    Get.back();
    successSnack(title:TText.enregistrer, message: TText.messageEnregistrer);
     
  }

  static messageModifierDialog(){
    Get.back();
    successSnack(title: TText.modifier, message: TText.messageModifier);
  
  }



   static messageErreur(){
    errorSnack(title: TText.erreur,message:TText.messageErreur );
   }
  static messageSupprimer(){}
 

}