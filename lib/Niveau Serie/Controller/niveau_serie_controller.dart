import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Niveau%20Serie/Screen/ShowDialog/dialogue_niveau_serie.dart';
import 'package:ecole/Niveau_Scolaire/Controller/niveauscolaire_controller.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
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




class TNiveauSerieController extends GetxController with TControllerData{
   static TNiveauSerieController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
  String params="";
  String action="";
  final isLoading = false.obs;
   var DataTableNiveauSerie= <TNiveauSerieModel>[].obs;
   var DataTableFiltreNiveauSerie= <TNiveauSerieModel>[].obs;
   var DataTableSelectNiveauSerie= <TNiveauSerieModel>[].obs;
   var DataTableSerie= <TSerieModel>[];
   final Etat =true.obs;

    var isSelectNiveauSerie=<String>[].obs;
    var isSelectNiveauSerieTable=<String>[].obs;
  


   ///// LES INSTANCES
    var DataNiveauSerie = TNiveauSerieModel();
    final _client = TDioHelper(baseUrl: TApi.httpLien);


    
    final controlleEtablissement= Get.find<TEtablissementController>();
    // final controllerPage= Get.put(TPageNiveauSerieController());
    final controllerSerie= Get.find<TSerieController>();
    final controllerNiveau= Get.find<TNiveauScolaireController>();
    final controllerCycle = Get.find<TCycleController>();
      List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Niveau Serie"),size: ColumnSize.L),
  //  if() DataColumn2(label:  Text("Actions"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];
    // final controllerPage = TPageNiveauSerieController();
  

     final libSerie =TextEditingController();
     final serie =TextEditingController();
    ///////// TRAITEMENT
  
  
  void H_Clear(){
      libSerie.clear();
      serie.clear();
    }

  void HLitSerieScolaire({String? param="AFFICHAGE"}){
    if(param=="AFFICHAGE"){
   
    
    }else{
      DataNiveauSerie.typeEnseignement    = controllerCycle.DatacyleModel.cycleScolaire;
      DataNiveauSerie.iDSerie             = controllerSerie.DataSerie.iDSerie;
      DataNiveauSerie.serie               = controllerSerie.DataSerie.serie;
      DataNiveauSerie.iDNiveauScolaire    = controllerNiveau.DataNiveau.iDNiveauScolaire;
      DataNiveauSerie.niveau              = controllerNiveau.DataNiveau.niveau;
      DataNiveauSerie.niveauSerie         = "${DataNiveauSerie.niveau} ${DataNiveauSerie.serie}";
      
    }
   
   }


////// RECUPERATION
 @override
  H_RecupeData({String? param})async {
   try {
    isLoading.value =false;
  
  ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TNiveauSerieModel>("${TEndpoint.linkNiveauSerie}/${controllerCycle.selectRadio.value}",
                                             fromJson: (data) =>TNiveauSerieModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableNiveauSerie.value = reponse.data!;
       DataTableFiltreNiveauSerie.value =reponse.data!;
      DataTableSelectNiveauSerie.value = DataTableNiveauSerie.where((e) => e.Etat==true).map((e) => e).toList();
      isSelectNiveauSerieTable.value =DataTableSelectNiveauSerie.map((e) => e.niveauSerie!).toList();
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
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TNiveauSerieModel>(TEndpoint.linkNiveauSerie,
                        data: DataNiveauSerie.toMap(),fromJson: (data) =>TNiveauSerieModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataNiveauSerie =reponse.data!;
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

  ////// MODIFIER
  @override
  H_Modifier() async{
    
    try {
       HLitSerieScolaire(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
    
       final reponse =await _client.patch<TNiveauSerieModel>(TEndpoint.linkNiveauSerie,
                        data: DataNiveauSerie.toMap(),fromJson: (data) =>TNiveauSerieModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataNiveauSerie =reponse.data!;
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

///// SUPPRIMER
@override
  H_Supprimer({int? id, String? param}) async{
  
    try {
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageSuppressionChargement.tr,animation: TImages.docerAnimation, width: 200,));

       final reponse =await _client.delete("${TEndpoint.linkNiveauSerie}/$id",);
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
 ///// INITIALISATION
@override
  void H_Initialise() {
    DataTableSerie.clear();
     H_Clear();
    controllerNiveau.DataNiveau = TNiveauModel(); 
    isSelectNiveauSerie.clear();
    DataNiveauSerie = TNiveauSerieModel();
  }

  @override
  void H_RecupeModif({int? id, String? param}) {
     isSelectNiveauSerie.clear();
     DataTableSerie.clear();
    DataNiveauSerie = TNiveauSerieModel();
    DataNiveauSerie = DataTableNiveauSerie.firstWhere((e) =>e.iDNiveauSerie==id, orElse: () => TNiveauSerieModel(),);
    DataNiveauSerie.niveau !=""? isSelectNiveauSerie.add(DataNiveauSerie.serie!):"";
    controllerNiveau.H_RecupeModif(id: DataNiveauSerie.iDNiveauScolaire);
  }

 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() async{
    if (isSelectNiveauSerieTable.isEmpty)return false;
     DataNiveauSerie.DataTableNiveauSerie = isSelectNiveauSerieTable;
    await H_Modifier();
      return true;
      
    }


 //// AUTRE PROCEDURE
void onSelectRadio(value){
 final index = onIndexData(value);
 if(index==-1) return;
//  dataTypeDecoupageModel= dataTableTypeDecoupage[index];

}

void onSelectCheckBox(value){
  if(action ==TraitementAction.modifier.name) isSelectNiveauSerie.clear() ;


  bool isverification = isSelectNiveauSerie.contains(value);
       isverification ? isSelectNiveauSerie.remove(value): isSelectNiveauSerie.add(value); 

    if(isverification){
     DataTableSerie.removeWhere((e)=>e.serie ==""?e.libSerie==value:e.serie==value);
    }else{  
    DataTableSerie.add(
      controllerSerie.DataTableSerie.firstWhere((e)=>e.serie==""?e.libSerie==value : e.serie==value,orElse: () => TSerieModel(),)
    );
    }

    DataNiveauSerie.DataTable=DataTableSerie.map((e)=> e).toList();
}

void onSelectCheckBoxTable({String? niveauSerie}){

     bool isVerifie = isSelectNiveauSerieTable.contains(niveauSerie);
               isVerifie == true ?isSelectNiveauSerieTable.remove(niveauSerie):isSelectNiveauSerieTable.add(niveauSerie!);
}

void onSelectCheckBoxAll(value){
  isSelectNiveauSerieTable.clear();
    if(value){
     isSelectNiveauSerieTable.value = DataTableNiveauSerie.map((e)=> e.niveauSerie!).toList();
    }
}

void onSelectCombo(value){
  controllerNiveau.DataNiveau = controllerNiveau.DataTableNiveauEtude.firstWhere((e)=>e.niveau==value,
  orElse: () => TNiveauModel(),);
}

onIndexData(value){
  final index = DataTableNiveauSerie.indexWhere((e)=> e.iDNiveauSerie==value );
   if(index ==-1) return;
  DataNiveauSerie = DataTableNiveauSerie[index];
  return DataNiveauSerie;
}

void showNiveauSerieDialog() async {
  final result = await Get.dialog(
   TDialogueNiveauSerie(),
  );
  if (result != null) {
    isSelectNiveauSerie.value = result;
  }
}




  }
