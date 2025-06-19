import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Niveau%20Serie/Controller/page_niveau_serie_model.dart';
import 'package:ecole/Niveau%20Serie/Screen/ShowDialog/dialogue_niveau_serie.dart';
import 'package:ecole/Niveau_Scolaire/Controller/niveauscolaire_controller.dart';

import '../../Cycle/Controller/cycle_controller.dart';
import '../../Etablissement/Controller/etablissement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Niveau_Scolaire/Model/niveauscolaire_model.dart';
import '../../Serie/Controller/serie_controller.dart';
import '../../Serie/Model/serie_model.dart';
import '../Model/niveau_serie_model.dart';
import '../Repository/niveau_serie_repository.dart';



class TNiveauSerieController extends GetxController with TControllerData{
   static TNiveauSerieController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var dataTableNiveauSerie= <TNiveauSerieModel>[].obs;
   var dataTableFiltreNiveauSerie= <TNiveauSerieModel>[].obs;
   var dataTableSelectNiveauSerie= <TNiveauSerieModel>[].obs;
   var dataTableSerie= <TSerieModel>[].obs;
   final Etat =true.obs;
     String action="";
    var isSelectSerie=<String>[].obs;
      List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 30,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Select",maxLines: 1,overflow: TextOverflow.ellipsis,),fixedWidth: 70,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Niveau Serie"),size: ColumnSize.L),
     DataColumn2(label: Text("Actions"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];


   ///// LES INSTANCES
    var dataSerieModel = TSerieModel();
    var dataNiveauModel = TNiveauModel();
    var dataNiveauSerieModel = TNiveauSerieModel();

    final repositorycontroller = Get.put(TSerieNiveauRepository());
    final controlleEtablissement= Get.find<TEtablissementController>();
    final controllerSerie= Get.find<TSerieController>();
    final controllerNiveau= Get.find<TNiveauScolaireController>();
    final controllerCycle = Get.find<TCycleController>();
    final controllerPage = Get.find<TPageNiveauSerieController>();

     final libSerie =TextEditingController();
     final serie =TextEditingController();
    ///////// TRAITEMENT
  
   void HLitSerieScolaire({String? param="AFFICHAGE"}){
    if(param=="AFFICHAGE"){
    libSerie.text =  dataSerieModel.libSerie.toString()==""?"":dataSerieModel.libSerie.toString() ;
    serie.text    =  dataSerieModel.serie.toString()==""?"":dataSerieModel.serie.toString();
    
    }else{
      dataNiveauSerieModel.typeEnseignement    = controllerCycle.datacyleModel.cycleScolaire;
      dataNiveauSerieModel.iDSerie             = dataSerieModel.iDSerie;
      dataNiveauSerieModel.serie               = dataSerieModel.serie;
      dataNiveauSerieModel.iDNiveauScolaire    = dataNiveauModel.iDNiveauScolaire;
      dataNiveauSerieModel.niveau              = dataNiveauModel.niveau;
      dataNiveauSerieModel.niveauSerie         = "${dataNiveauModel.niveau} ${dataSerieModel.serie}";
      
    }
   
   }


@override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
  void H_RecupeData({String? param="Secondaire"})async {
      dataTableNiveauSerie.clear();
      isSelectSerie.clear();
      final data=await repositorycontroller.H_RecupData(param: param);
      if (data is List) dataTableNiveauSerie.value = data.map((datas)=>TNiveauSerieModel.fromMap(datas)).toList();       
      dataTableFiltreNiveauSerie.value = dataTableNiveauSerie;
      
  }
  
//// ENREGISTRER
@override
  H_Enregistrer() async{
   try {
     HLitSerieScolaire(param: "ENVOYER");
     final data =await  repositorycontroller.H_EnregistrerData(dataNiveauSerieModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
    action ==TraitementAction.nouveau.name?TLoader.successSnack(title: "NIVEAU SERIE",message:"Vos données ont bien été enregistrée"):
    TLoader.successSnack(title: "NIVEAU SERIE",message:"Vos données ont bien été modifiée"); 
     controllerPage.previousPage();
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }

  ////// MODIFIER
  @override
  H_Modifier() async{
    try {
     HLitSerieScolaire(param: "ENVOYER");

     final data = await repositorycontroller.H_ModifierData(dataNiveauSerieModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
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
         Get.back();
      data ==true?TLoader.successSnack(title: "SUPPRIMER",
       message:"Supprimer avec succès") :TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet");

       data==true? H_RecupeData(param:controllerCycle.datacyleModel.cycleScolaire)
       :"";
    } catch (e) {
       TLoader.errorSnack(title: "ERREUR",
       message:"Veuillez bien vérifier votre connexion internet source d'erreur :$e");
    }
 

  }
 ///// INITIALISATION
@override
  void H_Initialise() {
    isSelectSerie.clear();
    dataNiveauSerieModel.dataTable.clear();
    final dataInit = TNiveauModel();
      dataNiveauModel = dataInit;
    final datainit =TNiveauSerieModel();
    dataNiveauSerieModel = datainit;
  }

 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() {
    
    if (dataTableNiveauSerie.isEmpty || controllerPage.currentPage.value==1 )return false;
      return true;
      
    }

 //// AUTRE PROCEDURE
void onSelectRadio(value){
 final index = onIndexData(value);
 if(index==-1) return;
//  dataTypeDecoupageModel= dataTableTypeDecoupage[index];

}

void onSelectCheckBox(value){

  if (dataNiveauModel.niveau==null) {
    TLoader.errorSnack(title: "NIVEAU SCOLAIRE",message: "Veuillez sélectionner votre niveau d'étude");
    return;
  }
  bool isverification =isSelectSerie.contains(value);
   isverification == true ?isSelectSerie.remove(value):isSelectSerie.add(value);
  if(isverification){
 final index =  dataNiveauSerieModel.dataTable.indexWhere((e)=> value=="Néant"?e.serie =="":e.serie==value );
 dataNiveauSerieModel.dataTable.removeAt(index);
  } else{
    int index = controllerSerie.onIndexData(value=="Néant"?"":value);
    if(index==-1) return;
     dataSerieModel = controllerSerie.dataTableSerie[index];
     dataNiveauSerieModel.dataTable.add(dataSerieModel);
  } 
}

void onSelectCombo(value){
 
  final index = controllerNiveau.onIndexData(value);
   if(index ==-1) return;
   dataNiveauModel = controllerNiveau.dataTableNiveauEtude[index];
}

onIndexData(value){
  final index = dataTableNiveauSerie.indexWhere((e)=> e.iDNiveauSerie==value );
   if(index ==-1) return;
  dataNiveauSerieModel = dataTableNiveauSerie[index];
  return dataNiveauSerieModel;
}

void showNiveauSerieDialog() async {
  final result = await Get.dialog(
   TDialogueNiveauSerie(),
  );
  if (result != null) {
    isSelectSerie.value = result;
  }
}




  }
