import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCheckBox {
  

  CheckboxListTile checkboxListTile({bool? isSelect,ValueChanged? procedure,String? titre,bool? isMajuscule=false}){

    return CheckboxListTile(
      value: isSelect,
      onChanged:procedure,
      selected: isSelect!,
      title: Text(isMajuscule==true?titre!.toUpperCase():titre!,
                  style: Theme.of(Get.context!).textTheme.bodyMedium,),
      dense: true,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}