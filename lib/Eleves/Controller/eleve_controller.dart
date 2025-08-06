import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../Model/eleve_model.dart';
import '../Repository/eleve_repository.dart';
import 'eleve_variable.dart';

class TEleveController extends GetxController with TControllerData{
   static TEleveController get instance => Get.find();
  final noms = TextEditingController();
  final bilanHomme =0.obs;
  final bilanFemme =0.obs;
  final bilanTotal =0.obs;
  ///// DECLARATION DE VARIABLE 
  var edite =false.obs;
  final variable =TVariableEleve();
  final isLoading=false.obs;
  var DataEleve = TModelEleve().obs;
  var DataTableEleve =<TModelEleve>[].obs;
  var DataTableFiltreEleve =<TModelEleve>[].obs;
  final repositorycontroller    = Get.put(TRepositoryEleve());
  
  final _client = TDioHelper(baseUrl: TApi.httpLien);
  
  //////TRAITEMENT
  
  HLitEleve({String? param="AFFICHIER"}){
    if (param=="AFFICHIER") {
     variable.nom.text           = DataEleve.value.Nom.toString();
     variable.prenoms.text       = DataEleve.value.Prenoms.toString();
     variable.matricule.text     = DataEleve.value.Matricule.toString();
     variable.sexe.text          = DataEleve.value.Sexe.toString();
     variable.dateNaissanceValide.value.text = DataEleve.value.DateNaissance.toString();
     variable.dateNaissance.value.text = TFormatters.formatDateFr(DataEleve.value.DateNaissance);
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
  H_Bilan() {
    bilanHomme.value=0;
    bilanFemme.value=0;
   for (var data in DataTableEleve) {
      if(data.Sexe=="Homme"){
       bilanHomme.value++;
      }else{
       bilanFemme.value++;
      }
   }
   bilanTotal.value= DataTableEleve.length;
  }

///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
   try {
       HLitEleve(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TModelEleve>(TEndpoint.linkEleve,
                        data: DataEleve.value.toMap(),fromJson: (data) =>TModelEleve.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEleve.value =reponse.data!;
       H_RecupeData();
        Get.back();
       return true;
    }else{
      Get.back();
      TLoader.errorSnack(title: TText.erreur,message: TText.messageErreur);
       return false;
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur,message: "${TText.messageErreur} $e");
    }

  }

// SUPPRIMER
@override
 H_Supprimer({int? id,String? param}) async {
    
    try {
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageSuppressionChargement.tr,animation: TImages.docerAnimation, width: 200,));
       final reponse =await _client.delete("${TEndpoint.linkEleve}/$id",);
    ////// VERIFICATION 
    if(reponse.success){
       H_RecupeData();
        Get.back();
        Get.back();
       return true;
    }else{
      Get.back();
      TLoader.errorSnack(title: TText.erreur,message: TText.messageErreur);
       return false;
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur,message: "${TText.messageErreur} $e");
    }
   
  }

// MODIFICATION
@override
 H_Modifier() async{
    try {
       HLitEleve(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TModelEleve>(TEndpoint.linkEleve,
                        data: DataEleve.value.toMap(),fromJson: (data) =>TModelEleve.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEleve.value =reponse.data!;
       H_RecupeData();
         Get.back();
       return true;
    }else{
      Get.back();
      TLoader.errorSnack(title: TText.erreur,message: TText.messageErreur);
       return false;
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur,message: "${TText.messageErreur} $e");
    }
  }

@override
 H_RecupeData({String? param}) async {
   try {
    isLoading.value =false;
  final reponse =await _client.getList<TModelEleve>(TEndpoint.linkEleve,
                                             fromJson: (data) =>TModelEleve.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableEleve.value = reponse.data!;
      DataTableFiltreEleve.value =reponse.data!;
      H_Bilan();
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
 H_RecupeModif({int? id, String? param}) {
      DataEleve.value = DataTableEleve.firstWhere(
      (data)=> data.IDEtudiant ==id,orElse: () => TModelEleve(),);
      HLitEleve();
  }

  @override
  void H_Initialise() {
    variable.H_Clear();
    DataEleve.value=TModelEleve();
  }
  

  }