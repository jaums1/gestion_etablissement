import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Modalite_Paiement/Controller/modalite_paiement_controller.dart';
import 'scolarite_controller.dart';


class TScolariteValidation with TControllerData {
  final controller = Get.find<TScolariteController>();
  final controllerMP = Get.find<TModalitePaiementController>();

  H_Affectation(){
     if(controllerMP.DataTableModalitePaiement.isNotEmpty){
      controller.variable.DataTableModalitePaiement.value =controllerMP.DataTableModalitePaiement.map((e)=> e).toList();
      //  controllerMP.DataTableModalitePaiement.value=controller.DataScolarite.value.DataTable!.map((e)=> e).toList();
    }
  }

  @override
  H_Enregistrer() async{
    final keys = controller.variable.keyScolarite.currentState!.validate();
    if(keys==false) return;
    if (controllerMP.DataTableModalitePaiement.isEmpty) {
      TLoader.errorSnack(title: "MODALITE DE PAIEMENT",message: "Veuillez créer votre modalité de paiement");
      return;
    } 
     if (controller.variable.DataTableNiveauScolaire.isEmpty) {
      TLoader.errorSnack(title: "NIVEAU SCOLAIRE",message: "Veuillez sélectionner votre niveau scolaire");
      return;
    }
     H_Affectation();
    final result =await controller.H_Enregistrer();
   if(result){ 
    TLoader.successSnack(title: "ENREGISTRER",message: "Vos données ont été enregistrée");
    Get.offNamed(TRoutes.scolarite);
    }
 
}

@override
  H_Modifier() async {
    H_Affectation();
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