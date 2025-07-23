import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import 'annee_scolaire_controller.dart';






class TAnneeScolaireValidation with TControllerData {
  final controller = Get.find<TAnneeScolaireController>();


  @override
   H_Enregistrer()async{
     if (controller.variable.AnneeScolaire.text.isEmpty){
      TLoader.errorSnack(title:TText.libAnneeScolaire.toUpperCase(),message: TText.anneeScolaireMessage);
      return;
     } 

     int index = controller.DataTableAnneeScolaire.indexWhere((e)=>e.AnneeScolaire!.toLowerCase()==controller.variable.AnneeScolaire.text.toString().toLowerCase());
    
    ////VERIFIER SI LA MATIERE A DEJA ETE SELECTIONNER
  if (index !=-1) {
    TLoader.warningSnack(title: controller.variable.AnneeScolaire.text.toString().toUpperCase(),message: TText.anneeScolaireExitseMessage);
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
     if (controller.variable.AnneeScolaire.text.isEmpty){
      TLoader.errorSnack(title:TText.libAnneeScolaire.toUpperCase(),message: TText.anneeScolaireMessage);
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
