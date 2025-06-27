// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../Configs/utils/formatters/formatters.dart';


class TInscriptionModel {
   int? IDInscription;
   int? IDClasse;
   int? IDAnneeScolaire;
   int? IDEtablissement;
   int? MontantVersement;
   int? DroitInscription;
   int? FraisAnnexe;
   DateTime? DateInscription;
   int? NbrVersement;
   int? NetAPayer;
   int? ResteAPayer;
   int? Paiement;
   String? Annee;
   String? MoisEnLettre;
   String? MoisAnnee;
   DateTime? DateCreation;
   String? HeureCreation;
   int? IDEtudiant;
   String? Statut;

  TInscriptionModel({
    this.IDInscription,
    this.IDClasse,
    this.IDAnneeScolaire,
    this.IDEtablissement,
    this.MontantVersement,
    this.DroitInscription,
    this.FraisAnnexe,
    this.DateInscription,
    this.NbrVersement,
    this.NetAPayer,
    this.ResteAPayer,
    this.Paiement,
    this.Annee,
    this.MoisEnLettre,
    this.MoisAnnee,
    this.DateCreation,
    this.HeureCreation,
    this.IDEtudiant,
    this.Statut,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDInscription': IDInscription,
      'IDClasse': IDClasse,
      'IDAnneeScolaire': IDAnneeScolaire,
      'IDEtablissement': IDEtablissement,
      'MontantVersement': MontantVersement,
      'DroitInscription': DroitInscription,
      'FraisAnnexe': FraisAnnexe,
      'DateInscription': TFormatters.formatDate(DateInscription),
      'NbrVersement': NbrVersement,
      'NetAPayer': NetAPayer,
      'ResteAPayer': ResteAPayer,
      'Paiement': Paiement,
      'IDEtudiant': IDEtudiant,
      
    };
  }

  factory TInscriptionModel.fromMap(Map<String, dynamic> map) {
    return TInscriptionModel(
      IDInscription: map['IDInscription'] != null ? map['IDInscription'] as int : 0,
      IDClasse: map['IDClasse'] != null ? map['IDClasse'] as int : null,
      IDAnneeScolaire: map['IDAnneeScolaire'] != null ? map['IDAnneeScolaire'] as int : null,
      IDEtablissement: map['IDEtablissement'] != null ? map['IDEtablissement'] as int : null,
      MontantVersement: map['MontantVersement'] != null ? map['MontantVersement'] as int : null,
      DroitInscription: map['DroitInscription'] != null ? map['DroitInscription'] as int : null,
      FraisAnnexe: map['FraisAnnexe'] != null ? map['FraisAnnexe'] as int : null,
      DateInscription: map['DateInscription'] != null ? DateTime.parse(map['DateInscription']) : null,
      NbrVersement: map['NbrVersement'] != null ? map['NbrVersement'] as int : null,
      NetAPayer: map['NetAPayer'] != null ? map['NetAPayer'] as int : null,
      ResteAPayer: map['ResteAPayer'] != null ? map['ResteAPayer'] as int : null,
      Paiement: map['Paiement'] != null ? map['Paiement'] as int : null,
      Annee: map['Annee'] != null ? map['Annee'] as String : null,
      MoisEnLettre: map['MoisEnLettre'] != null ? map['MoisEnLettre'] as String : null,
      MoisAnnee: map['MoisAnnee'] != null ? map['MoisAnnee'] as String : null,
      DateCreation: map['DateCreation'] != null ? DateTime.parse(map['DateCreation']) : null,
      HeureCreation: map['HeureCreation'] != null ? map['HeureCreation'] as String : null,
      IDEtudiant: map['IDEtudiant'] != null ? map['IDEtudiant'] as int : null,
      Statut: map['Statut'] != null ? map['Statut'] as String : null,
    );
  }

 
} 
