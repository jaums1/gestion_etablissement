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

final GlobalKey<FormState> keyModalitePaiement=GlobalKey<FormState>();

  H_initVariables() {
  
  LibVersement.clear();
  Montant.value.clear();
  Jour.clear();
  Mois.clear();
  JourMois.clear();
  JourRappel.clear();
  JourRappelMois.clear();
}

}