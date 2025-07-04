

import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:flutter/material.dart';

class TVersementModel {
  int? IDVersement;
  int? IDAnneeScolaire;
  int? IDInscription;
  String? Ref;
  String? TypePaiement;
  int? Montant;
  int? ResteAPayer;
  DateTime? DateCreation;
  TimeOfDay? HeureCreation;
  DateTime? DateVersement;
  DateTime? DateProchainVersement;

  TVersementModel({
    this.IDVersement,
    this.IDAnneeScolaire,
    this.IDInscription,
    this.Ref,
    this.TypePaiement,
    this.Montant,
    this.ResteAPayer,
    this.DateCreation,
    this.HeureCreation,
    this.DateVersement,
    this.DateProchainVersement,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDVersement': IDVersement,
      'IDAnneeScolaire': IDAnneeScolaire,
      'IDInscription': IDInscription,
      'Ref': Ref,
      'TypePaiement': TypePaiement,
      'Montant': Montant,
      'ResteAPayer': ResteAPayer,
      'DateVersement': TFormatters.formatDate(DateVersement) ,
      'DateProchainVersement':TFormatters.formatDate(DateProchainVersement),
    };
  }

  // factory TVersementModel.fromMap(Map<String, dynamic> map) {
  //   return TVersementModel(
  //     IDVersement: map['IDVersement'] as int?,
  //     IDAnneeScolaire: map['IDAnneeScolaire'] as int?,
  //     IDInscription: map['IDInscription'] as int?,
  //     Ref: map['Ref'] as String?,
  //     TypePaiement: map['TypePaiement'] as String?,
  //     Montant: map['Montant'] as int?,
  //     ResteAPayer: map['ResteAPayer'] as int?,
  //     DateCreation: map['DateCreation'] as String?,
  //     HeureCreation: map['HeureCreation'] as String?,
  //     DateVersement: map['DateVersement'] as String?,
  //     DateProchainVersement: map['DateProchainVersement'] as String?,
  //   );
  // }

  factory TVersementModel.fromMap(Map<String, dynamic> map) {
    return TVersementModel(
      IDVersement: map['IDVersement'] != null ? map['IDVersement'] as int : null,
      IDAnneeScolaire: map['IDAnneeScolaire'] != null ? map['IDAnneeScolaire'] as int : null,
      IDInscription: map['IDInscription'] != null ? map['IDInscription'] as int : null,
      Ref: map['Ref'] != null ? map['Ref'] as String : null,
      TypePaiement: map['TypePaiement'] != null ? map['TypePaiement'] as String : null,
      Montant: map['Montant'] != null ? map['Montant'] as int : null,
      ResteAPayer: map['ResteAPayer'] != null ? map['ResteAPayer'] as int : null,
      DateCreation: map['DateCreation'] != null ? DateTime.parse(map['DateCreation']) : null,
      // HeureCreation: map['HeureCreation'] ,
      DateVersement: map['DateVersement'] != null ? DateTime.parse(map['DateVersement']) : null,
      DateProchainVersement: map['DateProchainVersement'] != null ? DateTime.parse(map['DateProchainVersement'] ) : null,
    );
  }


} 
