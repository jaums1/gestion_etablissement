import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Cycle/Controller/cycle_controller.dart';
import 'package:ecole/Matiere%20coef/Model/matierecoef_model.dart';
import 'package:ecole/Matiere%20coef/Repository/coefficient_repository.dart';
import 'package:ecole/Matiere/Controller/matiere_controller.dart';
import 'package:ecole/Matiere/Model/matiere_model.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:ecole/Niveau%20Serie/Model/niveau_serie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';






class TCoefficientController extends GetxController with TControllerData{
   static TCoefficientController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var DataTableCoefficient= <TCoefficientModel>[].obs;
   var DataTableFiltreCoefficient= <TCoefficientModel>[].obs;
   final params ="".obs;
   final action ="".obs;
   final isExpanded = false.obs;
   final isLoading = false.obs;
   final dataTableMatiere= <TMatiereModel>[].obs;
   final dataTableFiltreMatiere= <TMatiereModel>[].obs;
   
   final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,),
     DataColumn2(label: Text("Niveau Série"),fixedWidth: 130),
     DataColumn2(label: Text("Matière"),size: ColumnSize.L),
     DataColumn2(label: Text("Action"),fixedWidth: 120,headingRowAlignment: MainAxisAlignment.center),         
  ];


   final isSelectNiveauSerie= <String>[].obs;
   final keyMatiereCoef = GlobalKey<FormState>();
 

  var iDNiveau    = TextEditingController();
  var iDMatiere   = TextEditingController();
  var coefficient = TextEditingController();
  var matiere = TextEditingController();

   ///// LES INSTANCES
   var  dataNiveauSerie = TNiveauSerieModel();
   var  dataMatiere     = TMatiereModel();

    var DataMatiereCoef = TCoefficientModel();
    final repositorycontroller = Get.put(TCoefficientRepository());
     final controllerMatiere = Get.find<TMatiereController>();
     final controllerNiveauSerie = Get.find<TNiveauSerieController>();
     final controllerCycle = Get.find<TCycleController>();

      final _client = TDioHelper(baseUrl: TApi.httpLien);
    ///////// TRAITEMENT
      
@override
  void H_Initialise() {
     DataMatiereCoef =TCoefficientModel();
     coefficient.clear();
     matiere.clear();
  }

///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
     try {
       HLitMatiereCoef(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TCoefficientModel>(TEndpoint.linkCoefficient,
                        data: DataMatiereCoef.toMap(),fromJson: (data) =>TCoefficientModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataMatiereCoef =reponse.data!;
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
       final reponse =await _client.delete("${TEndpoint.linkCoefficient}/$id",);
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
       HLitMatiereCoef(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TCoefficientModel>(TEndpoint.linkCoefficient,
                        data: DataMatiereCoef.toMap(),fromJson: (data) =>TCoefficientModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataMatiereCoef =reponse.data!;
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
  final reponse =await _client.getList<TCoefficientModel>(TEndpoint.linkCoefficient,
  // /${controllerCycle.DatacyleModel.cycleScolaire}",
                                             fromJson: (data) =>TCoefficientModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableCoefficient.value = reponse.data!;
      DataTableFiltreCoefficient.value =reponse.data!;
      print(DataTableCoefficient);
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
  void H_RecupeModif({int? id, String? param}) {
     DataMatiereCoef = DataTableCoefficient.firstWhere(
      (data)=> data.DataMatiereCoef!.IDAffectationNiveauMatiere ==id,orElse: () => TCoefficientModel(),);
     HLitMatiereCoef();

  }  

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  @override
  void onInit() {
    H_RecupeData();
    super.onInit();
  }

   
    
   void HLitMatiereCoef({String? param="AFFICHAGE"}){
    // if (param=="AFFICHAGE") {
    //    iDMatiere.text       =  dataMatiereCoef.iDMatiere ==null? "":dataMatiereCoef.iDMatiere.toString();
    //    iDNiveau.text        =  dataMatiereCoef.iDCoefficient ==null? "":dataMatiereCoef.iDCoefficient.toString();
    //    coefficient.text     =  dataMatiereCoef.coefficient ==null? "":dataMatiereCoef.coefficient.toString();
    // }else{
    //   dataMatiereCoef.coefficient = dataMatiere.coef;
    //   dataMatiereCoef.iDMatiere   = dataMatiere.iDMatiere;
    //   dataMatiereCoef.matiere     = dataMatiere.matiere;
    //   dataMatiereCoef.iDNiveauSerie    = dataNiveauSerie.iDNiveauSerie;
    //   dataMatiereCoef.iDNiveauScolaire    = dataNiveauSerie.iDNiveauScolaire;
    //   dataMatiereCoef.niveauSerie      = dataNiveauSerie.niveauSerie;
    //   dataMatiereCoef.niveau           = dataNiveauSerie.niveau;
    //   dataMatiereCoef.typeEnseignement = controllerCycle.DatacyleModel.cycleScolaire.toString();
      
    // }
   }
  

@override
  H_ValiderConfig() {
    if (DataTableCoefficient.isEmpty )return false;
      return true;
  }

}











