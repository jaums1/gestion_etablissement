import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';

import '../../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import 'niveau_serie_controller.dart';

class TNiveauSerieValidation with TControllerData {
  final controller = Get.find<TNiveauSerieController>();
  final controllerNiveau = Get.find<TNiveauScolaireController>();
  // final filtre = TInscriptionFiltre();

  @override
  H_Enregistrer() async {
   
   if(controllerNiveau.DataNiveau.value.iDNiveauScolaire==0 || controllerNiveau.DataNiveau.value.iDNiveauScolaire==null){
      TLoader.errorSnack(title: "NIVEAU SCOLAIRE", message: "Veuillez sélectionner votre niveau scolaire");
      return;
    }
     
   if(controller.isSelectNiveauSerie.isEmpty){
      TLoader.errorSnack(title: "SERIE", message: "Veuillez sélectionner votre serie");
      return;
    }
    
    
    final result = await controller.H_Enregistrer();
    if (result) {
        Get.back();
      TLoader.successSnack(title:TText.enregistrer.toUpperCase().tr, message: TText.messageEnregistrer.tr);
    }
  }

  @override
  H_Modifier() async {
     if(controller.isSelectNiveauSerie.isEmpty){
      TLoader.errorSnack(title: "SERIE", message: "Veuillez sélectionner votre serie");
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