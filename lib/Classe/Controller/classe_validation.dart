import 'package:ecole/Classe/Controller/classe_filtre.dart';
import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import 'classe_controller.dart';


class TClasseValidation with TControllerData {
  final controller = Get.find<TClasseController>();
  final filitre = TClasseFiltre();
  @override
  H_Enregistrer() async{
    if (filitre.H_Verification(param: controller.variable.LibClasse.text)!=-1) {
      TLoader.errorSnack(title: "CLASSE",message: "La classe ${controller.variable.LibClasse.text} existe déjà");
      return;
    }
    final result =await controller.H_Enregistrer();
   if(result){ 
    TLoader.successSnack(title: "ENREGISTRER",message: "Vos données ont été enregistrée");
    Get.offNamed(TRoutes.classe);
    }
 
}

@override
  H_Modifier() async {
     final result = await controller.H_Modifier();
    if(result){ 
    TLoader.successSnack(title: "MODIFIER",message: "Vos données ont été modifiée");
    Get.offNamed(TRoutes.classe);
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