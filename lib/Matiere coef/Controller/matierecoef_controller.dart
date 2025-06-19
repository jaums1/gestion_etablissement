import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Cycle/Controller/cycle_controller.dart';
import 'package:ecole/Matiere%20coef/Controller/page_matierecoef_controller.dart';
import 'package:ecole/Matiere%20coef/Model/matierecoef_model.dart';
import 'package:ecole/Matiere%20coef/Repository/coefficient_repository.dart';
import 'package:ecole/Matiere/Controller/matiere_controller.dart';
import 'package:ecole/Matiere/Model/matiere_model.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:ecole/Niveau%20Serie/Model/niveau_serie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/enums.dart';






class TCoefficientController extends GetxController with TControllerData{
   static TCoefficientController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var dataTableCoefficient= <TCoefficientModel>[].obs;
   var dataTableFiltreCoefficient= <TCoefficientModel>[].obs;
   final params ="".obs;
   final action ="".obs;
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

    var dataMatiereCoef = TCoefficientModel();
    final repositorycontroller = Get.put(TCoefficientRepository());
     final controller = Get.find<TPageMatiereCoefController>();
     final controllerMatiere = Get.find<TMatiereController>();
     final controllerNiveauSerie = Get.find<TNiveauSerieController>();
     final controllerCycle = Get.find<TCycleController>();
    ///////// TRAITEMENT
  @override
  void onInit() {
    H_RecupeData(param: controllerCycle.datacyleModel.cycleScolaire);
    super.onInit();
  }

    void H_RecupMatiere(){
      dataTableFiltreMatiere.value = controllerMatiere.dataTableMatiere.where((e)=> e.etat==true).
      map((datas)=> datas).toList();
    }

    void H_Validation(){
     if (dataNiveauSerie.niveauSerie==null) {
        TLoader.errorSnack(title: "NIVEAU SERIE",message: "Veuillez sélectionner votre niveau série");
        return;
     }
      dataMatiereCoef.datatableMatiere=dataTableMatiere;
    //   dataMatiereCoef.datatableMatiere?.map((e){
    //  dataMatiere =e;
    //   return print(dataMatiere.toJson());
    //   }).toList();
    H_Enregistrer();

    }
    
   void HLitMatiereCoef({String? param="AFFICHAGE"}){
    if (param=="AFFICHAGE") {
       iDMatiere.text       =  dataMatiereCoef.iDMatiere ==null? "":dataMatiereCoef.iDMatiere.toString();
       iDNiveau.text        =  dataMatiereCoef.iDCoefficient ==null? "":dataMatiereCoef.iDCoefficient.toString();
       coefficient.text     =  dataMatiereCoef.coefficient ==null? "":dataMatiereCoef.coefficient.toString();
    }else{
      dataMatiereCoef.coefficient = dataMatiere.coef;
      dataMatiereCoef.iDMatiere   = dataMatiere.iDMatiere;
      dataMatiereCoef.matiere     = dataMatiere.matiere;
      dataMatiereCoef.iDNiveauSerie    = dataNiveauSerie.iDNiveauSerie;
      dataMatiereCoef.iDNiveauScolaire    = dataNiveauSerie.iDNiveauScolaire;
      dataMatiereCoef.niveauSerie      = dataNiveauSerie.niveauSerie;
      dataMatiereCoef.niveau           = dataNiveauSerie.niveau;
      dataMatiereCoef.typeEnseignement = controllerCycle.datacyleModel.cycleScolaire.toString();
      
    }
   }
   
@override
  void H_Initialise() {
    final datainit =TCoefficientModel();
    dataMatiereCoef = datainit;
    HLitMatiereCoef();
  }

///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
     try {
      HLitMatiereCoef(param: "ENVOYER");
   final result =  await  repositorycontroller.H_EnregistrerData(dataMatiereCoef);
  if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return null;}
      TLoader.successSnack(title:"ENREGISTRER" ,message: "Vos données ont bien été enregistrée");
       controller.previousPage();
       H_RecupeData(param:controllerCycle.datacyleModel.cycleScolaire );
   } catch (e) {
     TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return;
   }
  }

// SUPPRIMER
@override
 H_Supprimer({int? id,String? param}) async {
    try {
      await  repositorycontroller.H_SupprimerData(id);
     H_RecupeData();
     Get.back();
     TLoader.successSnack(title: "SUPPRIMER",message: "La ligne a bien été supprimée");
     return true;
    } catch (e) {
       TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return;
    }
  }

// MODIFICATION
@override
 H_Modifier() async{
    try {
      HLitMatiereCoef(param: "ENVOYER");
    final result=  await  repositorycontroller.H_ModifierData(dataMatiereCoef);
     if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return null;}
      TLoader.successSnack(title:"MODIFIER" ,message: "Vos données ont bien été modifiée");
       controller.previousPage();
       H_RecupeData();
   } catch (e) {
    TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;
   }

  }

@override
  void H_RecupeData({String? param}) async {
  try {
      dataTableMatiere.clear();
      isSelectNiveauSerie.clear();
      final data = await repositorycontroller.H_RecupData(param: param);
      if (data is List) {
      dataTableCoefficient.value = data.map((datas)=>TCoefficientModel.fromMap(datas)).toList();
      dataTableFiltreCoefficient.value =dataTableCoefficient;

    }
    data==null? TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion"):"";
   } catch (e) {
       TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return;
   }
  }
  
@override
  void H_RecupeModif({int? id, String? param}) {
     dataMatiereCoef = dataTableCoefficient.firstWhere(
    (data)=> data.iDCoefficient ==id
  );
  
  HLitMatiereCoef();
  action.value=TraitementAction.modifier.name;
  controller.nextPage();
  }  


@override
  H_ValiderConfig() {
    if (dataTableCoefficient.isEmpty || controller.currentPage.value==1 )return false;
      return true;
  }

}











