import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCombo {
  

  // DropdownButtonFormField 
//   DropdownButtonFormField dropdownButtonFormField(){
//     return DropdownButtonFormField<String>(
//   value: selectedSection,
//   decoration: InputDecoration(
//     labelText: 'Choisir une section',
//     border: OutlineInputBorder(),
//     contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//   ),
//   items: sections.map((section) {
//     return DropdownMenuItem(
//       value: section,
//       child: Text(section),
//     );
//   }).toList(),
//   onChanged: (value) {
//     selectedSection = value;
//     // Si tu es dans un StatefulWidget, n'oublie pas setState :
//     // setState(() {
//     //   selectedSection = value;
//     // });
//   },
//   validator: (value) => value == null ? 'Veuillez sélectionner une section' : null,
// );

//   }

comboTextChevale({required String label,String? valeur,required List sections,
String? error='Veuillez sélectionner',ValueChanged? onChanged,bool? ispadding=false,
String?hintText="Selectionner un pays"}){
  return Padding(
    padding: ispadding==true? EdgeInsets.zero:const EdgeInsets.only(bottom: TSizes.sm+3),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: Theme.of(Get.context!).textTheme.bodyMedium,),
          DropdownButtonFormField(
              isExpanded: true,
             value:valeur=="" || valeur==null?null:sections.contains(valeur)?valeur:null,
            decoration: InputDecoration(
              hintText: hintText,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(2))
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            ),
            items: sections.map((section) {
              return DropdownMenuItem(
          value: section,
          child: Text(section,style: TextTheme.of(Get.context!).bodyMedium,),
              );
            }).toList(),
            onChanged: onChanged,
            validator: (value) => value == null ? error : null,
          )
          
          ]
    ),
  );
}

}




