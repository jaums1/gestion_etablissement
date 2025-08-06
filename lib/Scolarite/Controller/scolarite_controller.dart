import 'package:ecole/Configs/utils/dio/dio_client.dart';
import 'package:ecole/Niveau_Scolaire/Model/niveauscolaire_model.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import '../../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import '../Model/scolarite_model.dart';
import 'scolarite_variable.dart';

class TScolariteController extends GetxController with TControllerData{
   static TScolariteController get instance => Get.find();
  ///// DECLARATION DE VARIABLE 
  final bilanScolarite=0.obs;
  final variable =TScolariteVariable();
  final isLoading=false.obs;
  var edite       = false.obs;
  var DataScolarite = TScolariteModel().obs;
  var DataTableScolarite =<TScolariteModel>[].obs;
  var DataTableFiltreScolarite =<TScolariteModel>[].obs;
  var DataTableNiveauScolaire=<TNiveauModel>[].obs;
 

  final controllerNiveauSerie    = Get.find<TNiveauSerieController>();
  final controllerNiveauScolaire    = Get.find<TNiveauScolaireController>();
 
  
  final _client = TDioHelper(baseUrl: TApi.httpLien);
  //////TRAITEMENT
  HLitScolarite({String? param = "AFFICHIER"}) {
    if (param == "AFFICHIER") {
      
      variable.MontantScolarite.text = DataScolarite.value.MontantScolarite.toString();
      variable.FraisAnnexe.text = DataScolarite.value.FraisAnnexe.toString();
      variable.TypeScolarite.text = DataScolarite.value.TypeScolarite.toString();
      variable.FraisInscription.text =DataScolarite.value.FraisInscription.toString();
      variable.NiveauScolaire.text = DataScolarite.value.DataNiveauScolaire!.niveau.toString();
      variable.DataTableModalitePaiement.value =DataScolarite.value.DataTable!.map((e)=> e).toList();
    } else {
      DataScolarite.value.MontantScolarite =int.parse(variable.MontantScolarite.text);
      DataScolarite.value.FraisAnnexe =variable.FraisAnnexe.text.isEmpty?0: int.parse(variable.FraisAnnexe.text);
      DataScolarite.value.FraisInscription =variable.FraisInscription.text.isEmpty?0: int.parse(variable.FraisInscription.text);
      DataScolarite.value.TypeScolarite = variable.TypeScolarite.text;
      DataScolarite.value.DataTable = variable.DataTableModalitePaiement;
      DataScolarite.value.DataTableNiveauScolaire =DataTableNiveauScolaire;
    }
  }
 
 @override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }

@override
  H_Bilan() {
    bilanScolarite.value = DataTableScolarite.length;
    
  }

///// ENREGISTREMENT 


@override
 H_Enregistrer() async{
  
   try {
       HLitScolarite(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TScolariteModel>(TEndpoint.linkScolarite,
                        data: DataScolarite.value.toMap(),fromJson: (data) =>TScolariteModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataScolarite.value =reponse.data!;
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
      return false;
    }

  }

// SUPPRIMER
@override
 H_Supprimer({int? id,String? param}) async {
    
    try {
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageSuppressionChargement.tr,animation: TImages.docerAnimation, width: 200,));
       final reponse =await _client.delete("${TEndpoint.linkScolarite}/$id",);
    ////// VERIFICATION 
    if(reponse.success){
       
       H_RecupeData();
        Get.back();
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

// MODIFICATION
@override
 H_Modifier() async{
    try {
       HLitScolarite(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TScolariteModel>(TEndpoint.linkScolarite,
                        data: DataScolarite.value.toMap(),fromJson: (data) =>TScolariteModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataScolarite.value =reponse.data!;
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
  final reponse =await _client.getList<TScolariteModel>(TEndpoint.linkScolarite,
                                             fromJson: (data) =>TScolariteModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableScolarite.value = reponse.data!;
      DataTableFiltreScolarite.value =reponse.data!;
      H_Bilan();
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
 H_RecupeModif({int? id, String? param}) {
      
      DataScolarite.value = DataTableScolarite.firstWhere(
      (data)=> data.IDScolarite ==id,orElse: () => TScolariteModel(),);
     
      HLitScolarite();
  }


  @override
  void H_Initialise() {
    variable.H_Clear();
    variable.TypeScolarite.text="Affecté(e)";
    DataScolarite.value=TScolariteModel();
  }
  
  onSelectNiveauScolaire({TNiveauModel? data }){
    controllerNiveauScolaire.isreactive.toggle();
   final indice = DataTableScolarite.indexWhere((e) => e.IDNiveauScolaire==data!.iDNiveauScolaire &&
   e.TypeScolarite==variable.TypeScolarite.text);

   if(indice !=-1){
    TLoader.warningSnack(title: "SCOLARITE",message: "Vous avez déjà définir la scolarite de ${data!.niveau}");
    return;
   }


    final index=variable.DataTableNiveauScolaire.indexWhere((e) => e.niveau==data!.niveau); 

    index ==-1?variable.DataTableNiveauScolaire.add(data!):variable.DataTableNiveauScolaire.removeAt(index);
    
              
  }
 
 
 
  }