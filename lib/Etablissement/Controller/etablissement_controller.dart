import 'package:ecole/Configs/utils/Constant/api_constants.dart';
import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Configs/utils/dio/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../Model/etablissement_model.dart';
import '../Repository/etatblissement_repository.dart';


class TEtablissementController extends GetxController with TControllerData {
  static TEtablissementController get instance => Get.find();
  /// Variable declarer
  final etablissement = TextEditingController();
  final codeEtablissemnt = TextEditingController();
  final ville = TextEditingController();
  final pays = TextEditingController();
  final selectPays="Côte d'Ivoire".obs;
  final selectTypeEnseignement="Enseignement Général".obs;
  final adresse = TextEditingController();
  final directeur = TextEditingController();
  final phoneDirecteur = TextEditingController();
  final siteWeb = TextEditingController();
  final telephone2 = TextEditingController();
  final email = TextEditingController();
  final typeEtablissement = TextEditingController();
  final dateCreation = TextEditingController();
  final logo = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  final _client = TDioHelper(baseUrl: TApi.httpLien);
	
   var DataEtablissement =TEtablissementModel().obs;  	
  	
   /////INIT userController
  TEtablissementRepository repositorycontroller = Get.put(TEtablissementRepository());
   

  HLitEtablissement({String? param ="AFFICHAGE"}){
   if (param=="AFFICHAGE") {
    etablissement.text=  DataEtablissement.value.nom ==""?"":DataEtablissement.value.nom.toString() ;
    codeEtablissemnt.text = DataEtablissement.value.codeEtatblissement ==""?"":DataEtablissement.value.codeEtatblissement.toString(); 
    adresse.text = DataEtablissement.value.adresse ==""?"":DataEtablissement.value.adresse.toString() ; 
    email.text = DataEtablissement.value.email ==""?"":DataEtablissement.value.email.toString() ; 
    logo.text = DataEtablissement.value.logo ==""?"":DataEtablissement.value.logo.toString() ; 
    directeur.text = DataEtablissement.value.nomDirecteur ==""?"":DataEtablissement.value.nomDirecteur.toString() ; 
    selectPays.value = DataEtablissement.value.pays ==""?"":DataEtablissement.value.pays.toString() ; 
    siteWeb.text = DataEtablissement.value.siteWeb ==""?"":DataEtablissement.value.siteWeb.toString() ; 
    phoneDirecteur.text = DataEtablissement.value.telephone ==""?"":DataEtablissement.value.telephone.toString() ; 
    telephone2.text = DataEtablissement.value.Telephone2 ==""?"":DataEtablissement.value.Telephone2.toString() ; 
    selectTypeEnseignement.value = DataEtablissement.value.typeEtablissement ==""?"":DataEtablissement.value.typeEnseignement.toString() ; 
    selectTypeEnseignement.value = DataEtablissement.value.typeEnseignement ==""?"":DataEtablissement.value.typeEnseignement.toString() ; 
    ville.text = DataEtablissement.value.ville ==""?"":DataEtablissement.value.ville.toString() ; 
    ville.text = DataEtablissement.value.Telephone2 ==""?"":DataEtablissement.value.Telephone2.toString() ; 
   }else{
  DataEtablissement.value.nom =  instance.etablissement.text;
  DataEtablissement.value.codeEtatblissement =instance.codeEtablissemnt.text; 
  DataEtablissement.value.adresse = instance.adresse.text;
  DataEtablissement.value.email = instance.email.text;
  DataEtablissement.value.logo = instance.logo.text;
  DataEtablissement.value.nomDirecteur = instance.directeur.text;
  DataEtablissement.value.pays = instance.selectPays.string; ///instance.pays.text;
  DataEtablissement.value.siteWeb = instance.siteWeb.text;
  DataEtablissement.value.telephone = instance.phoneDirecteur.text;
  DataEtablissement.value.typeEtablissement =instance.selectTypeEnseignement.string;   //instance.typeEtablissement.text;
  DataEtablissement.value.typeEnseignement =instance.selectTypeEnseignement.string;   
  DataEtablissement.value.ville = instance.ville.text;
  DataEtablissement.value.Telephone2 = instance.telephone2.text;
   }

 }

@override
  void onInit() async{
   await H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
   H_RecupeData()async {
     try {
  ///// ENVOIE DES DONNEES
  final reponse =await _client.get<TEtablissementModel>("${TEndpoint.linkEtablissement}/principale",
                                             fromJson: (data) =>TEtablissementModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEtablissement.value = reponse.data!;
      HLitEtablissement();
    }
    } catch (e) {
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
    }


  }
  

  ///// ENREGISTREMENT
  @override
  H_Enregistrer() async{
   
   try {
    HLitEtablissement(param: "ENVOYER");
       ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "enregistrement encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
  final reponse =await _client.post<TEtablissementModel>(TEndpoint.linkEtablissement,
  data: DataEtablissement.value.toMap(),fromJson: (data) =>TEtablissementModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEtablissement.value =reponse.data!;
      Get.back();
      return true;
    }else{
      Get.back();
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion internet");
     return false;
    }
    } catch (e) {
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return false;
    }

  }
  
  ////// MODIFIER
  @override
  H_Modifier() async{
   
    HLitEtablissement(param: "ENVOYER");
       ///LOADING
  // TShowdialogue().showWidgetLoad(widgets: 
  // TAnimationLoaderWidget(text: "modification encours...",color: Colors.white,
  // animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
  final reponse =await _client.patch<TEtablissementModel>(TEndpoint.linkEtablissement,
  data: DataEtablissement.value.toMap(),fromJson: (data) =>TEtablissementModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEtablissement.value =reponse.data!;
      // Get.back();
      return true;
    }else{
      // Get.back();
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion internet");
     return false;
    }
   
  }

 ///// SUPPRIMER
 @override
  H_Supprimer({int? id, String? param}) async{
     try {
    final data=  await repositorycontroller.H_SupprimerData(id);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
        TLoader.successSnack(title: "SUCCESS",message:"Votre établissement a bien été supprimé"); 
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }
 
 ///// INITIALISATION
 @override
  void H_Initialise() {
   final data = TEtablissementModel();
   DataEtablissement.value = data;
  }

 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() async{
   final result = keyForm.currentState?.validate();
    if (result==false)return false;
    if (selectPays.value.isEmpty || selectTypeEnseignement.value.isEmpty) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez sélectionner un pays ou le t"); 
      return false;
    }
      await H_Enregistrer();
      return true;
    }

  H_TermineConfig() async{

   try {
       ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Chargement encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
  final reponse =await _client.patch<TEtablissementModel>("${TEndpoint.linkEtablissement}/${TEndpoint.linkValidation}",
  data: DataEtablissement.value.toMap(),fromJson: (data) =>TEtablissementModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEtablissement.value =reponse.data!;
      Get.back();
      return true;
    }else{
      Get.back();
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion internet");
     return false;
    }
    } catch (e) {
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return false;
    }
  }
 //// AUTRE PROCEDURE
void onSelectPays(value){
  selectPays.value =value;
}

void onSelectEnseignement(value){
  selectTypeEnseignement.value =value;
}

}