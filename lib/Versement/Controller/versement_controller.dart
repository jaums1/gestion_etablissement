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

import 'versement_filtre.dart';
import 'versement_variable.dart';

class TVersementController extends GetxController with TControllerData {
  static TVersementController get instance => Get.find();

  ///// DECLARATION DE VARIABLE
  var action = "";
  final variable = TVersementVariable();
  final isLoading = false.obs;
  final isInitialise = false.obs;
  var DataVersement = TVersementModel().obs;
  var DataTableVersement = <TVersementModel>[].obs;
  var DataTableFiltreVersement = <TVersementModel>[].obs;

  final repositorycontroller = Get.put(TVersementRepository());
  final controller = Get.find<TInscriptionController>();
  // final filtreVersement = TVersementFiltre();

  //////TRAITEMENT
  HLitVersement({String? param = "AFFICHIER"}) {
    if (param == "AFFICHIER") {
      variable.IDVersement.text = DataVersement.value.IDVersement?.toString() ?? '';
      variable.IDInscription.text = DataVersement.value.IDInscription?.toString() ?? '';
      variable.Ref.text = DataVersement.value.Ref ?? '';
      variable.TypePaiement.text = DataVersement.value.TypePaiement ?? '';
      variable.Montant.value.text = DataVersement.value.Montant?.toString() ?? '';
      variable.DateVersement.text = TFormatters.formatDateFr(DataVersement.value.DateVersement);
      variable.DateProchainVersement.text =TFormatters.formatDateFr(DataVersement.value.DateProchainVersement) ;
    } else {
      // DataVersement.IDAnneeScolaire = int.tryParse(variable.IDAnneeScolaire.text);
      DataVersement.value.IDInscription = controller.DataInscription.value.IDInscription;
      DataVersement.value.Ref = variable.Ref.text;
      DataVersement.value.TypePaiement = variable.TypePaiement.text;
      DataVersement.value.Montant = int.tryParse(variable.Montant.value.text);

    }
  }

  //// INITIALISER
  @override
  void onInit() {

    super.onInit();
    variable.Montant.value.addListener((){
      variable.text.value = variable.Montant.value.text;
    });
  }

  ///// ENREGISTREMENT
  @override
  H_Enregistrer() async {
    try {
      HLitVersement(param: "ENVOYER");
      /// COMPARAISON
      if(controller.DataInscription.value.ResteAPayer! < DataVersement.value.Montant!){
       TLoader.errorSnack(title: "Erreur",message: "Le montant saisi dépasse le reste à payer.");
        return false;
      }

      TShowdialogue().showWidgetLoad(widgets:
        TAnimationLoaderWidget(text: "enregistrement en cours...", color: Colors.white,
          animation: TImages.docerAnimation, width: 250,));
      final result = await repositorycontroller.H_EnregistrerData(DataVersement.value);
      
      if (result == false) {
        TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
        return false;
      }
      controller.H_RecupeData();
      Get.back();
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
      final data = await repositorycontroller.H_SupprimerData(id);

      if (data == false) {
         Get.back();
        TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
        return false;
      }
      
      H_RecupeData(param: controller.DataInscription.value.IDInscription.toString());
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
      final result = await repositorycontroller.H_ModifierData(DataVersement.value);
      // controller.H_RecupeData();
       
      Get.back();
      if (result == false) {
        TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
        return false;
      }
   
       H_RecupeData(param: controller.DataInscription.value.IDInscription.toString());
      return true;
    } catch (e) {
      TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexionS $e");
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
    final filtreVersement = TVersementFiltre();
    filtreVersement.H_FiltreElementParID(id: id);
    HLitVersement();
  }

  @override
  void H_Initialise() {
    DataVersement.value = TVersementModel();
  }

   void H_MiseAjour(){
  
    controller.DataInscription.value.MontantVersement =0;
     for (var element in DataTableVersement) {

      controller.DataInscription.value.MontantVersement =controller.DataInscription.value.MontantVersement! + element.Montant!;
        if(element.DateProchainVersement!.isAfter(controller.DataInscription.value.DateProchainVersement!)){
           controller.DataInscription.value.DateProchainVersement =element.DateProchainVersement;
          
        }
     }
     int frais = controller.DataInscription.value.FraisAnnexe! +controller.DataInscription.value.DroitInscription!;
     controller.DataInscription.value.Paiement = controller.DataInscription.value.MontantVersement! +frais;

     controller.DataInscription.value.ResteAPayer = controller.DataInscription.value.NetAPayer! - controller.DataInscription.value.Paiement!;

      if(controller.DataInscription.value.ResteAPayer! >0){
       controller.DataInscription.value.Statut ="Non Solde";
      }else{
       controller.DataInscription.value.Statut ="Solde";
      }
    
      
      
   }
   
   


} 