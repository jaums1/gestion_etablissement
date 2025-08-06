import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TModalitePaiementVariable {

var ListeModalitePaiement =<String>[];  
final IDScolarite= TextEditingController();
final LibVersement= TextEditingController();
var Montant= TextEditingController().obs;

final Jour= TextEditingController();
final Mois= TextEditingController();
final JourMois= TextEditingController();
final JourRappel= TextEditingController();
final JourRappelMois= TextEditingController();


var TotalVersement= 0;
var MontantVersementAnterieur= 0;
var MontantRestant= 0.obs;
var MontantTotal= 0;
var Solde= 0;

final GlobalKey<FormState> keyModalitePaiement=GlobalKey<FormState>();

  H_initVariables() {
  TotalVersement=0;
  Solde=0;
  MontantVersementAnterieur=0;
  MontantRestant.value=0;
  MontantTotal=0;
  LibVersement.clear();
  Montant.value.clear();
  Jour.clear();
  Mois.clear();
  JourMois.clear();
  JourRappel.clear();
  JourRappelMois.clear();
}

}