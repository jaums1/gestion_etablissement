import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTextCustom {
  
  static Text body({required String text,Color? color=Colors.black,double? size=16,
  FontWeight?  fontWeight= FontWeight.w700}){
    return Text(text.isEmpty?"":text,style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
      fontSize: size, fontFamily: 'Lato',fontWeight:fontWeight,color: color,
    ),overflow: TextOverflow.ellipsis,maxLines: 1,);
  }

  static Text title({required String text,double? size=20,Color? color=Colors.black,
  FontWeight?  fontWeight= FontWeight.w700,int? maxLines=2}){
    return Text(text.isEmpty?"":text,style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
      fontSize: size, fontFamily: 'Lato',fontWeight: fontWeight,color: color,
    ), overflow: TextOverflow.ellipsis,maxLines: maxLines,softWrap: true,);
  }

  static Text subtitle({required String text,Color? color=Colors.black,
  FontWeight?  fontWeight= FontWeight.w500,double? size=16
  }){
    return Text(text.isEmpty?"":text,style: Theme.of(Get.context!).textTheme.displayMedium!.copyWith(
      fontSize: size,fontWeight: fontWeight,
      color: color, fontFamily: 'Roboto'
    ),overflow: TextOverflow.ellipsis,maxLines: 1,);
  }
} 