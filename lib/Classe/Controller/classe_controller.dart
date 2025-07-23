import 'package:ecole/Classe/Controller/classe_filtre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import '../Model/classe_model.dart';
import '../Repository/classe_repository.dart';
import 'classe_function.dart';
import 'classe_variable.dart';

class TClasseController extends GetxController with TControllerData{
   static TClasseController get instance => Get.find();
  ///// DECLARATION DE VARIABLE 
  final action = "".obs;
  final variable = TClasseVariable();
  final isLoading = false.obs;
  final isinit = false.obs;
  final edite = false.obs;
  final DataClasse = TClasseModel().obs;
  final DataTableClasse = RxList<TClasseModel>([]);
  final DataTableFiltreClasse = RxList<TClasseModel>([]);
 
  final repositorycontroller    = Get.put(TClasseRepository());
  final controllerNiveauSerie    = Get.find<TNiveauSerieController>();
  
  final client = TDioHelper(baseUrl:"http://localhost/" );

  //////TRAITEMENT
  HLitClasse({String? param="AFFICHIER"}){
    if (param=="AFFICHIER") {
variable.IDEtablissement.text   = DataClasse.value.IDEtablissement.toString();
variable.LibClasse.text         = DataClasse.value.LibClasse.toString();
variable.IDNiveauSerie.text     = DataClasse.value.IDNiveauSerie.toString();
variable.Capacite.text          = DataClasse.value.Capacite.toString();
    }else{
        
 DataClasse.update((val) {
   val?.IDEtablissement = int.tryParse(variable.IDEtablissement.text) ?? 0;
   val?.LibClasse = variable.LibClasse.text;
   val?.IDNiveauSerie = int.parse(variable.IDNiveauSerie.text);
   val?.Capacite = int.parse(variable.Capacite.text==""?variable.Capacite.text:0.toString());
 });
    }
  }
 
 @override
  void onInit() {
     H_RecupeData();
    super.onInit();
  }
///// ENREGISTREMENT 
@override
 H_Enregistrer() async{

     try {
    HLitClasse(param: "ENVOYER");
    ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "enregistrement encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));
  ///// ENVOIE DES DONNEES
   final result = await  repositorycontroller.H_EnregistrerData(DataClasse.value);
  ///// FERMER LOADING
   H_RecupeData();
   if(DataTableClasse.isNotEmpty)  DataClasse.value = DataTableClasse[DataTableClasse.length-1];
  Get.back();
  ///// TRAITEMENT RESULTAT
  if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexions");
   return false;}
  
    return true;
   } catch (e) {
     TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
     return false;
   }
  }

// SUPPRIMER
@override
 H_Supprimer({int? id,String? param}) async {
    try {
        ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Suppression encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));

  ///// ENVOIE DES DONNEES
     final result = await  repositorycontroller.H_SupprimerData(id);
  ///// FERMER LOADING
  // Get.back();
  ///// TRAITEMENT RESULTAT   
      if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
   return false;}
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
      HLitClasse(param: "ENVOYER");
          ///LOADING
  TShowdialogue().showWidgetLoad(widgets: 
  TAnimationLoaderWidget(text: "Modification encours...",color: Colors.white,
  animation: TImages.docerAnimation,width: 250,));

  ///// ENVOIE DES DONNEES
     
    final result=  await  repositorycontroller.H_ModifierData(DataClasse.value);
    ///// FERMER LOADING
  Get.back();
  ///// TRAITEMENT RESULTAT 
     if(result==false){TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;}
      return true;
   } catch (e) {
    TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
     return false;
   }

  }

@override
  void H_RecupeData({String? param}) async {
    final reponse = await client.getList<TClasseModel>(TEndpoint.linkClasse, fromJson: (data) =>TClasseModel.fromMap(data));
    // final reponse = await client.getPaginated<TClasseModel>(TEndpoint.linkClasse, 
    // config: PaginationConfig(limit: 4) ,
    // fromJson: (data) =>TClasseModel.fromMap(data));
  
      DataTableClasse.clear();
    if(reponse.success){
      DataTableClasse.addAll(reponse.data!);
      DataTableFiltreClasse.value =DataTableClasse;

    }
    
   
  
  // try {
  //   isLoading.value =false;
  //     DataTableClasse.clear();
      // final data = await repositorycontroller.H_RecupData(param: param);
  //      isLoading.value =true;
  //     if (data is List) {
  //       //// RECUPERER LA LISTE DES CLASSES
  //     DataTableClasse.value = data.map((datas)=>TClasseModel.fromMap(datas)).toList();
  //     DataTableFiltreClasse.value =DataTableClasse;
  
  //   }
  //   data==null? TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion"):"";
  //  } catch (e) {
  //      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
  //    return;
  //  }
  }
  
@override
  void H_RecupeModif({int? id, String? param}) {
      TClasseFiltre().H_FiltreElementParID(id: id);
    HLitClasse();
    TClasseFunction().H_OnChangedNiveauSerieID(id: int.parse(variable.IDNiveauSerie.text));
  }

  @override
  void H_Initialise() {
    DataClasse.value = TClasseModel();
    HLitClasse();
  }
  

  }