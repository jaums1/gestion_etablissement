import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Cycle/Controller/cycle_controller.dart';
import 'package:ecole/Coefficient/Model/matierecoef_model.dart';
import 'package:ecole/Coefficient/Repository/coefficient_repository.dart';
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
import '../Model/listematierecoef_model.dart';






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

    var DataCoefficient = TCoefficientModel();
    final repositorycontroller = Get.put(TCoefficientRepository());
     final controllerMatiere = Get.find<TMatiereController>();
     final controllerNiveauSerie = Get.find<TNiveauSerieController>();
     final controllerCycle = Get.find<TCycleController>();

      final _client = TDioHelper(baseUrl: TApi.httpLien);
    ///////// TRAITEMENT
      
@override
  void H_Initialise() {
     DataCoefficient =TCoefficientModel();
     controllerMatiere.H_Initialise();
     controllerNiveauSerie.H_Initialise();
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
                        data: DataCoefficient.toMap(),fromJson: (data) =>TCoefficientModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataCoefficient =reponse.data!;
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
                        data: DataCoefficient.toMap(),fromJson: (data) =>TCoefficientModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataCoefficient =reponse.data!;
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
  final reponse =await _client.getList<TCoefficientModel>(TEndpoint.linkCoefficient,fromJson: (data) =>TCoefficientModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableCoefficient.value = reponse.data!;
      DataTableFiltreCoefficient.value =reponse.data!;
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
  void H_RecupeModif({int? IDNiveauSerie, int? id=0}) {
   DataCoefficient= DataTableCoefficient.firstWhere((e)=> 
   e.DataNiveauSerie!.iDNiveauSerie==IDNiveauSerie,orElse: () => TCoefficientModel(),);
   ////// NIVEAU SERIE
    if(DataCoefficient.DataNiveauSerie ==null) return;
     controllerNiveauSerie.H_RecupeModif(id:DataCoefficient.DataNiveauSerie!.iDNiveauSerie );
    if(id==0 || id==null) return;
     
     ///// MATIERE
    DataCoefficient.DataMatiereCoef= DataCoefficient.DataTableMatiereCoef!.firstWhere(
    (e)=> e.IDAffectationNiveauMatiere==id,orElse: () => TListeMatiereCoef(),);

    if(DataCoefficient.DataMatiereCoef==null)return;
    controllerMatiere.H_RecupeModif(id: DataCoefficient.DataMatiereCoef!.IDMatiere);
    HLitMatiereCoef();
    
  }  

 
  @override
  void onInit() {
    H_RecupeData();
    super.onInit();
  }

   
    
   void HLitMatiereCoef({String? param="AFFICHAGE"}){
    if (param=="AFFICHAGE") {
       coefficient.text     = DataCoefficient.DataMatiereCoef==null?"0":DataCoefficient.DataMatiereCoef!.Coefficient.toString(); 
    }else{
      DataCoefficient.DataMatiereCoef!.Coefficient = int.parse(coefficient.text);
      DataCoefficient.DataMatiereCoef!.IDMatiere = controllerMatiere.DataMatiere.value.iDMatiere;
      DataCoefficient.DataMatiereCoef!.Matiere = controllerMatiere.DataMatiere.value.matiere;
      DataCoefficient.DataMatiereCoef!.IDNiveauSerie = controllerNiveauSerie.DataNiveauSerie.value.iDNiveauSerie;
      DataCoefficient.DataMatiereCoef!.TypeEnseignement = controllerCycle.DatacyleModel.cycleScolaire.toString();;      
    }
   }
  

@override
  H_ValiderConfig() {
    if (DataTableCoefficient.isEmpty )return false;
      return true;
  }

}











