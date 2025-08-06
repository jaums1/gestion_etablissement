import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../Model/employe_model.dart';
import 'employe_variable.dart';

class TEmployeController extends GetxController with TControllerData{
   static TEmployeController get instance => Get.find();
  ///// DECLARATION DE VARIABLE 
  var action ="";
  final homme=0.obs;
  final femme=0.obs;
  final total=0.obs;
  final variable =TEmployeVariable();
  final isLoading=false.obs;
  var DataEmploye = TEmployeModel().obs;
  var DataTableEmploye =<TEmployeModel>[].obs;
  var DataTableFiltreEmploye =<TEmployeModel>[].obs;
   var DataTableEnseignant =<TEmployeModel>[].obs;
  var DataTableFiltreEnseignant =<TEmployeModel>[].obs;

   ///// LES INSTANCES
     final _client = TDioHelper(baseUrl: TApi.httpLien);
  
  
  //////TRAITEMENT
  
  HLitEmploye({String? param="AFFICHIER"}){
    if (param=="AFFICHIER") {

variable.IDEtablissement.text   = DataEmploye.value.IDEtablissement.toString();
variable.MatriculeEmploye.text  = DataEmploye.value.MatriculeEmploye.toString();
variable.Nom.text               = DataEmploye.value.Nom.toString();
variable.Prenoms.text           = DataEmploye.value.Prenoms.toString();
variable.Sexe.text              =  DataEmploye.value.Sexe.toString();
variable.Adresse.text           = DataEmploye.value.Adresse.toString(); 
variable.Telephone.text         = DataEmploye.value.Telephone.toString();
variable.Telephone2.text        = DataEmploye.value.Telephone2.toString();    
variable.Email.text             = DataEmploye.value.Email.toString();
variable.Photo.text             = DataEmploye.value.Photo.toString();
variable.TypeContrat.text     = DataEmploye.value.TypeContrat.toString();
variable.DateEmbauche.value.text  = TFormatters.formatDateFr(DataEmploye.value.DateEmbauche);
variable.DateNaissance.value.text  = TFormatters.formatDateFr(DataEmploye.value.DateNaissance);
variable.Salaire.text         = DataEmploye.value.Salaire.toString();
variable.TypeSalaire.text     = DataEmploye.value.TypeSalaire.toString();
variable.Bancaire.text        = DataEmploye.value.Bancaire.toString();
variable.NumeroCompte.text    = DataEmploye.value.NumeroCompte.toString();
variable.Statut.text          = DataEmploye.value.Statut.toString();
variable.Nationnalite.text    = DataEmploye.value.Nationnalite.toString();
variable.EtatCivil.text       = DataEmploye.value.EtatCivil.toString();
variable.Departement.text     = DataEmploye.value.Departement.toString();
variable.DateFinContrat.value.text  =TFormatters.formatDateFr(DataEmploye.value.DateFinContrat);
variable.NiveauEtude.text     = DataEmploye.value.NiveauEtude.toString();
variable.Specialite.text      = DataEmploye.value.Specialite.toString();
variable.Experience.text      = DataEmploye.value.Experience.toString();
variable.Observation.text     = DataEmploye.value.Observation.toString();
variable.LieuNaissance.text   = DataEmploye.value.LieuNaissance.toString();
variable.Fonction.text        = DataEmploye.value.Fonction.toString();
 
    }else{
     
 DataEmploye.value.IDEtablissement   = int.tryParse(variable.IDEtablissement.text) ?? 0;
DataEmploye.value.MatriculeEmploye  = variable.MatriculeEmploye.text;
DataEmploye.value.Nom               = variable.Nom.text;
DataEmploye.value.Prenoms           = variable.Prenoms.text;
DataEmploye.value.Sexe              = variable.Sexe.text;
DataEmploye.value.Adresse           = variable.Adresse.text;
DataEmploye.value.Telephone         = variable.Telephone.text;
DataEmploye.value.Telephone2        = variable.Telephone2.text;
DataEmploye.value.Email             = variable.Email.text;
DataEmploye.value.Photo             = variable.Photo.text;
DataEmploye.value.TypeContrat       = variable.TypeContrat.text;
DataEmploye.value.Salaire           = int.tryParse(variable.Salaire.text) ?? 0;
DataEmploye.value.TypeSalaire       = variable.TypeSalaire.text;
DataEmploye.value.Bancaire          = variable.Bancaire.text;
DataEmploye.value.NumeroCompte      = variable.NumeroCompte.text;
DataEmploye.value.Statut            = variable.Statut.text;
DataEmploye.value.Nationnalite      = variable.Nationnalite.text;
DataEmploye.value.EtatCivil         = variable.EtatCivil.text;
DataEmploye.value.Departement       = variable.Departement.text;
DataEmploye.value.NiveauEtude       = variable.NiveauEtude.text;
DataEmploye.value.Specialite        = variable.Specialite.text;
DataEmploye.value.Experience        = variable.Experience.text;
DataEmploye.value.Observation       = variable.Observation.text;
DataEmploye.value.LieuNaissance     = variable.LieuNaissance.text;
DataEmploye.value.Fonction          = variable.Fonction.text;


    }
  }
 


@override
  H_Bilan() {
    homme.value=0;
    femme.value=0;
   for (var data in DataTableEmploye) {
      if(data.Sexe=="Homme"){
       homme.value++;
      }else{
       femme.value++;
      }
   }
   total.value= DataTableEmploye.length;
  }

///// ENREGISTREMENT 

@override
 H_Enregistrer() async{
   try {
       HLitEmploye(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TEmployeModel>(TEndpoint.linkEmploye,
                        data: DataEmploye.value.toMap(),fromJson: (data) =>TEmployeModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEmploye.value =reponse.data!;
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
       final reponse =await _client.delete("${TEndpoint.linkEmploye}/$id",);
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
       HLitEmploye(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TEmployeModel>(TEndpoint.linkEmploye,
                        data: DataEmploye.value.toMap(),fromJson: (data) =>TEmployeModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataEmploye.value =reponse.data!;
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
 H_RecupeData({String? param}) async {
   try {
    isLoading.value =false;
  final reponse =await _client.getList<TEmployeModel>(TEndpoint.linkEmploye,
                                             fromJson: (data) =>TEmployeModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableEmploye.value = reponse.data!;
      DataTableFiltreEmploye.value =reponse.data!;
      H_Bilan();
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
 H_RecupeModif({int? id, String? param}) {
      DataEmploye.value = DataTableEmploye.firstWhere(
      (data)=> data.IDEmploye ==id,orElse: () => TEmployeModel(),);
      HLitEmploye();
  }

  @override
  void H_Initialise() {
    variable.H_Clear();
    DataEmploye.value=TEmployeModel();
    variable.Nationnalite.text=TText.nationalitesSelect;
    variable.Statut.text="Actif";
  }
  

  }