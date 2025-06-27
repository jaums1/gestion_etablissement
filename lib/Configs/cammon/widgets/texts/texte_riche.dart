import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TexteRicheCustom {
 
 static Widget TexteRiches({required String textPrimaire,required String textSecondaire,
 Color? colorPrimaire=Colors.black,Color? colorSecondaire=Colors.grey,double bottom=4,
 double top=0,double left=0,double right=0}){
return Padding(
  padding: EdgeInsets.only(bottom:bottom,top:top,left:left,right:right),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TTextCustom.subtitle(text: textSecondaire,color: colorSecondaire,size:15 ),
      TTextCustom.title(text:textPrimaire.contains("null")?"":textPrimaire,color: colorPrimaire,size:16 ),
    ],
  ),
);
 }

 static Widget TexteRicheLigne({required String textPrimaire,required String textSecondaire,
 Color? colorPrimaire=Colors.black,Color? colorSecondaire=Colors.grey}){
 
  return RichText(text: TextSpan(
    children: [
    TextSpan(text: "$textSecondaire  :  ",style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
      fontSize: 15, fontFamily: 'Lato',fontWeight: FontWeight.bold,color: colorSecondaire,
      overflow: TextOverflow.ellipsis,
    )),

    TextSpan(text:textPrimaire=="null"?"":textPrimaire,style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
      fontSize: 16, fontFamily: 'Lato',fontWeight: FontWeight.w500,color: colorPrimaire,
       overflow: TextOverflow.ellipsis,
    ))
    
  ]));
 }
}