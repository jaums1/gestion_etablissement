import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Annee_Scolaire/Controller/annee_scolaire_variable.dart';
import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:ecole/Etablissement/Controller/etablissement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../Model/annee_scolaire_model.dart';




class TAnneeScolaireController extends GetxController with TControllerData{
   static TAnneeScolaireController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var DataTableAnneeScolaire= <TAnneeScolaireModel>[].obs;
   var DataTableFiltreAnneeScolaire= <TAnneeScolaireModel>[].obs;
   var DataAnneeScolaire = TAnneeScolaireModel().obs;
   var DataAnneeScolairePrincipale = TAnneeScolaireModel().obs;
   final isLoading = false.obs;
   final variable = TAnneeScolaireVariable();
  final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Année Scolaire"),size: ColumnSize.L),
     DataColumn2(label: Text("Date Debut"),size:ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),         
     DataColumn2(label: Text("Date Fin"),size:ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),         
  ];


   ///// LES INSTANCES
     final _client = TDioHelper(baseUrl: TApi.httpLien);
   final controllerEtablissement = Get.find<TEtablissementController>();
    
    ///////// TRAITEMENT
   void HLitAnneeScolaire({String? param="AFFICHAGE"}){
    if (param=="AFFICHAGE") {
       variable.AnneeScolaire.text = DataAnneeScolaire.value.AnneeScolaire??"";
       variable.DateDebut.text =DataAnneeScolaire.value.DateDebut==null?"":TFormatters.formatDateFr(DataAnneeScolaire.value.DateDebut);
       variable.DateFin.text =DataAnneeScolaire.value.DateFin==null?"":TFormatters.formatDateFr(DataAnneeScolaire.value.DateFin);
    }else{
      DataAnneeScolaire.value.AnneeScolaire = variable.AnneeScolaire.text;
      DataAnneeScolaire.value.IDEtablissement = controllerEtablissement.DataEtablissement.value.idEtablissement;
    }
   }
   
@override
  void H_Initialise() {
    DataAnneeScolaire.value =TAnneeScolaireModel();
    variable.Clear();
  }

///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
     try {
       HLitAnneeScolaire(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TAnneeScolaireModel>(TEndpoint.linkAnneeScolaire,
                        data: DataAnneeScolaire.value.toMap(),fromJson: (data) =>TAnneeScolaireModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataAnneeScolaire.value =reponse.data!;
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
       final reponse =await _client.delete("${TEndpoint.linkAnneeScolaire}/$id",);
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
       HLitAnneeScolaire(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TAnneeScolaireModel>(TEndpoint.linkAnneeScolaire,
                        data: DataAnneeScolaire.value.toMap(),fromJson: (data) =>TAnneeScolaireModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataAnneeScolaire.value =reponse.data!;
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
  final reponse =await _client.getList<TAnneeScolaireModel>(TEndpoint.linkAnneeScolaire,
                                             fromJson: (data) =>TAnneeScolaireModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableAnneeScolaire.value = reponse.data!;
      DataTableFiltreAnneeScolaire.value =reponse.data!;
      DataAnneeScolairePrincipale.value = DataTableAnneeScolaire.firstWhere(
        (e)=> e.Statut=="En cours",orElse: () => TAnneeScolaireModel(),
        );
         DataAnneeScolaire.value=DataAnneeScolairePrincipale.value;
        HLitAnneeScolaire();
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
   H_RecupeModif({int? id, String? param}) {
     DataAnneeScolaire.value= DataTableAnneeScolaire.firstWhere(
      (data)=> data.IDAnneeScolaire ==id,orElse: () => TAnneeScolaireModel(),);
      HLitAnneeScolaire();
  }  


@override
  H_ValiderConfig() async{
    await H_Enregistrer();
    if (DataAnneeScolairePrincipale.value.IDAnneeScolaire==null )return false;
      return true;
  }

////// INITIALISATION 
     @override
  void onInit() {
    H_RecupeData();
    super.onInit();
  }
}
