
import 'package:ecole/Serie/Controller/serie_controller.dart';
import 'package:get/get.dart';

import '../../Classe/Controller/classe_controller.dart';
import '../../Configuration/Controller/config_controller.dart';
import '../../Cycle/Controller/cycle_controller.dart';
import '../../Decoupage_Scolaire/Controller/decoupage_controller.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import '../../Employe/Controller/employe_controller.dart';
import '../../Etablissement/Controller/etablissement_controller.dart';
import '../../Etablissement/Repository/etatblissement_repository.dart';
import '../../Inscription/Controller/inscription_controller.dart';
import '../../Login/Controller/login_controller.dart';
import '../../Matiere coef/Controller/matierecoef_controller.dart';
import '../../Matiere coef/Controller/page_matierecoef_controller.dart';
import '../../Matiere/Controller/data_source_matiere.dart';
import '../../Matiere/Controller/matiere_controller.dart';
import '../../Matiere/Controller/page_matiere_controller.dart';
import '../../Modalite_Paiement/Controller/modalite_paiement_controller.dart';
import '../../Niveau Serie/Controller/niveau_serie_controller.dart';
import '../../Niveau Serie/Controller/page_niveau_serie_model.dart';
import '../../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import '../../Type_Decoupage_Scolaire/Controller/typedecoupage_controller.dart';
import '../cammon/widgets/layouts/sidebar/sidebar_controller.dart';

class TGeneralBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(()=>TEtablissementController(),fenix: true);
    Get.lazyPut(()=>TEtablissementRepository(),fenix: true);
     Get.lazyPut(()=>TCycleController(),fenix: true);
     
     Get.lazyPut(()=>TTypeDecoupageController(),fenix: true);
     Get.lazyPut(()=>TDecoupageController(),fenix: true);
     Get.lazyPut(()=>TNiveauScolaireController(),fenix: true);
     Get.lazyPut(()=>TLoginController(),fenix: true);
     Get.lazyPut(()=>TConfigController(),fenix: true);
     Get.lazyPut(()=>TSerieController(),fenix: true);
     
     ///// MATIERE
     Get.lazyPut(()=>TMatiereController(),fenix: true);
     Get.lazyPut(()=>TPageMatiereController(),fenix: true);
     Get.lazyPut(()=>TDataSourceMatiere(),fenix: true);
     
      ///// NIVEAU SERIE
     Get.lazyPut(()=>TNiveauSerieController(),fenix: true);
     Get.lazyPut(()=>TPageNiveauSerieController(),fenix: true);

     ///// MATIERE COEF
      Get.lazyPut(()=>TPageMatiereCoefController(),fenix: true);
      Get.lazyPut(()=>TCoefficientController(),fenix: true);

      //////MENU
      Get.lazyPut(()=>SidebarController(),fenix: true);
     
      //////ELEVE
      Get.lazyPut(()=>TEleveController(),fenix: true);
      
        //////ELEVE
      Get.lazyPut(()=>TEmployeController(),fenix: true); 

        //////CLASSE
      Get.lazyPut(()=>TClasseController(),fenix: true);
      
       //////MODALITE PAIEMENT
      Get.lazyPut(()=>TModalitePaiementController(),fenix: true); 

          //////SCOLARITE
      Get.lazyPut(()=>TScolariteController(),fenix: true);
      
        Get.lazyPut(()=>TInscriptionController(),fenix: true);
  }
}