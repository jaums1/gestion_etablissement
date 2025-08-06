import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:ecole/Employe/Controller/employe_controller.dart';
import 'package:ecole/Employe/Controller/employe_filtre.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';


class TEmployeValidation with TControllerData {
  final filitre = TEmployeFiltre();
  final controller = Get.find<TEmployeController>();

  @override
  H_Enregistrer() async{
    
  String NomComplet = "${controller.variable.Nom.text} ${controller.variable.Prenoms.text}"; 
 final index= filitre.H_Verification(param:NomComplet );

if (index !=-1) {
  TLoader.errorSnack(title: "EMPLOYE",message: "$NomComplet existe déjà");
  return;
}
    final result =await controller.H_Enregistrer();

   if(result){ 
   TLoader.successSnack(title: TText.enregistrement,message: TText.messageEnregistrer);
    Get.offNamed(TRoutes.employe);
    }
 
}

@override
  H_Modifier() async {
     final result = await controller.H_Modifier();
    if(result){ 
    TLoader.successSnack(title: TText.modification,message: TText.messageModifier);
    Get.offNamed(TRoutes.employe);
    }
  }

@override
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showQuestion(
      titre:TText.suppression,
      message: TText.messageSupprimer,
      onPressedValide: () =>controller.H_Supprimer(id: id) ,
    );
    
  }

 @override
  H_EnregistrerShowDialog() async{
     String NomComplet = "${controller.variable.Nom.text} ${controller.variable.Prenoms.text}"; 
 final index= filitre.H_Verification(param:NomComplet );

if (index !=-1) {
  TLoader.errorSnack(title: "EMPLOYE",message: "$NomComplet existe déjà");
  return;
}
    final result =await controller.H_Enregistrer();

   if(result){ 
    Get.back();
    TLoader.successSnack(title: TText.enregistrement,message: TText.messageEnregistrer);
    
    }
  }


 @override
  H_ModifierShowDialog() async {
     final result = await controller.H_Modifier();
    if(result){ 
      Get.back();
    TLoader.successSnack(title: TText.modification,message: TText.messageModifier);
    }
  }
}