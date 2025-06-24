import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import 'eleve_controller.dart';
import 'eleve_filtre.dart';

class TValidationEleve with TControllerData {
  final controller = Get.find<TEleveController>();
  final filtre      = TFiltreEleve();
  @override
  H_Enregistrer() async{
    if (filtre.H_Verification(param: controller.variable.matricule.text) !=-1) {
      TLoader.errorSnack(title: "ELEVE",message: "L'élève au matricule ${controller.variable.matricule.text} existe déjà");
      return;
    }
    final result =await controller.H_Enregistrer();
   if(result){ 
    TLoader.successSnack(title: "ENREGISTRER",message: "Vos données ont été enregistrée");
    Get.offNamed(TRoutes.eleve);
    }
 
}

@override
  H_Modifier() async {
     final result = await controller.H_Modifier();
    if(result){ 
    TLoader.successSnack(title: "MODIFIER",message: "Vos données ont été modifiée");
    Get.offNamed(TRoutes.eleve);
    }
  }

@override
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showQuestion(
      titre: "Suppression",
      message: "Voulez-vous vraiment supprimer cette ligne?",
      onPressedValide: () =>controller.H_Supprimer(id: id) ,
    );
    
  }

  @override
  H_EnregistrerShowDialog() async{
     if (filtre.H_Verification(param: controller.variable.matricule.text) !=-1) {
      TLoader.errorSnack(title: "ELEVE",message: "L'élève au matricule ${controller.variable.matricule.text} existe déjà");
      return;
    }
    final result =await controller.H_Enregistrer();
   if(result){ 
    Get.back();
    TLoader.successSnack(title: "ENREGISTRER",message: "Vos données ont été enregistrée");
    
    }
  }
@override
  H_ModifierShowDialog()async{
    final result = await controller.H_Modifier();
    if(result){ 
      Get.back();
    TLoader.successSnack(title: "MODIFIER",message: "Vos données ont été modifiée");
    
    }
  }

}