import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import 'matiere_controller.dart';





class TMatiereValidation with TControllerData {
  final controller = Get.find<TMatiereController>();


  @override
   H_Enregistrer()async{
     if (controller.matiere.text.isEmpty){
      TLoader.errorSnack(title:TText.libMatiere.toUpperCase(),message: TText.matiereMessage);
      return;
     } 

     int index = controller.DataTableMatiere.indexWhere((e)=>e.matiere!.toLowerCase()==controller.matiere.text.toString().toLowerCase());
    
    ////VERIFIER SI LA MATIERE A DEJA ETE SELECTIONNER
  if (index !=-1) {
    TLoader.warningSnack(title: controller.matiere.text.toString().toUpperCase(),message: TText.matiereExitseMessage);
    return;
    }
   final result = await controller.H_Enregistrer(); 
   
   if(result){
      Get.back();
      TLoader.successSnack(title:TText.enregistrer.toUpperCase().tr, message: TText.messageEnregistrer.tr);
   }  
  }

  @override
  H_Modifier() async {
     if (controller.matiere.text.isEmpty){
      TLoader.errorSnack(title:TText.libMatiere.toUpperCase(),message: TText.matiereMessage);
      return;
     } 

    final result = await controller.H_Modifier();
    if (result) {
       Get.back();
      TLoader.successSnack(title: TText.modifier.toUpperCase().tr, message: TText.messageModifier.tr);
    }
  }

  @override
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showQuestion(
      titre: TText.suppression,
      message: TText.messageSupprimer,
      onPressedValide: () {
         controller.H_Supprimer(id: id);
         Get.back();
         }
    );
  }



}
