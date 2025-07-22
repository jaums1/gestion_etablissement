import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCheckBox {
  

  CheckboxListTile checkboxListTile({bool? isSelect =false,ValueChanged? procedure,String? titre,bool? isMajuscule=false,
  Widget? child,bool? isWidget=false}){

    return CheckboxListTile(
      value: isSelect,
      onChanged:procedure,
      selected: isSelect??false,
      title:isWidget==true? child  : Text(isMajuscule==true?titre!.toUpperCase():titre!,
                  style: Theme.of(Get.context!).textTheme.bodyMedium,softWrap: true,maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
      dense: true,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}