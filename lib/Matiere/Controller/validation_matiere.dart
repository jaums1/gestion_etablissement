import 'package:ecole/Matiere%20coef/Screen/Widget/editermatiere.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import 'matiere_controller.dart';


mixin class TValidattionMatiere {
  void H_Enregistrer({String? param}){}
  void H_Modifier({String? param}){}
  void H_OnSelect({String? param}){}
  void H_Supprimer({String? param}){}
  void H_Fermer(){}
}
final controller = Get.find<TMatiereController>();

class TEnregistrerMatiere with TValidattionMatiere {
  
  @override
  void H_OnSelect({String? param}) {
    controller.matiere = TextEditingController();
   
    TShowdialogue().showWidget( titre: "Matiere",
    widgets: TEditerMatiere(),
    onPressedValide: ()=> H_Enregistrer()
    );
  }

  @override
  void H_Enregistrer({String? param}){
     if (controller.matiere.text.isEmpty){
      TLoader.errorSnack(title: "MATIERE",message: "Veuillez entrer votre matière");
      return;
     } 

     int index = controller.dataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==controller.matiere.text.toString().toLowerCase());
    
    ////VERIFIER SI LA MATIERE A DEJA ETE SELECTIONNER
  if (index !=-1) {TLoader.warningSnack(title: controller.matiere.text.toString().toUpperCase(),message: "La matière existe déjà");
    return;}
    controller.H_Enregistrer(); 
    Get.back();   
  }

}

class TModifierMatiere with TValidattionMatiere{

   @override
  void H_OnSelect({String? param}) {
    controller.matiere = TextEditingController();
    int index = controller.dataTableMatiere.indexWhere((e)=>e.iDMatiere==int.parse(param.toString()));
       controller.matiereModel=  controller.dataTableMatiere[index];
       controller.matiere.text=  controller.dataTableMatiere[index].matiere.toString();

    TShowdialogue().showWidget( titre: "Matiere",
    widgets: TEditerMatiere( ),
    onPressedValide: ()=> H_Modifier(param: param),
    );
     
  }

@override
  void H_Modifier({String? param}) {
   if (controller.matiere.text.isEmpty ){
      TLoader.errorSnack(title: "MATIERE",message: "Veuillez entrer la matière");
      return;
     } 
    controller.H_Modifier(); 
    Get.back();   
  }


}

class TSupprimerCoefficient with TValidattionMatiere {
   @override
  void H_Supprimer({String? param}) {
    int index = controller.dataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==param.toString().toLowerCase());
    controller.dataTableMatiere.removeAt(index);
    Get.back();
  }
}