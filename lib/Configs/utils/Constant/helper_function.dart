import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THelperFunction {
  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height; //RENVOIE LA HAUTEUR TOTAL DU TELEPHONE
  }
  
   static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;  //RENVOIE LA LARGEUR TOTAL DU TELEPHONE
  }
   
   static Size screenSize(){
    return MediaQuery.of(Get.context!).size; /// RENVOIE LA DIMENSION DE L'ECRAN
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness==Brightness.dark; //// COMPARE SI LE THEME EST SOMBRE
  }


}