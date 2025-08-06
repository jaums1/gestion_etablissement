import 'package:get/get.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import '../Model/modalite_paiement_model.dart';

import 'modalite_paiement_variable.dart';

class TModalitePaiementController extends GetxController with TControllerData{
   static TModalitePaiementController get instance => Get.find();
  ///// DECLARATION DE VARIABLE 
  final variable =TModalitePaiementVariable();
  var DataModalitePaiement = TModalitePaiementModel();
  var DataTableModalitePaiement =<TModalitePaiementModel>[].obs;

 final controller = Get.find<TScolariteController>();
  

  //////TRAITEMENT
  HLitModalitePaiement({String? param = "AFFICHIER"}) {
    if (param == "AFFICHIER") {
      variable.IDScolarite.text = DataModalitePaiement.IDScolarite.toString();
      variable.LibVersement.text = DataModalitePaiement.LibVersement.toString();
      variable.Montant.value.text = DataModalitePaiement.Montant.toString();
      variable.Jour.text = DataModalitePaiement.Jour.toString();
      variable.Mois.text = DataModalitePaiement.Mois.toString();
      variable.JourMois.text = DataModalitePaiement.JourMois.toString();
      variable.JourRappel.text = DataModalitePaiement.JourRappel.toString();
      variable.JourRappelMois.text =DataModalitePaiement.JourRappelMois.toString();
      variable.MontantVersementAnterieur= DataModalitePaiement.Montant!;
    } else {
      DataModalitePaiement.IDScolarite =int.tryParse(variable.IDScolarite.text) ?? 0;
      DataModalitePaiement.LibVersement = variable.LibVersement.text;
      DataModalitePaiement.Montant = int.tryParse(variable.Montant.value.text) ?? 0;
      DataModalitePaiement.Jour = variable.Jour.text;
      DataModalitePaiement.Mois = variable.Mois.text;
      DataModalitePaiement.JourMois = variable.JourMois.text;
      DataModalitePaiement.JourRappel = variable.JourRappel.text;
      DataModalitePaiement.JourRappelMois = variable.JourRappelMois.text;
    }
  }
 
///// ENREGISTREMENT 
@override
 H_Enregistrer(){
  // H_Initialise();
    HLitModalitePaiement(param: "ENVOYER");
    ///LOADING
  // controller.variable.DataTableModalitePaiement.add(DataModalitePaiement);
  DataTableModalitePaiement.add(DataModalitePaiement);
 
  Get.back();
  ///// TRAITEMENT RESULTAT
  }

// SUPPRIMER
@override
 H_Supprimer({int? id,String? param}) {
 
  DataTableModalitePaiement.removeWhere((item) => item.LibVersement==param);  
  
  for (var i = 0; i < DataTableModalitePaiement.length; i++) {
        if (i==0) {
        DataTableModalitePaiement[i].LibVersement="${i+1}er Versement";  
        }else{
         DataTableModalitePaiement[i].LibVersement="${i+1}e Versement";
        }
    } 

  

  }

// MODIFICATION
@override
 H_Modifier() {
   
  HLitModalitePaiement(param: "ENVOYER");
  final index = DataTableModalitePaiement.indexWhere((e) => e.LibVersement== DataModalitePaiement.LibVersement);

  // filtreScolarite.H_RecupeVersement(param: DataModalitePaiement.LibVersement); 
  DataTableModalitePaiement[index]=DataModalitePaiement;
  // Navigator.pop(Get.context!);  
    Get.back();

  }


  
@override
  void H_RecupeModif({int? id, String? param}) {
   DataModalitePaiement=  DataTableModalitePaiement.firstWhere((item) => item.LibVersement==param,
   orElse: () =>TModalitePaiementModel() ,);
    HLitModalitePaiement();

  }

  @override
  void H_Initialise() {
    variable.H_initVariables();
    DataModalitePaiement=TModalitePaiementModel();
  }
  

  }