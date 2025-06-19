import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:ecole/Serie/Model/serie_model.dart';
import 'package:ecole/Serie/Repository/serie_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Popup/loaders.dart';



class TSerieController extends GetxController with TControllerData{
   static TSerieController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var dataTableSerie= <TSerieModel>[].obs;
   final params ="".obs;
  final isSelectTitreSerie = <String>[].obs;
  final isSelectSerie = <String>[].obs;
   ///// LES INSTANCES
    var dataSerieModel = TSerieModel();
    final repositorycontroller = Get.put(TSerieRepository());
    final controlleEtablissement= Get.find<TEtablissementController>();
     
     final libSerie =TextEditingController();
     final serie =TextEditingController();
    ///////// TRAITEMENT
  
   void HLitSerieScolaire({String? param="AFFICHAGE"}){
    if(param=="AFFICHAGE"){
    libSerie.text =  dataSerieModel.libSerie.toString()==""?"":dataSerieModel.libSerie.toString() ;
    serie.text    =  dataSerieModel.serie.toString()==""?"":dataSerieModel.serie.toString();
    
    }else{
      dataSerieModel.typeEnseignement = controlleEtablissement.dataEtablissementModel.value.typeEnseignement ;
      dataSerieModel.libSerie         = libSerie.text;
      dataSerieModel.serie            = serie.text;

      
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
      dataTableSerie.clear();
      isSelectSerie.clear();
      final data=await repositorycontroller.H_RecupData(param: param);
      if (data is List) dataTableSerie.value = data.map((datas)=>TSerieModel.fromMap(datas)).toList();
    dataTableSerie.map((datas){ 
     datas.etat ==true?isSelectSerie.add(datas.serie==""?datas.libSerie!:datas.serie!) :"";
      isSelectSerie.length == dataTableSerie.length? isSelectTitreSerie.add(datas.typeEnseignement!):"";
     }).toList(); 

    
    
         

  }
  
//// ENREGISTRER
@override
  H_Enregistrer() async{
   try {
     HLitSerieScolaire(param: "ENVOYER");
     final data = await repositorycontroller.H_EnregistrerData(dataSerieModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
        dataSerieModel = TSerieModel.fromMap(data);
        if(dataSerieModel.libSerie==""){
           final index = onIndexData(dataSerieModel.serie);
           if(index==-1) return;
           dataTableSerie[index].etat = true;
        return;
        }
        dataTableSerie.add(dataSerieModel);
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }

  ////// MODIFIER
  @override
  H_Modifier() async{
    try {
     HLitSerieScolaire(param: "ENVOYER");

     final data = await repositorycontroller.H_ModifierData(dataSerieModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
        final index = onIndexData(dataSerieModel.serie);
        if(index==-1) return;
         dataTableSerie[index]=dataSerieModel;
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
    if (isSelectSerie.isEmpty)return false;
      return true;
    }

 //// AUTRE PROCEDURE
void onSelectRadio(value){
 final index = onIndexData(value);
 if(index==-1) return;
//  dataTypeDecoupageModel= dataTableTypeDecoupage[index];

}

onIndexData(value){
  return dataTableSerie.indexWhere((e)=> e.serie ==value );
}

onSelectCheckBox({String? lib="",String? titre=""}){
    bool? isverification=true; 
     isverification= dataTableSerie.length == isSelectSerie.length;

     lib !=""? isSelectSerie.contains(lib) == true ?isSelectSerie.remove(lib)
                     :isSelectSerie.add(lib!):"";

    if(lib ==""){
      if(isverification){
        for (var element in dataTableSerie) {
        isSelectSerie.contains(element.serie==""?element.libSerie:element.serie) == false ?"":isSelectSerie.remove(element.serie==""?element.libSerie:element.serie); 
      }}
      else{
            for (var element in dataTableSerie) {
          isSelectSerie.contains(element.serie==""?element.libSerie:element.serie) == true ?"":isSelectSerie.add(element.serie ==""?element.libSerie.toString():element.serie.toString()); 
            }
        }
    }
       
   isverification= dataTableSerie.length == isSelectSerie.length;
    isverification ==true?isSelectTitreSerie.add(titre!):
     isSelectTitreSerie.contains(titre) == true ?isSelectTitreSerie.remove(titre!) :"";   
     dataSerieModel.dataSerie = isSelectSerie;
    //  dataSerieModel.iDNiveauScolaire = 1;
     H_Enregistrer();
    }
  








  
  

  }
