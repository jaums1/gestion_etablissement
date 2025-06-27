// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

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
      'DateVersement': DateVersement?.millisecondsSinceEpoch,
      'DateProchainVersement': DateProchainVersement?.millisecondsSinceEpoch,
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
      DateCreation: map['DateCreation'] != null ? DateTime.fromMillisecondsSinceEpoch(map['DateCreation'] as int) : null,
      HeureCreation: map['HeureCreation'] ?? TimeOfDay.now(),
      DateVersement: map['DateVersement'] != null ? DateTime.fromMillisecondsSinceEpoch(map['DateVersement'] as int) : null,
      DateProchainVersement: map['DateProchainVersement'] != null ? DateTime.fromMillisecondsSinceEpoch(map['DateProchainVersement'] as int) : null,
    );
  }


} 
