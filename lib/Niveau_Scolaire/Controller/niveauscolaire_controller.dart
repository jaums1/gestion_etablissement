import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Popup/loaders.dart';
import '../../Cycle/Controller/cycle_controller.dart';
import '../Model/niveauscolaire_model.dart';
import '../Repository/niveauscolaire_repository.dart';


class TNiveauScolaireController extends GetxController with TControllerData{
   static TNiveauScolaireController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var dataTableNiveauEtude= <TNiveauModel>[].obs;
   final idNiveau =0.obs;
   final params ="".obs;
  final isSelectTitreNiveau = <String>[].obs;
  final isSelectNiveau = <String>[].obs;

  final niveau = TextEditingController();
  final typeNiveau = TextEditingController();
  final idCycle = TextEditingController();

   ///// LES INSTANCES
    var dataNiveauModel = TNiveauModel();
    final repositorycontroller = Get.put(TNiveauScolaireRepository());
    final controlleCyle= Get.find<TCycleController>();

    ///////// TRAITEMENT
     
   void HLitNiveauScolaire({String? param="AFFICHAGE"}){
    if(param=="AFFICHAGE"){
    idCycle.text =   dataNiveauModel.iDCycleScolaire.toString() ;
    niveau.text =  dataNiveauModel.niveau.toString()==""?"":dataNiveauModel.niveau.toString();
    typeNiveau.text = dataNiveauModel.typeNiveau.toString() == ""?"":dataNiveauModel.typeNiveau.toString();
    }else{
      dataNiveauModel.iDCycleScolaire=idCycle.text==""?controlleCyle.datacyleModel.iDCycleScolaire :idCycle.text as int ;
      dataNiveauModel.niveau=niveau.text;
      dataNiveauModel.typeNiveau=typeNiveau.text;
    }
   
   }

@override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
  void H_RecupeData({String? param})async {
  if(params.value.toLowerCase() == param.toString().toLowerCase()) return;
      params.value = param.toString();
      dataTableNiveauEtude.clear();
      isSelectNiveau.clear();
      final data=await repositorycontroller.H_RecupData(param: param);
      if (data is List) dataTableNiveauEtude.value = data.map((datas)=>TNiveauModel.fromMap(datas)).toList();
    dataTableNiveauEtude.map((datas){ 
     datas.etat ==true?isSelectNiveau.add(datas.niveau!) :"";
      isSelectNiveau.length == dataTableNiveauEtude.length? isSelectTitreNiveau.add(datas.typeNiveau!):"";
     }).toList(); 

    
    
         

  }
  
//// ENREGISTRER
@override
  H_Enregistrer() async{
   try {
     HLitNiveauScolaire(param: "ENVOYER");
     final data = await repositorycontroller.H_EnregistrerData(dataNiveauModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internetS12"); 
        return;}
        dataNiveauModel = TNiveauModel.fromMap(data);
        if(dataNiveauModel.typeNiveau==""){
           final index = onIndexData(dataNiveauModel.niveau);
           if(index==-1) return;
           dataTableNiveauEtude[index].etat = true;
        return;
        }
        dataTableNiveauEtude.add(dataNiveauModel);
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }

  ////// MODIFIER
  @override
  H_Modifier() async{
    try {
     HLitNiveauScolaire(param: "ENVOYER");

     final data = await repositorycontroller.H_ModifierData(dataNiveauModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
        final index = onIndexData(dataNiveauModel.niveau);
        if(index==-1) return;
         dataTableNiveauEtude[index]=dataNiveauModel;
    } catch (e) {
     TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet source d'erreur :$e");
    }
  }

///// SUPPRIMER
@override
  H_Supprimer({int? id, String? param}) async{
    try {
        final data =await repositorycontroller.H_SupprimerData(id);
      data ==true?TLoader.successSnack(title: "SUPPRIMER",
       message:"Supprimer avec succès") :TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet");
    } catch (e) {
       TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet source d'erreur :$e");
    }
 

  }
 ///// INITIALISATION


 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() {
    if (isSelectNiveau.isEmpty)return false;
    H_Modifier();
      return true;
    }

 //// AUTRE PROCEDURE
void onSelectRadio(value){
  // selectRadio.value =value;
 final index = onIndexData(value);
 if(index==-1) return;
//  dataTypeDecoupageModel= dataTableTypeDecoupage[index];

}

onIndexData(value){
  return dataTableNiveauEtude.indexWhere((e)=> e.niveau ==value );
}

onSelectCheckBox({String? libNiveau="",String? titreNiveau=""}){
    bool? isverification=true; 
     isverification= dataTableNiveauEtude.length == isSelectNiveau.length;

     libNiveau !=""? isSelectNiveau.contains(libNiveau) == true ?isSelectNiveau.remove(libNiveau)
                     :isSelectNiveau.add(libNiveau!):"";

    if(libNiveau ==""){
      if(isverification){
        for (var element in dataTableNiveauEtude) {
        isSelectNiveau.contains(element.niveau) == false ?"":isSelectNiveau.remove(element.niveau); 
      }}
      else{
            for (var element in dataTableNiveauEtude) {
          isSelectNiveau.contains(element.niveau) == true ?"":isSelectNiveau.add(element.niveau!); 
            }
        }
    }
       
   isverification= dataTableNiveauEtude.length == isSelectNiveau.length;
    isverification ==true?isSelectTitreNiveau.add(titreNiveau!):
     isSelectTitreNiveau.contains(titreNiveau) == true ?isSelectTitreNiveau.remove(titreNiveau!) :"";   
     dataNiveauModel.niveauData = isSelectNiveau;
     dataNiveauModel.iDNiveauScolaire = 1;
     H_Enregistrer();
    }
  

    
 }


