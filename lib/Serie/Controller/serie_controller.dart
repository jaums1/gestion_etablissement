import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:ecole/Serie/Model/serie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';



class TSerieController extends GetxController with TControllerData{
   static TSerieController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var DataTableSerie= <TSerieModel>[].obs;
   final params ="".obs;
  final isSelectTitreSerie = <String>[].obs;
  final isSelectSerie = <String>[].obs;
   ///// LES INSTANCES
    var DataSerie = TSerieModel();
    final controlleEtablissement= Get.find<TEtablissementController>();
     
     final libSerie =TextEditingController();
     final serie =TextEditingController();

     final _client = TDioHelper(baseUrl: TApi.httpLien);
    ///////// TRAITEMENT
  
   void HLitSerieScolaire({String? param="AFFICHAGE"}){
    if(param=="AFFICHAGE"){
    libSerie.text =  DataSerie.libSerie.toString()==""?"":DataSerie.libSerie.toString() ;
    serie.text    =  DataSerie.serie.toString()==""?"":DataSerie.serie.toString();
    
    }else{
      DataSerie.typeEnseignement = controlleEtablissement.DataEtablissement.value.typeEnseignement ;
      DataSerie.libSerie         = libSerie.text;
      DataSerie.serie            = serie.text;

      
    }
   
   }


@override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
 H_RecupeData({String? param})async {
   try {
    if( params.value.toLowerCase() == controlleEtablissement.selectTypeEnseignement.value.toLowerCase()) return;
    
     DataTableSerie.clear();
      isSelectSerie.clear();

  ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TSerieModel>("${TEndpoint.linkSerie}/${controlleEtablissement.selectTypeEnseignement.value}",
                                             fromJson: (data) =>TSerieModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataTableSerie.value = reponse.data!;
      isSelectSerie.value = DataTableSerie.where((e)=> e.etat==true).map((e)=> e.serie==""?e.libSerie!:e.serie!).toList();
      isSelectSerie.length == DataTableSerie.length? isSelectTitreSerie.add(controlleEtablissement.selectTypeEnseignement.value):"";
      params.value = controlleEtablissement.selectTypeEnseignement.value;
    }
    } catch (e) {
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
    }  
  
  }
  
//// ENREGISTRER
@override
  H_Enregistrer() async{
   try {
       HLitSerieScolaire(param: "ENVOYER");
    
       final reponse =await _client.post<TSerieModel>(TEndpoint.linkSerie,
                        data: DataSerie.toMap(),fromJson: (data) =>TSerieModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataSerie =reponse.data!;
       H_RecupeData();
    }else{
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion internet");
    }
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }

  ////// MODIFIER
  @override
  H_Modifier() async{
  
   try {
       HLitSerieScolaire(param: "ENVOYER");
    
       final reponse =await _client.patch<TSerieModel>(TEndpoint.linkSerie,
                        data: DataSerie.toMap(),fromJson: (data) =>TSerieModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataSerie =reponse.data!;
       H_RecupeData();
    }else{
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion internet");
    }
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }

  }

///// SUPPRIMER
@override
  H_Supprimer({int? id, String? param}) async{
  try {
       final reponse =await _client.delete("${TEndpoint.linkSerie}/$id");
    ////// VERIFICATION 
      if(reponse.success) H_RecupeData();
      reponse.success ==true?TLoader.successSnack(title: "SUPPRIMER",
       message:"Supprimer avec succès") :TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet");
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }
 ///// INITIALISATION






 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() async {
    if (isSelectSerie.isEmpty)return false;
     DataSerie.dataSerie=isSelectSerie;
    await  H_Modifier();
   
      return true;
    }




 //// AUTRE PROCEDURE
void onSelectRadio(value){
 final index = onIndexData(value);
 if(index==-1) return;
//  dataTypeDecoupageModel= dataTableTypeDecoupage[index];

}

onIndexData(value){
  return DataTableSerie.indexWhere((e)=> e.serie ==value );
}





onSelectAllChecBox(){
 if(isSelectTitreSerie.isEmpty){
    isSelectSerie.value = DataTableSerie.map((e)=> e.serie==""?e.libSerie!:e.serie!).toList();
 isSelectSerie.value = isSelectSerie.toSet().toList();
 isSelectTitreSerie.add(controlleEtablissement.selectTypeEnseignement.value);
 } else{
   isSelectSerie.clear(); 
   isSelectTitreSerie.clear(); 
   DataSerie.dataSerie!.clear();
 }

}


onSelectCheckBox({String? lib=""}){
   
     lib !=""? isSelectSerie.contains(lib) == true ?isSelectSerie.remove(lib)
                     :isSelectSerie.add(lib!):"";
  
     bool isverification= DataTableSerie.length == isSelectSerie.length;
    
     
     isverification? isSelectTitreSerie.add(controlleEtablissement.selectTypeEnseignement.value):isSelectTitreSerie.clear();
    
    

    }
  








  
  

  }
