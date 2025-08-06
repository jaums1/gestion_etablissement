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
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import '../Model/classe_model.dart';
import 'classe_variable.dart';

class TClasseController extends GetxController with TControllerData{
   static TClasseController get instance => Get.find();
  ///// DECLARATION DE VARIABLE 
  final action = "".obs;
  final bilanTotal = 0.obs;
  final variable = TClasseVariable();
  final isLoading = false.obs;
  final isinit = false.obs;
  final edite = false.obs;
  final actualise = false.obs;
  final DataClasse = TClasseModel().obs;
  final DataTableClasse = RxList<TClasseModel>([]);
  final DataTableFiltreClasse = RxList<TClasseModel>([]);
 
  final controllerNiveauSerie    = Get.find<TNiveauSerieController>();
  
  final _client = TDioHelper(baseUrl: TApi.httpLien);

  //////TRAITEMENT
  HLitClasse({String? param="AFFICHIER"}){
    if (param=="AFFICHIER") {
variable.IDEtablissement.text   = DataClasse.value.IDEtablissement.toString();
variable.LibClasse.text         = DataClasse.value.LibClasse.toString();
variable.IDNiveauSerie.text     = DataClasse.value.IDNiveauSerie.toString();
variable.NiveauSerie.value.text     = controllerNiveauSerie.DataNiveauSerie.value.niveauSerie.toString();

    }else{
        
 DataClasse.update((val) {
   val?.IDEtablissement = int.tryParse(variable.IDEtablissement.text) ?? 0;
   val?.LibClasse = variable.LibClasse.text;
   val?.IDNiveauSerie = int.parse(variable.IDNiveauSerie.text);
 });
    }
  }
 
 @override
  void onInit() {
     H_RecupeData();
    super.onInit();
  }



@override
  H_Bilan() {
   bilanTotal.value= DataTableClasse.length;
  }

///// ENREGISTREMENT 
@override
 H_Enregistrer() async{
   try {
       HLitClasse(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageEnregistrerChargement.tr,animation: TImages.docerAnimation, width: 150,));
    
       final reponse =await _client.post<TClasseModel>(TEndpoint.linkClasse,
                        data: DataClasse.value.toMap(),fromJson: (data) =>TClasseModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataClasse.value =reponse.data!;
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
       final reponse =await _client.delete("${TEndpoint.linkClasse}/$id",);
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
       HLitClasse(param: "ENVOYER");
       TShowdialogue().showWidgetLoad(
        widgets: TAnimationLoaderWidget(text:TText.messageModifierChargement.tr,animation: TImages.docerAnimation, width: 200,));
       
       final reponse =await _client.patch<TClasseModel>(TEndpoint.linkClasse,
                        data: DataClasse.value.toMap(),fromJson: (data) =>TClasseModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataClasse.value =reponse.data!;
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
  final reponse =await _client.getList<TClasseModel>(TEndpoint.linkClasse,
                                             fromJson: (data) =>TClasseModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      isLoading.value =true;
      DataTableClasse.value = reponse.data!;
      DataTableFiltreClasse.value =reponse.data!;
      H_Bilan();
    }
    } catch (e) {
      TLoader.errorSnack(title: TText.erreur.tr,message: "${TText.messageErreur.tr} $e");
    }
  }
  
@override
 H_RecupeModif({int? id, String? param}) {
      DataClasse.value = DataTableClasse.firstWhere(
      (data)=> data.IDClasse ==id,orElse: () => TClasseModel(),);

      controllerNiveauSerie.H_RecupeModif(id: DataClasse.value.IDNiveauSerie);
      HLitClasse();
  }

  @override
  void H_Initialise() {
    variable.H_Clear();
    DataClasse.value=TClasseModel();
  }
  
  

  }