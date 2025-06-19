import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import '../Model/scolarite_model.dart';
import '../Repository/scolarite_repository.dart';
import 'scolarite_filtre.dart';
import 'scolarite_variable.dart';

class TScolariteController extends GetxController with TControllerData{
   static TScolariteController get instance => Get.find();
  ///// DECLARATION DE VARIABLE 
  final variable =TScolariteVariable();
  final isLoading=false.obs;
  var edite       = false.obs;
  var DataScolarite = TScolariteModel().obs;
  var DataTableScolarite =<TScolariteModel>[].obs;
  var DataTableFiltreScolarite =<TScolariteModel>[].obs;
 
  final repositorycontroller    = Get.put(TScolariteRepository());
  final controllerNiveauSerie    = Get.find<TNiveauSerieController>();
  
  //////TRAITEMENT
  HLitScolarite({String? param = "AFFICHIER"}) {
    if (param == "AFFICHIER") {

      variable.MontantScolarite.text = DataScolarite.value.MontantScolarite.toString();
      variable.FraisAnnexe.text = DataScolarite.value.FraisAnnexe.toString();
      variable.FraisInscription.text =DataScolarite.value.FraisInscription.toString();
      variable.IDNiveauSerie.text = DataScolarite.value.IDNiveauSerie.toString();
      variable.NiveauSerie.text = DataScolarite.value.DataNiveauSerie!.niveauSerie.toString();
      variable.DataTableModalitePaiement.value =DataScolarite.value.DataTable!.map((e)=> e).toList();
      // variable.DataTableNiveauSerie.value =DataScolarite.value.DataTableNiveauSerie!.isEmpty? []: DataScolarite.value.DataTableNiveauSerie!;
    } else {
      DataScolarite.value.MontantScolarite =int.parse(variable.MontantScolarite.text);
      DataScolarite.value.FraisAnnexe =variable.FraisAnnexe.text.isEmpty?0: int.parse(variable.FraisAnnexe.text);
      DataScolarite.value.FraisInscription =variable.FraisInscription.text.isEmpty?0: int.parse(variable.FraisInscription.text);
      DataScolarite.value.IDNiveauSerie =variable.IDNiveauSerie.text.isEmpty?0: int.parse(variable.IDNiveauSerie.text);
      DataScolarite.value.DataTable = variable.DataTableModalitePaiement;
      DataScolarite.value.DataTableNiveauSerie = variable.DataTableNiveauSerie;
    }
  }
 
 @override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }
///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
 
     try {
     HLitScolarite(param: "ENVOYER");
  //  print(DataScolarite.value.toMap());
    ///LOADING
  
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "enregistrement encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  // ///// ENVOIE DES DONNEES
   final result = await  repositorycontroller.H_EnregistrerData(DataScolarite.value);
  // ///// FERMER LOADING
  Get.back();
  // ///// TRAITEMENT RESULTAT
  if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexions");
   return false;}
    return true;
   } catch (e) {
     TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return false;
   }
  }

// SUPPRIMER
@override
 H_Supprimer({int? id,String? param}) async {
    try {
        ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Suppression encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));

  ///// ENVOIE DES DONNEES
     final result = await  repositorycontroller.H_SupprimerData(id);
  ///// FERMER LOADING
  Get.back();
  ///// TRAITEMENT RESULTAT   
      if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
   return false;}
     H_RecupeData();
     Get.back();
     TLoader.successSnack(title: "SUPPRIMER",message: "La ligne a bien été supprimée");
     return true;
    } catch (e) {
       TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return;
    }
  }

// MODIFICATION
@override
 H_Modifier() async{
   
    try {
      HLitScolarite(param: "ENVOYER");
          ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Modification encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));

  ///// ENVOIE DES DONNEES
     
    final result=  await  repositorycontroller.H_ModifierData(DataScolarite.value);
    ///// FERMER LOADING
  Get.back();
  ///// TRAITEMENT RESULTAT 
     if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;}
      return true;
   } catch (e) {
    TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;
   }

  }

@override
  void H_RecupeData({String? param}) async {
  try {
    isLoading.value =false;
      DataTableScolarite.clear();
      final data = await repositorycontroller.H_RecupData(param: param);
       isLoading.value =true;
      if (data is List) {
        //// RECUPERER LA LISTE DES CLASSES
      DataTableScolarite.value = data.map((datas)=>TScolariteModel.fromMap(datas)).toList();
      DataTableFiltreScolarite.value =DataTableScolarite;
  
    }
    data==null? TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion"):"";
   } catch (e) {
       TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return;
   }
  }
  
@override
  void H_RecupeModif({int? id, String? param}) {
      TScolariteFiltre().H_FiltreElementParID(id: id);
     HLitScolarite();
  }

  @override
  void H_Initialise() {
    DataScolarite.value=TScolariteModel();
  }
  

  }