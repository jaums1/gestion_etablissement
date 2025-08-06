import 'package:ecole/Configs/utils/Constant/enums.dart';
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
import '../../Employe/Controller/employe_controller.dart';
import '../Model/login_model.dart';
import 'variable.dart';

class TUserController extends GetxController with TControllerData{
  static TUserController get instance => Get.find();
  final adminTotal=0.obs;
  final autreTootal=0.obs;
  final total=0.obs;
  final isLoading =false.obs;
  final DataUser = TUserModel().obs;
  final DataUserPrincipale = TUserModel().obs;
  final DataTableUser = <TUserModel>[].obs;
  final DataTableFiltreUser = <TUserModel>[].obs;
  var variable  = TUserVariable();
  
  final _client = TDioHelper(baseUrl: TApi.httpLien);
  final controller = Get.find<TEmployeController>();
 
  void HLitUser({String param="AFFICHAGE"}){
      if(param=="AFFICHAGE"){
       variable.user.text = DataUser.value.user??"";
       variable.password.text = DataUser.value.motDePasse??"";
       variable.passwordConfirm.text = DataUser.value.motDePasse??"";
       variable.role.text = DataUser.value.role??"";
       
      }else{
        DataUser.value.user = variable.user.text;
        DataUser.value.motDePasse = variable.password.text;
        DataUser.value.role = variable.role.text;
        DataUser.value.idEmploye = controller.DataEmploye.value.IDEmploye;
      }
  }
  
  @override
  H_Bilan(){
     autreTootal.value =0;
     adminTotal.value =0;
    for (var data in DataTableUser) {
       if (data.role.toString().toLowerCase()==AppRole.Admin.name.toLowerCase()) {
         adminTotal.value +=1;
       }else{
            autreTootal.value +=1;
       }
    }
    total.value = DataTableUser.length;
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
      H_RecupeData();
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
       H_RecupeData();
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
       H_RecupeData();
       Get.back();
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
    isLoading.value=false;
  ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TUserModel>(TEndpoint.linkUser,
                         fromJson: (data) =>TUserModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataTableUser.value =reponse.data!;
      DataTableFiltreUser.value =DataTableUser;
      isLoading.value=true;
       H_Bilan();
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
    
    
    DataUser.value = DataTableUser.firstWhere((e) =>e.idUtilisateur==id,orElse:()=> TUserModel());
   controller.H_RecupeModif(id: DataUser.value.idEmploye);

    HLitUser();
  }
 

  @override
  void H_Initialise() {
    DataUser.value = TUserModel();
    controller.H_Initialise();
  }
   
 
}