import 'package:flutter/material.dart';

class TVersementVariable {
  final IDVersement = TextEditingController();
  final IDAnneeScolaire = TextEditingController();
  final IDInscription = TextEditingController();
  final Ref = TextEditingController();
  final TypePaiement = TextEditingController();
  final Montant = TextEditingController();
  final ResteAPayer = TextEditingController();
  final DateCreation = TextEditingController();
  final HeureCreation = TextEditingController();
  final DateVersement = TextEditingController();
  final DateProchainVersement = TextEditingController();
  final MontantAnterieur = TextEditingController();

  void clear() {
    IDVersement.clear();
    IDAnneeScolaire.clear();
    IDInscription.clear();
    Ref.clear();
    TypePaiement.clear();
    Montant.clear();
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
    Montant.dispose();
    ResteAPayer.dispose();
    DateCreation.dispose();
    HeureCreation.dispose();
    DateVersement.dispose();
    DateProchainVersement.dispose();
  }
} 