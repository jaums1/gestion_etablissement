import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Matiere/Controller/page_matiere_controller.dart';
import 'package:ecole/Matiere/Repository/matiere_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Model/matiere_model.dart';



class TMatiereController extends GetxController with TControllerData{
   static TMatiereController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var dataTableMatiere= <TMatiereModel>[].obs;
   var dataTableFiltreMatiere= <TMatiereModel>[].obs;
   final params ="".obs;
   final action ="".obs;
   final indexData =0.obs;
   final isSelectAll =false.obs;
  final isSelectTitre= <String>[].obs;
  final isSelectMatiere = <String>[].obs;
  final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,),
     DataColumn2(label: Text("Designation Matière"),size: ColumnSize.L),
     DataColumn2(label: Text("Action"),fixedWidth: 120,headingRowAlignment: MainAxisAlignment.center),         
  ];

  var matiere = TextEditingController();
  var codeMatiere = TextEditingController();

   ///// LES INSTANCES
    var matiereModel = TMatiereModel();
    final repositorycontroller = Get.put(TMatiereRepository());
     final controller = Get.find<TPageMatiereController>();
    
    ///////// TRAITEMENT
   void hlitMatiere({String? param="AFFICHAGE"}){
    if (param=="AFFICHAGE") {
       codeMatiere.text = matiereModel.codeMatiere ==null? "":matiereModel.codeMatiere!;
       matiere.text     =  matiereModel.matiere ==null? "":matiereModel.matiere!;
    }else{
      matiereModel.codeMatiere = codeMatiere.text;
       matiereModel.matiere = matiere.text;
    }
   }
   
@override
  void H_Initialise() {
    final datainit =TMatiereModel();
    matiereModel = datainit;
    hlitMatiere();
  }

///// ENREGISTREMENT 
@override
  Future<bool?> H_Enregistrer() async{
     try {
     ///// VERIFICATION DE MATIERE 
  final index = dataTableMatiere.indexWhere((data)=> data.matiere!.toLowerCase() == matiere.text.toLowerCase());
   if (index ==-1) {
      hlitMatiere(param: "ENVOYER");
      await  repositorycontroller.H_EnregistrerData(matiereModel);
      TLoader.successSnack(title:"Enregister" ,message: "La matière a bien été enregistrée");
      //  controller.previousPage();
       H_RecupeData();
      return true;
    }else{
      TLoader.warningSnack(title:"ENREGISTREMENT",message: "${matiere.text} existe déjà veulliez entrer une autre");
      return false;
    }
   } catch (e) {
     TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;
   }
  }

// SUPPRIMER
@override
  Future<bool?> H_Supprimer({int? id,String? param}) async {
    try {
      await  repositorycontroller.H_SupprimerData(id);
     H_RecupeData();
     Get.back();
     TLoader.successSnack(title: "SUPPRIMER",message: "La ligne a bien été supprimée");
     return true;
    } catch (e) {
      return false;
    }
  }

// MODIFICATION
@override
  Future<bool?> H_Modifier() async{
    try {
      hlitMatiere(param: "ENVOYER");
      await  repositorycontroller.H_ModifierData(matiereModel);
      TLoader.successSnack(title:"Modifier" ,message: "La matière a bien été modifier");
      // controller.previousPage(); 
      H_RecupeData();
    return true;
   } catch (e) {
    TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;
   }

  }

@override
  void H_RecupeData() async {
  try {
      dataTableMatiere.clear();
      isSelectMatiere.clear();
      final data = await repositorycontroller.H_RecupData(param: "");
      if (data is List) {
      dataTableMatiere.value = data.map((datas)=>TMatiereModel.fromMap(datas)).toList();
      dataTableFiltreMatiere.value =dataTableMatiere;
      isSelectMatiere.value = dataTableMatiere.where((e)=>e.etat==true).map((e)=> e.matiere.toString() ).toList();
      // for (var element in dataTableMatiere) {
      //    if (element.etat!) {
      //      isSelectMatiere.add(element.matiere!);
      //    }
      // }
      
    }else{
      
    }
    // controllerCoef.dataTableMatiere.value = dataTableMatiere;
    // controllerCoef.dataTableFiltreMatiere.value = dataTableMatiere;
   } catch (e) {
     return null;
   }
  }
  
@override
  void H_RecupeModif({int? id, String? param}) {
     matiereModel = dataTableMatiere.firstWhere(
    (data)=> data.iDMatiere ==id
  );
  indexData.value = dataTableMatiere.indexWhere( (data)=> data.iDMatiere ==id);
  hlitMatiere();
  action.value=TraitementAction.modifier.name;
  controller.nextPage();
  }  


@override
  H_ValiderConfig() {
    if (isSelectMatiere.isEmpty || controller.currentPage.value==1 )return false;
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
  indexData.value = dataTableMatiere.indexWhere( (data)=> data.matiere ==libMatiere);
  isSelectMatiere.contains(libMatiere) == true ?isSelectMatiere.remove(libMatiere)
                                               :isSelectMatiere.add(libMatiere!);

    isSelectMatiere.contains(libMatiere) == true ? dataTableMatiere[indexData.value].etat=true:
      dataTableMatiere[indexData.value].etat=false;
     matiereModel = dataTableMatiere[indexData.value];
     repositorycontroller.H_ModifierData(matiereModel);
      // hModificationData();

    }
 
    /////// SELECTION TOUS LES CHECKBOX
selectAllCheckBox({bool? value}){
  value=!isSelectAll.value;
   isSelectAll.value =value;
   
  for (var element in dataTableMatiere) {
  final index = dataTableMatiere.indexWhere( (data)=> data.iDMatiere ==element.iDMatiere);
  value==true? isSelectMatiere.contains(element.matiere) == true ?"":isSelectMatiere.add(element.matiere!):
  isSelectMatiere.contains(element.matiere) == true ? isSelectMatiere.remove(element.matiere):"";
  dataTableMatiere[index].etat=value;
  }
   matiereModel.datatable = dataTableMatiere;
    // matiereModel.datatable!.map((e)=> print("${e.matiere} ${e.etat}")).toList();
  //  print(matiereModel.datatable.);
   repositorycontroller.H_ModifierData(matiereModel);

  
    }


}











