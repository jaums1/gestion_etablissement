import 'package:ecole/Configs/utils/Popup/loaders.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Implements/function_data.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import 'modalite_paiement_controller.dart';


class TModalitePaiementFunction with TFunctionData {
 
   final controller    = Get.find<TScolariteController>();
   final controllerMP    = Get.find<TModalitePaiementController>();

 H_CalculMontant(){
     controllerMP.variable.MontantTotal = int.parse(controller.variable.MontantScolarite.text);
     ////// CALCUL DES SOMMES DES MONTANTS ANTERIEURS
     if(controllerMP.DataTableModalitePaiement.isNotEmpty){
    controllerMP.variable.TotalVersement = controllerMP.DataTableModalitePaiement.map(
                                                      (e)=>e.Montant).reduce((a,b)=>a!+b!)!;}

    ////// CALCULE DU RESTE 
   controllerMP.variable.MontantRestant.value = controllerMP.variable.MontantTotal - controllerMP.variable.TotalVersement;
   
   }

 
 H_CalculMonatantSaisir(val){
 controllerMP.variable.Solde = controllerMP.variable.MontantTotal - controllerMP.variable.TotalVersement + controllerMP.variable.MontantVersementAnterieur;
  final montant = val==""?0 : int.parse(val);
  if(montant> controllerMP.variable.Solde){
   TLoader.warningSnack(title: "MONTANT",message: "Le montant saisit est superieur au reste");
    return;
  }
  
  controllerMP.variable.MontantRestant.value = controllerMP.variable.Solde - montant;
 
 }

 void H_OnChangedJour(param){
   controllerMP.variable.Jour.text = param;
    controllerMP.variable.JourMois.text = "$param ${controllerMP.variable.Mois.text.toString()}";
  } 
  
   void H_OnChangedJourRappel(param){
   controllerMP.variable.JourRappel.text = param;
   controllerMP.variable.JourRappelMois.text = "$param ${controllerMP.variable.Mois.text.toString()}";
  } 

   void H_OnChangedMois(param){
   controllerMP.variable.Mois.text = param;
   controllerMP.variable.JourMois.text = "${controllerMP.variable.Jour.text.toString()} $param";
   controllerMP.variable.JourRappelMois.text = "${controllerMP.variable.JourRappel.text.toString()} $param";
  } 

 

}