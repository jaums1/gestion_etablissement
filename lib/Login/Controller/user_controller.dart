

import 'package:ecole/Configs/utils/dio/dio_client.dart';
import 'package:ecole/Configs/utils/endpoint/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../Model/login_model.dart';
import 'user_filtre.dart';
import 'variable.dart';

class TUserController extends GetxController with TControllerData{
  static TUserController get instance => Get.find();
  
  final DataUser = TUserModel().obs;
  final DataUserPrincipale = TUserModel().obs;
  final DataTableUser = <TUserModel>[].obs;
  final DataTableFiltreUser = <TUserModel>[].obs;
  var variable  = TUserVariable();

  final _client = TDioHelper(baseUrl: TApi.httpLien);
 
  void HLitUser({String param="AFFICHAGE"}){
      if(param=="AFFICHAGE"){
       variable.user.text = DataUser.value.user??"";
       variable.password.text = DataUser.value.motDePasse??"";
       variable.role.text = DataUser.value.role??"";
       
      }else{
        DataUser.value.user = variable.user.text;
        DataUser.value.motDePasse = variable.password.text;
        DataUser.value.role = variable.role.text;
      }
  }


@override
  H_Enregistrer() async{
    try {
        HLitUser(param: "ENVOYER");
       ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "enregistrement encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
  final reponse =await _client.post<TUserModel>(TEndpoint.linkUser,data: DataUser.value.toMap(),
                                           fromJson: (data) =>TUserModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataUser.value =reponse.data!;
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

@override
  H_Modifier() async{
   try {
        HLitUser(param: "ENVOYER");
       ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "modification encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
  final reponse =await _client.patch<TUserModel>(TEndpoint.linkUser,data: DataUser.value.toMap(),
                                           fromJson: (data) =>TUserModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataUser.value =reponse.data!;
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

@override
  H_Supprimer({int? id, String? param}) async{
    try {
      
       ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Supression encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
  final reponse =await _client.delete("${TEndpoint.linkUser}/$id",queryParameters: {'id':id});
    ////// VERIFICATION 
    if(reponse.success){
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


@override
 H_RecupeData() async{
   try {
  ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TUserModel>(TEndpoint.linkUser,
                         fromJson: (data) =>TUserModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataTableUser.addAll(reponse.data!);
      DataTableFiltreUser.value =DataTableUser;
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

  

  /////CONNECTION
   H_Connexion()async{
     try {
  ///// ENVOIE DES DONNEES
  final reponse =await _client.get<TUserModel>(
    "${TEndpoint.linkUser}/${variable.user.text}/${variable.password.text}",
                         fromJson: (data) =>TUserModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataUserPrincipale.value = reponse.data!;
      Get.back();
      if(DataUserPrincipale.value.idUtilisateur==0){
        TLoader.warningSnack(title: "CONNEXION",message: "Ce compte n'existe pas dans la base de donnée");
      }
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


 @override
  void H_RecupeModif({int? id, String? param}) {
    TUserFiltre().H_FiltreElementParID(id: id);
    HLitUser();
  }
 

  @override
  void H_Initialise() {
    DataUser.value = TUserModel();
  }
   
 
}