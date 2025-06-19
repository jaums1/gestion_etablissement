
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/sizes.dart';

class TShowDialog {
  
  static showDialogs({Color? color =TColors.lightgrey,Widget? widgetTitle,Widget? widgetBody,
  double? elevation =10,Color? backgroundColor =Colors.white,List<Widget>? widgetListe
  }){
    return showDialog(
      barrierColor: color,
      context: Get.context!,
       builder: (BuildContext context){
        return SimpleDialog(
          title: widgetTitle,
          titlePadding:EdgeInsets.only(left: TSizes.md,top: TSizes.sm,bottom: TSizes.lg/2),
          contentPadding: EdgeInsets.zero,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(TSizes.xs),),
           backgroundColor:backgroundColor ,
            elevation: elevation,
            children:widgetListe,

        );
       });
  }
}