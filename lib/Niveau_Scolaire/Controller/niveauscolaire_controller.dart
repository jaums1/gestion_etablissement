import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Cycle/Controller/cycle_controller.dart';
import '../Model/niveauscolaire_model.dart';



class TNiveauScolaireController extends GetxController with TControllerData{
   static TNiveauScolaireController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var DataTableNiveauEtude= <TNiveauModel>[].obs;
   var DataNiveau = TNiveauModel();

   final idNiveau =0.obs;
   final params ="".obs;
  final isSelectTitreNiveau = <String>[].obs;
  final isSelectNiveau = <String>[].obs;

  final niveau = TextEditingController();
  final typeNiveau = TextEditingController();
  final idCycle = TextEditingController();

   ///// LES INSTANCES
    final _client = TDioHelper(baseUrl: TApi.httpLien);
    final controlle= Get.find<TCycleController>();

    ///////// TRAITEMENT
     
   HLitNiveauScolaire({String? param="AFFICHAGE"}){
    if(param=="AFFICHAGE"){
    idCycle.text =   DataNiveau.iDCycleScolaire.toString() ;
    niveau.text =  DataNiveau.niveau.toString()==""?"":DataNiveau.niveau.toString();
    typeNiveau.text = DataNiveau.typeNiveau.toString() == ""?"":DataNiveau.typeNiveau.toString();
    }else{
     
      DataNiveau.iDCycleScolaire=controlle.DatacyleModel.iDCycleScolaire ;
      DataNiveau.niveau=niveau.text;
      DataNiveau.typeNiveau=typeNiveau.text;
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
    if( params.value.toLowerCase() == controlle.selectRadio.value.toLowerCase()) return;
     DataTableNiveauEtude.clear();
      isSelectNiveau.clear();

  ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TNiveauModel>("${TEndpoint.linkNiveauScolaire}/${controlle.selectRadio.value}",
                                             fromJson: (data) =>TNiveauModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataTableNiveauEtude.value = reponse.data!;
      isSelectNiveau.value = DataTableNiveauEtude.where((e)=> e.etat==true).map((e)=> e.niveau??"").toList();
      isSelectNiveau.length == DataTableNiveauEtude.length? isSelectTitreNiveau.add(controlle.selectRadio.value):"";
      params.value = controlle.selectRadio.value;
    }
    } catch (e) {
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
    }         

  }
  
//// ENREGISTRER
@override
  H_Enregistrer() async{

   try {
       HLitNiveauScolaire(param: "ENVOYER");
    
       final reponse =await _client.post<TNiveauModel>(TEndpoint.linkTypeDecoupageScolaire,
                        data: DataNiveau.toMap(),fromJson: (data) =>TNiveauModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataNiveau =reponse.data!;
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
       HLitNiveauScolaire(param: "ENVOYER");
    
     final reponse =await _client.patch<TNiveauModel>(TEndpoint.linkNiveauScolaire,
  data: DataNiveau.toMap(),fromJson: (data) =>TNiveauModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataNiveau =reponse.data!;
      H_RecupeModif(id:DataNiveau.iDNiveauScolaire);
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
      final reponse = await _client.delete("${TEndpoint.linkNiveauScolaire}/$id");
      reponse.success ==true?TLoader.successSnack(title: "SUPPRIMER",
       message:"Supprimer avec succès") :TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet");
    } catch (e) {
       TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet source d'erreur :$e");
    }
 

  }
 ///// INITIALISATION
 @override
  void H_RecupeModif({int? id, String? param}) {
    DataNiveau = DataTableNiveauEtude.firstWhere((e)=> e.iDNiveauScolaire==id   ,
    orElse: () => TNiveauModel(),); 
  }

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
  return DataTableNiveauEtude.indexWhere((e)=> e.niveau ==value );
}


onSelectAllChecBox(){
 if(isSelectTitreNiveau.isEmpty){
    isSelectNiveau.value = DataTableNiveauEtude.map((e)=> e.niveau??"").toList();
 isSelectNiveau.value = isSelectNiveau.toSet().toList();
 isSelectTitreNiveau.add(controlle.selectRadio.value);
 DataNiveau.niveauData=isSelectNiveau;
 } else{
   isSelectNiveau.clear(); 
   isSelectTitreNiveau.clear(); 
 }

}



onSelectCheckBox({String? libNiveau=""}){
   libNiveau !=""? isSelectNiveau.contains(libNiveau) == true ?isSelectNiveau.remove(libNiveau)
                     :isSelectNiveau.add(libNiveau.toString()):"";
   
    bool? isverification= DataTableNiveauEtude.length == isSelectNiveau.length;
     
     isverification? isSelectTitreNiveau.add(controlle.selectRadio.value):isSelectTitreNiveau.clear();
    
     DataNiveau.niveauData=isSelectNiveau;

 }


 }


