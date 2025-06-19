import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Screen/Widget/editercoefficient_matiere.dart';


mixin class TCoefficient {
  void H_Enregistrer({String? param}){}
  void H_Modifier({String? param}){}
  void H_OnSelect({String? param}){}
  void H_Supprimer({String? param}){}
}


class TValidationCoefficient with TCoefficient {
  final controller = Get.find<TCoefficientController>();
  @override
  void H_OnSelect({String? param}) {
    controller.coefficient = TextEditingController();
    int index = controller.dataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==param.toString().toLowerCase());
    
    ////VERIFIER SI LA MATIERE A DEJA ETE SELECTIONNER
  if (index !=-1) {TLoader.warningSnack(title: param.toString().toUpperCase(),message: "La matière a déjà été sélectionner");
    return;}
    TShowdialogue.showWidget( titre: "Matiere",
    widgets: TEditerCoefficient( titre:param,),
    onPressedValide: ()=> H_Enregistrer(param: param)
    );
  }

  @override
  void H_Enregistrer({String? param}) {
     if (controller.coefficient.text.isEmpty || controller.coefficient.text==0.toString()){
      TLoader.errorSnack(title: "COEFFICIENT",message: "Veuillez entrer le coefficient");
      return;
     } 
     int index = controller.controllerMatiere.dataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==param.toString().toLowerCase()); 
     if(index==-1) return;
      controller.dataTableMatiere.add(controller.controllerMatiere.dataTableMatiere[index]);
  int result= controller.dataTableMatiere.length;
  controller.dataTableMatiere[result-1].coef = double.parse(controller.coefficient.text);
  Get.back();  
  }

}

class TModificationCoefficient with TCoefficient{
  final controller = Get.find<TCoefficientController>();
   @override
  void H_OnSelect({String? param}) {
    controller.coefficient = TextEditingController();
    int index = controller.dataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==param.toString().toLowerCase());
       controller.coefficient.text=  controller.dataTableMatiere[index].coef.toString();

    TShowdialogue.showWidget( titre: "Matiere",
    widgets: TEditerCoefficient( titre:param,),
    onPressedValide: ()=> H_Modifier(param: param)
    );
  }

@override
  void H_Modifier({String? param}) {
   if (controller.coefficient.text.isEmpty || controller.coefficient.text==0.toString()){
      TLoader.errorSnack(title: "COEFFICIENT",message: "Veuillez entrer le coefficient");
      return;
     } 
     int index = controller.dataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==param.toString().toLowerCase()); 
     if(index==-1) return;
     controller.dataTableMatiere.add(controller.controllerMatiere.dataTableMatiere[index]);
     controller.dataTableMatiere[index].coef = double.parse(controller.coefficient.text);
     controller.dataTableMatiere.removeAt(controller.dataTableMatiere.length-1);
  Get.back();  
  }
}

class TSupprimerCoefficient with TCoefficient {
  final controller = Get.find<TCoefficientController>();

   @override
  void H_Supprimer({String? param}) {
    int index = controller.dataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==param.toString().toLowerCase());
    controller.dataTableMatiere.removeAt(index);
    Get.back();
  }
}