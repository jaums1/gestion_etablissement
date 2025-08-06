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
   var DataTableNiveauEtudeFiltre= <TNiveauModel>[].obs;
   var DataNiveau = TNiveauModel().obs;
  
   final idNiveau =0.obs;
   final isreactive =false.obs;
   final params ="".obs;
   final isLoading =false.obs;
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
    idCycle.text =   DataNiveau.value.iDCycleScolaire.toString() ;
    niveau.text =  DataNiveau.value.niveau.toString()==""?"":DataNiveau.value.niveau.toString();
    typeNiveau.text = DataNiveau.value.typeNiveau.toString() == ""?"":DataNiveau.value.typeNiveau.toString();
    }else{
     
      DataNiveau.value.iDCycleScolaire=controlle.DatacyleModel.iDCycleScolaire ;
      DataNiveau.value.niveau=niveau.text;
      DataNiveau.value.typeNiveau=typeNiveau.text;
    }
   
   }

@override
  void onInit() async{
   await H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
  H_RecupeData({String? param})async {
   controlle.selectRadio.value==""?  controlle.H_RecupeData() : null;
   try {
    if(param=="Configuration") if( params.value.toLowerCase() == controlle.selectRadio.value.toLowerCase()) return;
     DataTableNiveauEtude.clear();
      isSelectNiveau.clear();
      isLoading.value=false;
  ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TNiveauModel>("${TEndpoint.linkNiveauScolaire}/${controlle.DatacyleModel.cycleScolaire}",
                                             fromJson: (data) =>TNiveauModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataTableNiveauEtude.value = reponse.data!;
      DataTableNiveauEtudeFiltre.value = reponse.data!;
      if(param=="Configuration"){
        isSelectNiveau.value = DataTableNiveauEtude.where((e)=> e.etat==true).map((e)=> e.niveau??"").toList();
        isSelectNiveau.length == DataTableNiveauEtude.length? isSelectTitreNiveau.add(controlle.selectRadio.value):"";
        params.value = controlle.selectRadio.value;
      }
      isLoading.value=true;
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
                        data: DataNiveau.value.toMap(),fromJson: (data) =>TNiveauModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataNiveau.value =reponse.data!;
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
  data: DataNiveau.value.toMap(),fromJson: (data) =>TNiveauModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataNiveau.value =reponse.data!;
      H_RecupeModif(id:DataNiveau.value.iDNiveauScolaire);
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
    DataNiveau.value = DataTableNiveauEtude.firstWhere((e)=> e.iDNiveauScolaire==id   ,
    orElse: () => TNiveauModel(),); 
  }

 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() async{
    if (isSelectNiveau.isEmpty)return false;
   await H_Modifier();
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
 DataNiveau.value.niveauData=isSelectNiveau;
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
    
     DataNiveau.value.niveauData=isSelectNiveau;

 }



 }


