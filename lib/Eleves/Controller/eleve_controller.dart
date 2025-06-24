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
  var DataEleve = TModelEleve().obs;
  var DataTableEleve =<TModelEleve>[].obs;
  var DataTableFiltreEleve =<TModelEleve>[].obs;
  final repositorycontroller    = Get.put(TRepositoryEleve());
  
  
  
  //////TRAITEMENT
  
  HLitEleve({String? param="AFFICHIER"}){
    if (param=="AFFICHIER") {
     variable.nom.text           = DataEleve.value.Nom.toString();
     variable.prenoms.text       = DataEleve.value.Prenoms.toString();
     variable.matricule.text     = DataEleve.value.Matricule.toString();
     variable.sexe.text          = DataEleve.value.Sexe.toString();
     variable.dateNaissanceValide.value.text = DataEleve.value.DateNaissance.toString();
     variable.dateNaissance.value.text = TFormatters.formatDateFr(DateTime.parse(variable.dateNaissanceValide.value.text));
     variable.lieuNaissance.text = DataEleve.value.LieuNaissance.toString();
     variable.phoneEleve1.text   = DataEleve.value.Contact1.toString();
     variable.phoneEleve2.text   = DataEleve.value.Contact2.toString();
     variable.regime.text        = DataEleve.value.Regime.toString();
     variable.statut.text         = DataEleve.value.Statut.toString();
     variable.adresse.text       = DataEleve.value.Adresse.toString();
     variable.nomParent.text     = DataEleve.value.NomParent.toString();
     variable.prenomsParent.text = DataEleve.value.PrenomsParent.toString();
     variable.phoneParent1.text  = DataEleve.value.ContactParent1.toString();
     variable.phoneParent2.text  = DataEleve.value.ContactParent2.toString();
    }else{
      
      DataEleve.value.Nom                = variable.nom.text;
      DataEleve.value.Prenoms            = variable.prenoms.text;
      DataEleve.value.Matricule          = variable.matricule.text;
      DataEleve.value.Sexe               = variable.sexe.text;
      // DataEleve.value.DateNaissance      = dateNaissanceValide;
      // DataEleve.value.DateNaissance      = DateTime.parse(dateNaissance.value.text);
      DataEleve.value.LieuNaissance      = variable.lieuNaissance.text;
      DataEleve.value.Contact1           = variable.phoneEleve1.text;
      DataEleve.value.Contact2           = variable.phoneEleve2.text;
      DataEleve.value.Regime             = variable.regime.text;
      DataEleve.value.Statut             = variable.statut.text;
      DataEleve.value.Adresse            = variable.adresse.text;
      DataEleve.value.NomParent          = variable.nomParent.text;
      DataEleve.value.PrenomsParent      = variable.prenomsParent.text;
      DataEleve.value.ContactParent1     = variable.phoneParent1.text;
      DataEleve.value.ContactParent2     = variable.phoneParent2.text;
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
   final result = await  repositorycontroller.H_EnregistrerData(DataEleve.value);

  ///// TRAITEMENT RESULTAT
  if(result==false){Get.back(); TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexions");
   return false;}
     ///// FERMER LOADING
   instance.DataEleve.value = TModelEleve.fromMap(result) ;
  
   
    H_RecupeData();
  Get.back();
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
     
    final result=  await  repositorycontroller.H_ModifierData(DataEleve.value);
    ///// FERMER LOADING
  Get.back();
  ///// TRAITEMENT RESULTAT 
     if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;}
      H_RecupeData();
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
    edite.value = !edite.value;
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
    DataEleve.value=TModelEleve();
  }
  

  }