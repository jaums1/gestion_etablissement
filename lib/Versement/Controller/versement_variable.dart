import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TVersementVariable {
 late int? restePayer;
 late int? solde;
 late int? PaiementAnterieur;
  final text="".obs;
  final IDVersement = TextEditingController();
  final IDAnneeScolaire = TextEditingController();
  final IDInscription = TextEditingController();
  final Ref = TextEditingController();
  final TypePaiement = TextEditingController();
  final Montant = TextEditingController().obs;
  final ResteAPayer = TextEditingController();
  final DateCreation = TextEditingController();
  final HeureCreation = TextEditingController();
  final DateVersement = TextEditingController();
  final DateProchainVersement = TextEditingController();
  final MontantAnterieur = TextEditingController();
   final keyVersement   = GlobalKey<FormState>();


  void clear() {
    IDVersement.clear();
    IDAnneeScolaire.clear();
    IDInscription.clear();
    Ref.clear();
    TypePaiement.clear();
    Montant.value.clear();
    ResteAPayer.clear();
    DateCreation.clear();
    HeureCreation.clear();
    DateVersement.clear();
    DateProchainVersement.clear();
    MontantAnterieur.clear();
  }

  void dispose() {
    IDVersement.dispose();
    IDAnneeScolaire.dispose();
    IDInscription.dispose();
    Ref.dispose();
    TypePaiement.dispose();
    Montant.value.dispose();
    ResteAPayer.dispose();
    DateCreation.dispose();
    HeureCreation.dispose();
    DateVersement.dispose();
    DateProchainVersement.dispose();
  }
} 