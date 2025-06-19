import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:ecole/Employe/Controller/employe_filtre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Model/employe_model.dart';
import '../Repository/employe_repository.dart';
import 'employe_variable.dart';

class TEmployeController extends GetxController with TControllerData{
   static TEmployeController get instance => Get.find();
  ///// DECLARATION DE VARIABLE 
  var action ="";
  final variable =TEmployeVariable();
  final isLoading=false.obs;
  var DataEmploye = TEmployeModel();
  var DataTableEmploye =<TEmployeModel>[].obs;
  var DataTableFiltreEmploye =<TEmployeModel>[].obs;
   var DataTableEnseignant =<TEmployeModel>[].obs;
  var DataTableFiltreEnseignant =<TEmployeModel>[].obs;

  final repositorycontroller    = Get.put(TEmployeRepository());
  
  
  //////TRAITEMENT
  
  HLitEmploye({String? param="AFFICHIER"}){
    if (param=="AFFICHIER") {

variable.IDEtablissement.text   = DataEmploye.IDEtablissement.toString();
variable.MatriculeEmploye.text  = DataEmploye.MatriculeEmploye.toString();
variable.Nom.text               = DataEmploye.Nom.toString();
variable.Prenoms.text           = DataEmploye.Prenoms.toString();
variable.Sexe.text              =  DataEmploye.Sexe.toString();
variable.Adresse.text           = DataEmploye.Adresse.toString(); 
variable.Telephone.text         = DataEmploye.Telephone.toString();
variable.Telephone2.text        = DataEmploye.Telephone2.toString();    
variable.Email.text             = DataEmploye.Email.toString();
variable.Photo.text             = DataEmploye.Photo.toString();
variable.TypeContrat.text     = DataEmploye.TypeContrat.toString();
variable.DateEmbauche.value.text  = TFormatters.formatDateFr(DataEmploye.DateEmbauche);
variable.DateNaissance.value.text  = TFormatters.formatDateFr(DataEmploye.DateNaissance);
variable.Salaire.text         = DataEmploye.Salaire.toString();
variable.TypeSalaire.text     = DataEmploye.TypeSalaire.toString();
variable.Bancaire.text        = DataEmploye.Bancaire.toString();
variable.NumeroCompte.text    = DataEmploye.NumeroCompte.toString();
variable.Statut.text          = DataEmploye.Statut.toString();
variable.Nationnalite.text    = DataEmploye.Nationnalite.toString();
variable.EtatCivil.text       = DataEmploye.EtatCivil.toString();
variable.Departement.text     = DataEmploye.Departement.toString();
variable.DateFinContrat.value.text  =TFormatters.formatDateFr(DataEmploye.DateFinContrat);
variable.NiveauEtude.text     = DataEmploye.NiveauEtude.toString();
variable.Specialite.text      = DataEmploye.Specialite.toString();
variable.Experience.text      = DataEmploye.Experience.toString();
variable.Observation.text     = DataEmploye.Observation.toString();
variable.LieuNaissance.text   = DataEmploye.LieuNaissance.toString();
variable.Fonction.text        = DataEmploye.Fonction.toString();
 
    }else{
     
 DataEmploye.IDEtablissement   = int.tryParse(variable.IDEtablissement.text) ?? 0;
DataEmploye.MatriculeEmploye  = variable.MatriculeEmploye.text;
DataEmploye.Nom               = variable.Nom.text;
DataEmploye.Prenoms           = variable.Prenoms.text;
DataEmploye.Sexe              = variable.Sexe.text;
DataEmploye.Adresse           = variable.Adresse.text;
DataEmploye.Telephone         = variable.Telephone.text;
DataEmploye.Telephone2        = variable.Telephone2.text;
DataEmploye.Email             = variable.Email.text;
DataEmploye.Photo             = variable.Photo.text;
DataEmploye.TypeContrat       = variable.TypeContrat.text;
DataEmploye.Salaire           = int.tryParse(variable.Salaire.text) ?? 0;
DataEmploye.TypeSalaire       = variable.TypeSalaire.text;
DataEmploye.Bancaire          = variable.Bancaire.text;
DataEmploye.NumeroCompte      = variable.NumeroCompte.text;
DataEmploye.Statut            = variable.Statut.text;
DataEmploye.Nationnalite      = variable.Nationnalite.text;
DataEmploye.EtatCivil         = variable.EtatCivil.text;
DataEmploye.Departement       = variable.Departement.text;
DataEmploye.NiveauEtude       = variable.NiveauEtude.text;
DataEmploye.Specialite        = variable.Specialite.text;
DataEmploye.Experience        = variable.Experience.text;
DataEmploye.Observation       = variable.Observation.text;
DataEmploye.LieuNaissance     = variable.LieuNaissance.text;
DataEmploye.Fonction          = variable.Fonction.text;


    }
  }
 
//  @override
//   void onInit() {
//     //  H_RecupeData();
//     super.onInit();
//   }
///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
  
     try {
    HLitEmploye(param: "ENVOYER");
    ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "enregistrement encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
   final result = await  repositorycontroller.H_EnregistrerData(DataEmploye);
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
      HLitEmploye(param: "ENVOYER");
          ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Modification encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));

  ///// ENVOIE DES DONNEES
   
    final result=  await  repositorycontroller.H_ModifierData(DataEmploye);
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
      DataTableEmploye.clear();
      final data = await repositorycontroller.H_RecupData(param: param);
       isLoading.value =true;
      if (data is List) {
        //// RECUPERER LA LISTE DES EMPLOYES
      DataTableEmploye.value = data.map((datas)=>TEmployeModel.fromMap(datas)).toList();
      DataTableFiltreEmploye.value =DataTableEmploye;
      
       //// RECUPERER LA LISTE DES ENSEIGNANT
      DataTableFiltreEnseignant.value = DataTableEmploye.where((e)=> e.Fonction!.toLowerCase()=="enseignant").toList().map(
       (datas)=>datas ).toList();
    }
    data==null? TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion"):"";
   } catch (e) {
       TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return;
   }
  }
  
@override
  void H_RecupeModif({int? id, String? param}) {
     TEmployeFiltre().H_FiltreElementParID(id: id);
    HLitEmploye();
  }

  @override
  void H_Initialise() {
    DataEmploye=TEmployeModel();
  }
  

  }