import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import 'matierecoef_controller.dart';





class TCoefficientValidation with TControllerData {
  final controller = Get.find<TCoefficientController>();


  @override
   H_Enregistrer()async{
     if (controller.coefficient.text.isEmpty || controller.coefficient.text==0.toString()){
      TLoader.errorSnack(title:TText.libCoefficient.toUpperCase(),message: TText.coefficientMessage);
      return;
     } 
  int index = 0;
    //  int index = controller.DataTableCoefficient.indexWhere(
    //   (e)=>e.DataTableMatiereCoef!.indexWhere((data)=> data.Matiere!.toLowerCase()==controller.coefficient.text.toLowerCase()
    //   && data.IDNiveauSerie==0 ));
    
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
