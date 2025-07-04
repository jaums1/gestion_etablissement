import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:ecole/Inscription/Controller/inscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Model/versement_model.dart';
import '../Repository/versement_repository.dart';

import 'versement_variable.dart';

class TVersementController extends GetxController with TControllerData {
  static TVersementController get instance => Get.find();

  ///// DECLARATION DE VARIABLE
  var action = "";
  final variable = TVersementVariable();
  final isLoading = false.obs;
  final isInitialise = false.obs;
  var DataVersement = TVersementModel();
  var DataTableVersement = <TVersementModel>[].obs;
  var DataTableFiltreVersement = <TVersementModel>[].obs;

  final repositorycontroller = Get.put(TVersementRepository());
  final controller = Get.find<TInscriptionController>();

  //////TRAITEMENT
  HLitVersement({String? param = "AFFICHIER"}) {
    if (param == "AFFICHIER") {
      variable.IDVersement.text = DataVersement.IDVersement?.toString() ?? '';
      variable.IDInscription.text = DataVersement.IDInscription?.toString() ?? '';
      variable.Ref.text = DataVersement.Ref ?? '';
      variable.TypePaiement.text = DataVersement.TypePaiement ?? '';
      variable.Montant.text = DataVersement.Montant?.toString() ?? '';
      variable.DateVersement.text = TFormatters.formatDate(DataVersement.DateVersement);
      variable.DateProchainVersement.text =TFormatters.formatDate(DataVersement.DateProchainVersement) ;
    } else {
      // DataVersement.IDAnneeScolaire = int.tryParse(variable.IDAnneeScolaire.text);
      DataVersement.IDInscription = controller.DataInscription.value.IDInscription;
      DataVersement.Ref = variable.Ref.text;
      DataVersement.TypePaiement = variable.TypePaiement.text;
      DataVersement.Montant = int.tryParse(variable.Montant.text);

    }
  }

  //// INITIALISER
  // @override
  // void onInit() {
  //   H_RecupeData();
  //   super.onInit();
  // }

  ///// ENREGISTREMENT
  @override
  H_Enregistrer() async {
    try {
      HLitVersement(param: "ENVOYER");
      /// COMPARAISON
      if(controller.DataInscription.value.ResteAPayer! < DataVersement.Montant!){
       TLoader.errorSnack(title: "Erreur",message: "Le montant saisi dépasse le reste à payer.");
        return false;
      }

      TShowdialogue().showWidgetLoad(widgets:
        TAnimationLoaderWidget(text: "enregistrement en cours...", color: Colors.white,
          animation: TImages.docerAnimation, width: 250,));
      final result = await repositorycontroller.H_EnregistrerData(DataVersement);
      controller.H_RecupeData();
      Get.back();
      if (result == false) {
        TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
        return false;
      }
      return true;
    } catch (e) {
      TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion source erreur $e");
      return false;
    }
  }

  // SUPPRIMER
  @override
  H_Supprimer({int? id, String? param}) async {
    try {
      TShowdialogue().showWidgetLoad(widgets:
        TAnimationLoaderWidget(text: "Suppression en cours...", color: Colors.white,
          animation: TImages.docerAnimation, width: 250,));
      final result = await repositorycontroller.H_SupprimerData(id);
      Get.back();
      if (result == false) {
        TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
        return false;
      }
      H_RecupeData(param: id.toString());
      Get.back();
      TLoader.successSnack(title: "SUPPRIMER", message: "La ligne a bien été supprimée");
      return true;
    } catch (e) {
      TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion source erreur $e");
      return;
    }
  }

  // MODIFICATION
  @override
  H_Modifier() async {
    try {
      HLitVersement(param: "ENVOYER");
      TShowdialogue().showWidgetLoad(widgets:
        TAnimationLoaderWidget(text: "Modification en cours...", color: Colors.white,
          animation: TImages.docerAnimation, width: 250,));
      final result = await repositorycontroller.H_ModifierData(DataVersement);
      controller.H_RecupeData();
      Get.back();
      if (result == false) {
        TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
        return false;
      }
      return true;
    } catch (e) {
      TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
      return false;
    }
  }

  @override
  void H_RecupeData({String? param}) async {
    try {
      isLoading.value = false;
      DataTableVersement.clear();
      final data = await repositorycontroller.H_RecupData(param: param);
      isLoading.value = true;
      if (data is List) {
        DataTableVersement.value = data.map((datas) => TVersementModel.fromMap(datas)).toList();
        DataTableFiltreVersement.value = DataTableVersement;
      }
      data == null ? TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion") : "";
    } catch (e) {
      TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion source erreur $e");
      return;
    }
  }

  @override
  void H_RecupeModif({int? id, String? param}) {
    // TVersementFiltre().H_FiltreElementParID(id: id);
    HLitVersement();
  }

  @override
  void H_Initialise() {
    DataVersement = TVersementModel();
  }

   void H_MiseAjour(){
     
   }
} 