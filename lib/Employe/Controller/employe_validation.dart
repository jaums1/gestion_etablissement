import 'package:ecole/Configs/routes/route.dart';
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
  String MatriculeEmploye =controller.variable.MatriculeEmploye.text;
 final index= filitre.H_Verification(param:NomComplet );
 final indexMatricule= filitre.H_VerificationMatricule(param: MatriculeEmploye);

if (index !=-1) {
  TLoader.errorSnack(title: "EXISTE",message: "$NomComplet existe déjà");
  return;
} else if(indexMatricule !=-1){
  TLoader.errorSnack(title: "EXISTE",message: "Le matricule $MatriculeEmploye existe déjà");
  return;
}
    final result =await controller.H_Enregistrer();
   if(result){ 
    TLoader.successSnack(title: "ENREGISTRER",message: "Vos données ont été enregistrée");
    Get.offNamed(TRoutes.employe);
    }
 
}

@override
  H_Modifier() async {
     final result = await controller.H_Modifier();
    if(result){ 
    TLoader.successSnack(title: "MODIFIER",message: "Vos données ont été modifiée");
    Get.offNamed(TRoutes.employe);
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
}