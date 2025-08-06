
import 'package:ecole/Serie/Controller/serie_controller.dart';
import 'package:get/get.dart';

import '../../Annee_Scolaire/Controller/annee_scolaire_controller.dart';
import '../../Classe/Controller/classe_controller.dart';
import '../../Configuration/Controller/config_controller.dart';
import '../../Cycle/Controller/cycle_controller.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import '../../Employe/Controller/employe_controller.dart';
import '../../Etablissement/Controller/etablissement_controller.dart';
import '../../Etablissement/Repository/etatblissement_repository.dart';
import '../../Inscription/Controller/inscription_controller.dart';
import '../../Login/Controller/user_controller.dart';
import '../../Coefficient/Controller/matierecoef_controller.dart';
import '../../Matiere/Controller/data_source_matiere.dart';
import '../../Matiere/Controller/matiere_controller.dart';
import '../../Modalite_Paiement/Controller/modalite_paiement_controller.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import '../../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import '../../Type_Decoupage_Scolaire/Controller/typedecoupage_controller.dart';
import '../../Versement/Controller/versement_controller.dart';
import '../cammon/widgets/layouts/sidebar/sidebar_controller.dart';

class TGeneralBinding extends Bindings {
  @override
  void dependencies(){
   //////// GETPUT AVEC PERMENT TRUE 
    Get.put<TEtablissementController>(TEtablissementController(),permanent: true);
    Get.put<TEmployeController>(TEmployeController(),permanent: true);
    Get.put<TUserController>(TUserController(),permanent: true);
  
   Get.put<TTypeDecoupageController>(TTypeDecoupageController(),permanent: true);
   Get.put<TCycleController>(TCycleController(),permanent: true);
   Get.put<TNiveauScolaireController>(TNiveauScolaireController(),permanent: true); 
   Get.put<TSerieController>(TSerieController(),permanent: true); 
   Get.put<TNiveauSerieController>(TNiveauSerieController(),permanent: true);
   Get.put<TMatiereController>(TMatiereController(),permanent: true);
   Get.put<TCoefficientController>(TCoefficientController(),permanent: true);
   Get.put<TAnneeScolaireController>(TAnneeScolaireController(),permanent: true);
   Get.put<SidebarController>(SidebarController(),permanent: true);

   Get.put<TEleveController>(TEleveController(),permanent: true);
   Get.put<TClasseController>(TClasseController(),permanent: true);
   Get.put<TScolariteController>(TScolariteController(),permanent: true);
   Get.put<TModalitePaiementController>(TModalitePaiementController(),permanent: true);
   Get.put<TInscriptionController>(TInscriptionController(),permanent: true);
 
   
    ///// NIVEAU SERIE
  
  
  ////// CHARGEMENT DE DATA
  Get.putAsync<TEtablissementController>(()async{
    final result = TEtablissementController();
    await result.H_RecupeData();
    return result;
  },permanent: true);
  
  ///// ANNEE SCOLAIRE
  Get.putAsync<TAnneeScolaireController>(()async{
    final result = TAnneeScolaireController();
    await result.H_RecupeData();
    return result;
  },permanent: true);
   
  //  Get.putAsync<TUserController>(()async{
  //   final result = TUserController();
  //   await result.H_RecupeData();
  //   return result;
  // },permanent: true);
  


   Get.putAsync<TEleveController>(()async{
    final result = TEleveController();
    await result.H_RecupeData();
    return result;
  },permanent: true);
  
  Get.putAsync<TTypeDecoupageController>(()async{
    final result = TTypeDecoupageController();
    await result.H_RecupeData();
    return result;
  },permanent: true);


    // Get.lazyPut(()=>TEtablissementController(),fenix: true);
    Get.lazyPut(()=>TEtablissementRepository(),fenix: true);
    
     
   
    
     Get.lazyPut(()=>TConfigController(),fenix: true);
    
     
     ///// MATIERE
     Get.lazyPut(()=>TDataSourceMatiere(),fenix: true);
     
     

     ///// MATIERE COEF
     

      
     
      //////ELEVE
      // Get.lazyPut(()=>TEleveController(),fenix: true);
      
        //////ELEVE
      

        //////CLASSE
      // Get.lazyPut(()=>TClasseController(),fenix: true);
      
       //////MODALITE PAIEMENT
      // Get.lazyPut(()=>TModalitePaiementController(),fenix: true); 

          //////SCOLARITE
      // Get.lazyPut(()=>TScolariteController(),fenix: true);
      
        // Get.lazyPut(()=>TInscriptionController(),fenix: true);

        Get.lazyPut(()=>TVersementController(),fenix: true);
  }
}