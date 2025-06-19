import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:ecole/Eleves/Controller/eleve_filtre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Model/eleve_model.dart';
import '../Repository/eleve_repository.dart';
import 'eleve_variable.dart';

class TEleveController extends GetxController with TControllerData{
   static TEleveController get instance => Get.find();
  final noms = TextEditingController();
  ///// DECLARATION DE VARIABLE 
  var edite =false.obs;
  final variable =TVariableEleve();
  final isLoading=false.obs;
  var DataEleve = TModelEleve();
  var DataTableEleve =<TModelEleve>[].obs;
  var DataTableFiltreEleve =<TModelEleve>[].obs;
  final repositorycontroller    = Get.put(TRepositoryEleve());
  
  
  
  //////TRAITEMENT
  
  HLitEleve({String? param="AFFICHIER"}){
    if (param=="AFFICHIER") {
     variable.nom.text           = DataEleve.Nom.toString();
     variable.prenoms.text       = DataEleve.Prenoms.toString();
     variable.matricule.text     = DataEleve.Matricule.toString();
     variable.sexe.text          = DataEleve.Sexe.toString();
     variable.dateNaissanceValide.value.text = DataEleve.DateNaissance.toString();
     variable.dateNaissance.value.text = TFormatters.formatDateFr(DateTime.parse(variable.dateNaissanceValide.value.text));
     variable.lieuNaissance.text = DataEleve.LieuNaissance.toString();
     variable.phoneEleve1.text   = DataEleve.Contact1.toString();
     variable.phoneEleve2.text   = DataEleve.Contact2.toString();
     variable.regime.text        = DataEleve.Regime.toString();
     variable.statut.text         = DataEleve.Statut.toString();
     variable.adresse.text       = DataEleve.Adresse.toString();
     variable.nomParent.text     = DataEleve.NomParent.toString();
     variable.prenomsParent.text = DataEleve.PrenomsParent.toString();
     variable.phoneParent1.text  = DataEleve.ContactParent1.toString();
     variable.phoneParent2.text  = DataEleve.ContactParent2.toString();
    }else{
      
      DataEleve.Nom                = variable.nom.text;
      DataEleve.Prenoms            = variable.prenoms.text;
      DataEleve.Matricule          = variable.matricule.text;
      DataEleve.Sexe               = variable.sexe.text;
      // DataEleve.DateNaissance      = dateNaissanceValide;
      // DataEleve.DateNaissance      = DateTime.parse(dateNaissance.value.text);
      DataEleve.LieuNaissance      = variable.lieuNaissance.text;
      DataEleve.Contact1           = variable.phoneEleve1.text;
      DataEleve.Contact2           = variable.phoneEleve2.text;
      DataEleve.Regime             = variable.regime.text;
      DataEleve.Statut             = variable.statut.text;
      DataEleve.Adresse            = variable.adresse.text;
      DataEleve.NomParent          = variable.nomParent.text;
      DataEleve.PrenomsParent      = variable.prenomsParent.text;
      DataEleve.ContactParent1     = variable.phoneParent1.text;
      DataEleve.ContactParent2     = variable.phoneParent2.text;
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
    HLitEleve(param: "ENVOYER");
    ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "enregistrement encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
   final result = await  repositorycontroller.H_EnregistrerData(DataEleve);
  ///// FERMER LOADING
  Get.back();
  ///// TRAITEMENT RESULTAT
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
      HLitEleve(param: "ENVOYER");
          ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Modification encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));

  ///// ENVOIE DES DONNEES
     
    final result=  await  repositorycontroller.H_ModifierData(DataEleve);
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
      DataTableEleve.clear();
      final data = await repositorycontroller.H_RecupData(param: param);
       isLoading.value =true;
      if (data is List) {
      DataTableEleve.value = data.map((datas)=>TModelEleve.fromMap(datas)).toList();
      DataTableFiltreEleve.value =DataTableEleve;
    }
    data==null? TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion"):"";
   } catch (e) {
       TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return;
   }
  }
  
@override
  void H_RecupeModif({int? id, String? param}) {
     TFiltreEleve().H_FiltreElementParID(id: id);
    HLitEleve();
  }

  @override
  void H_Initialise() {
    DataEleve=TModelEleve();
  }
  

  }