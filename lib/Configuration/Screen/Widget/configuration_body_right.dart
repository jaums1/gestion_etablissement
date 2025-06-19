
import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/styles/borderraduis_style.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../Controller/config_controller.dart';

class TConfigurationBodyRight extends StatelessWidget {
  const TConfigurationBodyRight({super.key,});
  @override
  Widget build(BuildContext context) {
     final controller  = Get.find<TConfigController>();
    return Padding(
      padding: const EdgeInsets.only(right:  15.0),
      child: Obx(()=> Column(
          children: [
            Expanded(flex: 7 ,
            child: Container(
          decoration: BoxDecoration(
            color: TColors.lightgrey,
            borderRadius: TBorderRaduis.borderRadius
          ),
        child:   controller.listeConfig[controller.index.value].route )
        ),
        Expanded(flex: 1,child: Container(
          color: TColors.white,
          child: Padding(
            padding: const EdgeInsets.only( right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              if(controller.index.value==0) 
               Flexible(
                 child: TButton.elevatedButton(text:"Suivant",
                 onPressed:()=> controller.nextStep(controller.index.value) )
               )
                else if(controller.index.value >0 && controller.index.value <= controller.listeConfig.length-2 ) 
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TButton.elevatedButton(text:"Précédente",isPrincipal: false,
                    onPressed:()=> controller.preStep(controller.index.value) ),
                  SizedBox(width: 10,),
                  TButton.elevatedButton(text:"Suivant",
                    onPressed:()=> controller.nextStep(controller.index.value) ),
                  ],
                ),
              )
              else 
               Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TButton.elevatedButton(text:"Précédente",isPrincipal: false,
                    onPressed:()=> controller.preStep(controller.index.value) ),
                  SizedBox(width: 10,),
                  TButton.elevatedButton(text:"Suivant",
                    onPressed:()=> controller.nextStep(controller.index.value) )
                  ],
                ),
              )   
              ],
            ),
          ),
        ))
          ],
        ),
      ),
    );
  }
}