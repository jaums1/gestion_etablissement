import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Classe/Controller/classe_controller.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/Statut/statut.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import '../Model/inscription_model.dart';
import '../Repository/inscription_repository.dart';
import 'inscription_filtre.dart';
import 'inscription_variable.dart';

class TInscriptionController extends GetxController with TControllerData {
  static TInscriptionController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
  var action = "";
  final variable = TInscriptionVariable();
  final isLoading = false.obs;
  final isInitialise = false.obs;
  var isFraisAnnexe = false.obs;
  var isFraisInscription = false.obs;
  var DataInscription = TInscriptionModel();
  var DataTableInscription = <TInscriptionModel>[].obs;
  var DataTableFiltreInscription = <TInscriptionModel>[].obs;

  final repositorycontroller = Get.put(TInscriptionRepository());
  final controllerClasse     = Get.find<TClasseController>();
  final controllerEleve      = Get.find<TEleveController>();

  //////TRAITEMENT
  HLitInscription({String? param = "AFFICHIER"}) {
    if (param == "AFFICHIER") {
      variable.IDInscription.text    = DataInscription.IDInscription.toString();
      variable.IDClasse.text         = DataInscription.IDClasse.toString();
      variable.MontantVersement.text = DataInscription.MontantVersement.toString();
      variable.DroitInscription.text = DataInscription.DroitInscription.toString();
      variable.FraisAnnexe.text      = DataInscription.FraisAnnexe.toString();
      variable.DateInscription.text  = DataInscription.DateInscription.toString();
      variable.NetAPayer.text        = DataInscription.NetAPayer.toString();
      variable.ResteAPayer.text      = DataInscription.ResteAPayer.toString();
      variable.Paiement.text         = DataInscription.Paiement.toString();
      variable.IDEtudiant.text          = DataInscription.IDEtudiant.toString();
      variable.Statut.text           = DataInscription.Statut.toString();
    } else {
      
      DataInscription.IDClasse        = controllerClasse.DataClasse.value.IDClasse;
      DataInscription.IDEtablissement = controllerClasse.DataClasse.value.IDEtablissement;
      DataInscription.MontantVersement= int.tryParse(variable.MontantVersement.text) ?? 0;
      DataInscription.DroitInscription= int.tryParse(variable.DroitInscription.text) ?? 0;
      DataInscription.FraisAnnexe     = int.tryParse(variable.FraisAnnexe.text) ?? 0;
      int sommeAnnexeInscription      = DataInscription.FraisAnnexe!+ DataInscription.DroitInscription!;
      int scolarite                   = int.parse(variable.Scolarite.text);
      DataInscription.NetAPayer       = sommeAnnexeInscription+scolarite;
      
      DataInscription.ResteAPayer     =  DataInscription.NetAPayer! -DataInscription.MontantVersement!-sommeAnnexeInscription;
      DataInscription.Paiement        = sommeAnnexeInscription+DataInscription.MontantVersement!;
      DataInscription.IDEtudiant      = controllerEleve.DataEleve.value.IDEtudiant;
      DataInscription.Statut          = TStatutCustom.paiement(DataInscription.ResteAPayer);
     ;
    }
  }

  ///// ENREGISTREMENT 
  @override
  H_Enregistrer() async {
    try {
      HLitInscription(param: "ENVOYER");

      print(DataInscription.toMap());
      ///LOADING
      // TShowdialogue().showWidgetLoad(widgets: 
      //   TAnimationLoaderWidget(text: "enregistrement en cours...", color: Colors.white,
      //     animation: TImages.docerAnimation, width: 250,));
      // ///// ENVOIE DES DONNEES
      // final result = await repositorycontroller.H_EnregistrerData(DataInscription);
      // ///// FERMER LOADING
      // Get.back();
      // ///// TRAITEMENT RESULTAT
      // if (result == false) {
      //   TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
      //   return false;
      // }
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
      ///LOADING
      TShowdialogue().showWidgetLoad(widgets: 
        TAnimationLoaderWidget(text: "Suppression en cours...", color: Colors.white,
          animation: TImages.docerAnimation, width: 250,));

      ///// ENVOIE DES DONNEES
      final result = await repositorycontroller.H_SupprimerData(id);
      ///// FERMER LOADING
      Get.back();
      ///// TRAITEMENT RESULTAT   
      if (result == false) {
        TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion");
        return false;
      }
      H_RecupeData();
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
      HLitInscription(param: "ENVOYER");
      ///LOADING
      TShowdialogue().showWidgetLoad(widgets: 
        TAnimationLoaderWidget(text: "Modification en cours...", color: Colors.white,
          animation: TImages.docerAnimation, width: 250,));

      ///// ENVOIE DES DONNEES
      final result = await repositorycontroller.H_ModifierData(DataInscription);
      ///// FERMER LOADING
      Get.back();
      ///// TRAITEMENT RESULTAT 
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
      DataTableInscription.clear();
      final data = await repositorycontroller.H_RecupData(param: param);
      isLoading.value = true;
      if (data is List) {
        //// RECUPERER LA LISTE DES INSCRIPTIONS
        DataTableInscription.value = data.map((datas) => TInscriptionModel.fromMap(datas)).toList();
        DataTableFiltreInscription.value = DataTableInscription;
      }
      data == null ? TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion") : "";
    } catch (e) {
      TLoader.errorSnack(title: "Erreur", message: "Veuillez vérifier votre connexion source erreur $e");
      return;
    }
  }
  
  @override
  void H_RecupeModif({int? id, String? param}) {
    TInscriptionFiltre().H_FiltreElementParID(id: id);
    HLitInscription();
  }

  @override
  void H_Initialise() {
    DataInscription = TInscriptionModel();
  }

 

} 