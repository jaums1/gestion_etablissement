import 'package:get/get.dart';

import '../../Annee_Scolaire/Controller/annee_scolaire_controller.dart';
import '../../Classe/Controller/classe_controller.dart';
import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/animation_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configs/utils/Statut/statut.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import '../Model/inscription_model.dart';
import 'inscription_variable.dart';

class TInscriptionController extends GetxController with TControllerData {
  static TInscriptionController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
  final bilanTotal =0.obs;
  final bilanSolde =0.obs;
  final bilanNetaPayer =0.obs;
  final bilanPaiement =0.obs;

  final variable = TInscriptionVariable();
  final isLoading = false.obs;
  final isInitialise = false.obs;
  var isFraisAnnexe = false.obs;
  var isFraisInscription = false.obs;
  var DataInscription = TInscriptionModel().obs;
  var DataTableInscription = <TInscriptionModel>[].obs;
  var DataTableFiltreInscription = <TInscriptionModel>[].obs;

  final controllerClasse     = Get.find<TClasseController>();
  final controllerAS     = Get.find<TAnneeScolaireController>();
  final controllerEleve      = Get.find<TEleveController>();
 final _client = TDioHelper(baseUrl: TApi.httpLien);
//////TRAITEMENT
  HLitInscription({String? param = "AFFICHIER"}) {
    if (param == "AFFICHIER") {
      variable.IDInscription.text    = DataInscription.value.IDInscription.toString();
      variable.IDClasse.text         = DataInscription.value.IDClasse.toString();
      variable.MontantVersement.text = DataInscription.value.MontantVersement.toString();
      variable.DroitInscription.text = DataInscription.value.DroitInscription.toString();
      variable.FraisAnnexe.text      = DataInscription.value.FraisAnnexe.toString();
      variable.DateInscription.value.text  = DataInscription.value.DateInscription.toString();
      variable.NetAPayer.text        = DataInscription.value.NetAPayer.toString();
      variable.ResteAPayer.text      = DataInscription.value.ResteAPayer.toString();
      variable.Paiement.text         = DataInscription.value.Paiement.toString();
      variable.IDEtudiant.text          = DataInscription.value.IDEtudiant.toString();
      variable.Statut.text           = DataInscription.value.Statut.toString();
    } else {
     
      DataInscription.value.IDClasse        = controllerClasse.DataClasse.value.IDClasse;
      DataInscription.value.IDEtablissement = controllerClasse.DataClasse.value.IDEtablissement;
      DataInscription.value.MontantVersement= int.tryParse(variable.MontantVersement.text) ?? 0;
      DataInscription.value.DroitInscription= int.tryParse(variable.DroitInscription.text) ?? 0;
      DataInscription.value.FraisAnnexe     = int.tryParse(variable.FraisAnnexe.text) ?? 0;
      int sommeAnnexeInscription            = DataInscription.value.FraisAnnexe!+ DataInscription.value.DroitInscription!; 
      int scolarite                         = int.parse(variable.Scolarite.text);
      DataInscription.value.NetAPayer       = sommeAnnexeInscription+scolarite;
      DataInscription.value.ResteAPayer     =  DataInscription.value.NetAPayer! -DataInscription.value.MontantVersement!-sommeAnnexeInscription;
      DataInscription.value.Paiement        = sommeAnnexeInscription+DataInscription.value.MontantVersement!;
      DataInscription.value.IDEtudiant      = controllerEleve.DataEleve.value.IDEtudiant;
      DataInscription.value.Regime          = controllerEleve.DataEleve.value.Regime;
      DataInscription.value.Statut          = TStatutCustom.paiement(DataInscription.value.ResteAPayer);
    }
  }

  @override
  H_Bilan() {
    bilanNetaPayer.value=0;
    bilanPaiement.value=0;
    bilanSolde.value=0;
    for (var data in DataTableInscription) {
        if(data.Paiement !=0){
         bilanPaiement.value += data.Paiement!;
        }
        bilanNetaPayer.value += data.NetAPayer!; 
        bilanSolde.value += data.ResteAPayer!; 
    }
    bilanTotal.value = DataTableInscription.length;
  }

//// INITIALISER
  @override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }



///// ENREGISTREMENT 
  
@override
 H_Enregistrer() async{
   try {
       HLitInscription(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TInscriptionModel>(TEndpoint.linkInscription,
                        data: DataInscription.value.toMap(),fromJson: (data) =>TInscriptionModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataInscription.value =reponse.data!;
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
       final reponse =await _client.delete("${TEndpoint.linkInscription}/$id",);
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
       HLitInscription(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TInscriptionModel>(TEndpoint.linkInscription,
                        data: DataInscription.value.toMap(),fromJson: (data) =>TInscriptionModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataInscription.value =reponse.data!;
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
  final reponse =await _client.getList<TInscriptionModel>(
    "${TEndpoint.linkInscription}/${controllerAS.DataAnneeScolairePrincipale.value.IDAnneeScolaire}",
    fromJson: (data) =>TInscriptionModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableInscription.value = reponse.data!;
      DataTableFiltreInscription.value =reponse.data!;
      H_Bilan();
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
 H_RecupeModif({int? id, String? param}) {
      DataInscription.value = DataTableInscription.firstWhere(
      (data)=> data.IDInscription ==id,orElse: () => TInscriptionModel(),);
      HLitInscription();
  }


  @override
  void H_Initialise() {
    variable.H_Initialise();
    DataInscription.value = TInscriptionModel();
  }

 

} 