import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../Model/matiere_model.dart';



class TMatiereController extends GetxController with TControllerData{
   static TMatiereController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var DataTableMatiere= <TMatiereModel>[].obs;
   var DataTableMatiereSelect= <TMatiereModel>[];
   var DataTableMatiereSelectionner= <TMatiereModel>[];
   var DataTableFiltreMatiere= <TMatiereModel>[].obs;
   var DataMatiere = TMatiereModel().obs;
   final isLoading = false.obs;
 
   final params ="".obs;
   final action ="".obs;
   final indexData =0.obs;
   final isSelectAll =false.obs;
  final isSelectTitre= <String>[].obs;
  final isSelectMatiere = <String>[].obs;
  final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,),
     DataColumn2(label: Text("Designation Matière"),size: ColumnSize.L),
     DataColumn2(label: Text("Action"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];

  var matiere = TextEditingController();
  var codeMatiere = TextEditingController();

   ///// LES INSTANCES
     final _client = TDioHelper(baseUrl: TApi.httpLien);
   
 
    
    ///////// TRAITEMENT
   void HLitMatiere({String? param="AFFICHAGE"}){
    if (param=="AFFICHAGE") {
       codeMatiere.text = DataMatiere.value.codeMatiere ==null? "":DataMatiere.value.codeMatiere!;
       matiere.text     =  DataMatiere.value.matiere ==null? "":DataMatiere.value.matiere!;
    }else{
      DataMatiere.value.codeMatiere = codeMatiere.text;
       DataMatiere.value.matiere = matiere.text;
    }
   }
   
@override
  void H_Initialise() {
    DataMatiere.value =TMatiereModel();
    codeMatiere.clear();
    matiere.clear();
  }

///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
     try {
       HLitMatiere(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TMatiereModel>(TEndpoint.linkMatiere,
                        data: DataMatiere.value.toMap(),fromJson: (data) =>TMatiereModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataMatiere.value =reponse.data!;
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
       final reponse =await _client.delete("${TEndpoint.linkMatiere}/$id",);
    ////// VERIFICATION 
    if(reponse.success){
        Get.back();
       H_RecupeData();
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
       HLitMatiere(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TMatiereModel>(TEndpoint.linkMatiere,
                        data: DataMatiere.value.toMap(),fromJson: (data) =>TMatiereModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataMatiere.value =reponse.data!;
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
 H_RecupeData() async {
  try {
    isLoading.value =false;
  final reponse =await _client.getList<TMatiereModel>(TEndpoint.linkMatiere,
                                             fromJson: (data) =>TMatiereModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isSelectMatiere.clear();
      isLoading.value =true;
      DataTableMatiere.value = reponse.data!;
      DataTableFiltreMatiere.value =reponse.data!;
      DataTableMatiereSelectionner = DataTableMatiere.where((e)=> e.etat==true).map((e)=> e).toList();
      isSelectMatiere.value = DataTableMatiere.where((e)=> e.etat==true).map((e)=> e.matiere!).toList();
      DataMatiere.value.DatatableMa = DataTableMatiereSelectionner;
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
   H_RecupeModif({int? id, String? param}) {
     DataMatiere.value = DataTableMatiere.firstWhere(
      (data)=> data.iDMatiere ==id,orElse: () => TMatiereModel(),);
      HLitMatiere();
  }  


@override
  H_ValiderConfig() async{
    if (isSelectMatiere.isEmpty )return false;
    DataMatiere.value.DatatableMa = DataTableMatiereSelectionner;
     await H_Modifier();
      return true;
  }

////// INITIALISATION 
     @override
  void onInit() {
    H_RecupeData();
    super.onInit();
    
  }
 
 

  



///// SUPPRESSION DES DONNEES
// Void hSupprimeData()async{}

/////// SELECTION DE CHECKBOX
selectCheckBox({String? libMatiere=""}){
 
           bool isVerifie = isSelectMatiere.contains(libMatiere);
               isVerifie == true ?isSelectMatiere.remove(libMatiere):isSelectMatiere.add(libMatiere!);

               if(isVerifie){
               DataTableMatiereSelectionner.removeWhere((e)=> e.matiere==libMatiere);
               }else{
                DataTableMatiereSelectionner.add( 
                 DataTableMatiere.firstWhere((e)=> e.matiere==libMatiere,orElse: () => TMatiereModel(),)
                );
               }
         
    }
 
    /////// SELECTION TOUS LES CHECKBOX
selectAllCheckBox({bool? value}){
 
   isSelectMatiere.clear();
   if(value!){
    DataTableMatiereSelectionner = DataTableMatiere.map((e)=> e ).toList();
     isSelectMatiere.value = DataTableMatiereSelectionner.map((e)=> e.matiere.toString() ).toList();
   }else{
   DataTableMatiereSelectionner.clear();
   }

    }


}











