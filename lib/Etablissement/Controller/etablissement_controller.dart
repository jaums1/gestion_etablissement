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
	
   var dataEtablissementModel =TEtablissementModel().obs;  	
  	
   /////INIT userController
  TEtablissementRepository repositorycontroller = Get.put(TEtablissementRepository());
   

  HLitEtablissement({String? param ="AFFICHAGE"}){
   if (param=="AFFICHAGE") {
    etablissement.text=  dataEtablissementModel.value.nom ==""?"":dataEtablissementModel.value.nom.toString() ;
    codeEtablissemnt.text = dataEtablissementModel.value.codeEtatblissement ==""?"":dataEtablissementModel.value.codeEtatblissement.toString(); 
    adresse.text = dataEtablissementModel.value.adresse ==""?"":dataEtablissementModel.value.adresse.toString() ; 
    email.text = dataEtablissementModel.value.email ==""?"":dataEtablissementModel.value.email.toString() ; 
    logo.text = dataEtablissementModel.value.logo ==""?"":dataEtablissementModel.value.logo.toString() ; 
    directeur.text = dataEtablissementModel.value.nomDirecteur ==""?"":dataEtablissementModel.value.nomDirecteur.toString() ; 
    selectPays.value = dataEtablissementModel.value.pays ==""?"":dataEtablissementModel.value.pays.toString() ; 
    siteWeb.text = dataEtablissementModel.value.siteWeb ==""?"":dataEtablissementModel.value.siteWeb.toString() ; 
    phoneDirecteur.text = dataEtablissementModel.value.telephone ==""?"":dataEtablissementModel.value.telephone.toString() ; 
    telephone2.text = dataEtablissementModel.value.Telephone2 ==""?"":dataEtablissementModel.value.Telephone2.toString() ; 
    selectTypeEnseignement.value = dataEtablissementModel.value.typeEtablissement ==""?"":dataEtablissementModel.value.typeEnseignement.toString() ; 
    selectTypeEnseignement.value = dataEtablissementModel.value.typeEnseignement ==""?"":dataEtablissementModel.value.typeEnseignement.toString() ; 
    ville.text = dataEtablissementModel.value.ville ==""?"":dataEtablissementModel.value.ville.toString() ; 
    ville.text = dataEtablissementModel.value.Telephone2 ==""?"":dataEtablissementModel.value.Telephone2.toString() ; 
   }else{
  dataEtablissementModel.value.nom =  instance.etablissement.text;
  dataEtablissementModel.value.codeEtatblissement =instance.codeEtablissemnt.text; 
  dataEtablissementModel.value.adresse = instance.adresse.text;
  dataEtablissementModel.value.email = instance.email.text;
  dataEtablissementModel.value.logo = instance.logo.text;
  dataEtablissementModel.value.nomDirecteur = instance.directeur.text;
  dataEtablissementModel.value.pays = instance.selectPays.string; ///instance.pays.text;
  dataEtablissementModel.value.siteWeb = instance.siteWeb.text;
  dataEtablissementModel.value.telephone = instance.phoneDirecteur.text;
  dataEtablissementModel.value.typeEtablissement =instance.selectTypeEnseignement.string;   //instance.typeEtablissement.text;
  dataEtablissementModel.value.typeEnseignement =instance.selectTypeEnseignement.string;   
  dataEtablissementModel.value.ville = instance.ville.text;
  dataEtablissementModel.value.Telephone2 = instance.telephone2.text;
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
      dataEtablissementModel.value = reponse.data!;
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
  data: dataEtablissementModel.value.toMap(),fromJson: (data) =>TEtablissementModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      dataEtablissementModel.value =reponse.data!;
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
  data: dataEtablissementModel.value.toMap(),fromJson: (data) =>TEtablissementModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      dataEtablissementModel.value =reponse.data!;
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
   dataEtablissementModel.value = data;
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

 //// AUTRE PROCEDURE
void onSelectPays(value){
  selectPays.value =value;
}

void onSelectEnseignement(value){
  selectTypeEnseignement.value =value;
}

}