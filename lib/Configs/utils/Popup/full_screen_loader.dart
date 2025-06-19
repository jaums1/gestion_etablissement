import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../Constant/colors.dart';
import '../Constant/helper_function.dart';
import 'animation_loader.dart';

class TFullScreenLoader {
  
  static void openLoadingDialog(String text,String animation){
    showDialog(context: Get.overlayContext!,
    barrierDismissible: false,
     builder: (_)=>PopScope(
      canPop: false,
      child: Container(
        color: THelperFunction.isDarkMode(Get.context!)?TColors.dark : TColors.white,
        height: double.infinity,
        width: double.infinity,
        child:Column(
          children: [
            
            const SizedBox(height: 100,),
            TAnimationLoaderWidget(text: text,animation: animation,)
          ],
        ) ,
      )
      )
      );
  }

  static void popUpCircular(){
    Get.defaultDialog(
      title: '',
      onWillPop: ()async=>false,
      backgroundColor: Colors.transparent,
      // content: TCircularLoader()
    );
  }

  static void stopLoading(){
    Navigator.of(Get.context!).pop();
  }
}