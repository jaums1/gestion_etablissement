
import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:ecole/Matiere/Controller/matiere_controller.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:ecole/Serie/Controller/serie_controller.dart';
import 'package:get/get.dart';
import '../../Cycle/Controller/cycle_controller.dart';
import '../../Cycle/Screen/cycle.dart';
import '../../Type_Decoupage_Scolaire/Screen/Widget/decoupage.dart';
import '../../Etablissement/Controller/etablissement_controller.dart';
import '../../Etablissement/Screen/etablissement.dart';
import '../../Matiere coef/matierecoef_principal.dart';
import '../../Matiere/Screen/matiere_principal.dart';
import '../../Niveau Serie/Screen/niveau_serie_principal.dart';
import '../../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import '../../Niveau_Scolaire/Screen/niveauscolaire.dart';
import '../../Serie/Screen/serie_scolaire.dart';
import '../../Type_Decoupage_Scolaire/Controller/typedecoupage_controller.dart';




class TConfigController extends GetxController {
   static TConfigController get instance => Get.find();
   List<TConfigModel> listeConfig=[
     TConfigModel(menu: "Etatblissement", route:TEtablissementScolaireScreen(isPass: false,)),
     TConfigModel(menu: "Decoupage Scolaire", route:TDecoupageScolaireScreen()),
     TConfigModel(menu: "Cycle Scolaire", route:TCycleScolaireScreen()),
     TConfigModel(menu: "Niveau Scolaire", route:TNiveauScolaireScreen()),
     TConfigModel(menu: "Serie", route:TSerieScolaireScreen()),
     TConfigModel(menu: "Niveau Serie", route:TNiveauSeriePrincipalScreen()),
     TConfigModel(menu: "Matières", route:TMatierePrincipalScreen()),
     TConfigModel(menu: "Matière Niveau", route:TMatiereCoefPrincipalScreen()),
     TConfigModel(menu: "Fin", route:TNiveauScolaireScreen()),
     
     ].obs;
  final selectListe =[].obs;
  final functionConfig = [
    // TEtablissementController().validations(),
  ].obs;
   final index =0.obs;
final controlleEtablissement= TEtablissementController.instance;
final controlleCyle= Get.find<TCycleController>();
final controlleSerie= Get.find<TSerieController>();
final controlleMatiere= Get.find<TMatiereController>();
final controlleNiveauSerie= Get.find<TNiveauSerieController>();
final controlleTypeDecoupage= TTypeDecoupageController.instance;
final controlleNiveauScolaire= TNiveauScolaireController.instance;

  void validePage(route,indice){
    selectListe.contains(route)==true ? "":selectListe.add(route);
    index.value = indice;
  } 


void nextStep(indice) async {
 
  switch (indice){
     //// ETABLISSEMENT
    case 0 :  if(await controlleEtablissement.H_ValiderConfig()==false) return;
    break;
    /// TYPE DECOUPAGE SCOLAIRE
    case 1 : if(await controlleTypeDecoupage.H_ValiderConfig()==false){ 
    TLoader.errorSnack(title: "DECOUPAGE SCOLAIRE",message: "Veuillez sélectionner votre decoupage scolaire");
     return;}  
    break;
     /// CYCLE SCOLAIRE
    case 2 : if(await controlleCyle.H_ValiderConfig()==false){ 
    TLoader.errorSnack(title: "CYCLE SCOLAIRE",message: "Veuillez sélectionner votre cycle scolaire");
     return;} 
    break;
     /// NIVEAU SCOLAIRE
     case 3 : if(await controlleNiveauScolaire.H_ValiderConfig()==false){ 
    TLoader.errorSnack(title: "NIVEAU SCOLAIRE",message: "Veuillez sélectionner votre niveau scolaire");
     return;} 
     break;  
     /// SERIE SCOLAIRE
     case 4 : if(await controlleSerie.H_ValiderConfig()==false){ 
    TLoader.errorSnack(title: "SERIE",message: "Veuillez sélectionner votre serie");
     return;} 
     break; 
      /// NIVEAU SERIE
     case 5 : if(await controlleNiveauSerie.H_ValiderConfig()==false){ 
    TLoader.errorSnack(title: "NIVEAU SERIE",message: "Veuillez affecter votre niveau serie ou achever l'action");
     return;} 
     break;
   /// MATIERE
     case 6 : if(await controlleMatiere.H_ValiderConfig()==false){ 
    TLoader.errorSnack(title: "MATIERE",message: "Veuillez sélectionner votre matière ou achever l'action");
     return;} 
     break;


  }

  
 
 




selectListe.isEmpty==true? selectListe.add(listeConfig[indice].menu):
selectListe.contains(listeConfig[indice].menu)==true ? "":selectListe.add(listeConfig[indice].menu);
index.value = indice+1; 
   
  } 
  
  void preStep(indice){
    indice -=1;
    index.value = indice; 
    selectListe.contains(listeConfig[indice].menu)==false ? "":selectListe.remove(listeConfig[indice].menu);
  }

   ////// Terminer la configuration
   cofigTerminer(){
    
  }
}










class TConfigModel {
   String? menu;
   // ignore: prefer_typing_uninitialized_variables
   var route;

   TConfigModel({this.menu,this.route});
}