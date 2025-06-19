import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import 'scolarite_controller.dart';


class TScolariteValidation with TControllerData {
  final controller = Get.find<TScolariteController>();
  @override
  H_Enregistrer() async{
    final keys = controller.variable.keyScolarite.currentState!.validate();
    if(keys==false) return;
    if (controller.variable.DataTableModalitePaiement.isEmpty) {
      TLoader.errorSnack(title: "MODALITE DE PAIEMENT",message: "Veuillez créer votre modalité de paiement");
      return;
    } 
     if (controller.variable.DataTableNiveauSerie.isEmpty) {
      TLoader.errorSnack(title: "NIVEAU SERIE",message: "Veuillez sélectionner votre niveau serie");
      return;
    }
    
    final result =await controller.H_Enregistrer();
   if(result){ 
    TLoader.successSnack(title: "ENREGISTRER",message: "Vos données ont été enregistrée");
    Get.offNamed(TRoutes.scolarite);
    }
 
}

@override
  H_Modifier() async {
     final result = await controller.H_Modifier();
    if(result){ 
    TLoader.successSnack(title: "MODIFIER",message: "Vos données ont été modifiée");
    Get.offNamed(TRoutes.scolarite);
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