// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecole/Annee_Scolaire/Controller/annee_scolaire_controller.dart';
import 'package:ecole/Classe/Model/classe_model.dart';
import 'package:ecole/Eleves/Model/eleve_model.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/generer_reference.dart';
import '../../Configs/utils/formatters/formatters.dart';
import '../../Login/Controller/user_controller.dart';

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
   String? TypePaiement;
   String? MoisEnLettre;
   String? MoisAnnee;
   DateTime? DateCreation;
   DateTime? DateProchainVersement;
   String? HeureCreation;
   int? IDEtudiant;
   int? IDUtilisateur;
   String? Utilisateur;
   String? Regime;
   String? Statut;
   TClasseModel? DataClasse;
   TModelEleve? DataEleve;

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
    this.TypePaiement,
    this.DataClasse,
    this.DataEleve,
    this.DateProchainVersement,
    this.IDUtilisateur,
    this.Utilisateur,
    this.Regime,

  });

 final controlleAS = Get.find<TAnneeScolaireController>();
 final controlleUser = Get.find<TUserController>();


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'IDInscription': IDInscription,
      'IDClasse': IDClasse,
      'IDAnneeScolaire': controlleAS.DataAnneeScolairePrincipale.value.IDAnneeScolaire,
      'IDEtablissement': IDEtablissement,
      'MontantVersement': MontantVersement,
      'DroitInscription': DroitInscription,
      'FraisAnnexe': FraisAnnexe,
      'DateInscription': TFormatters.formatDate(DateInscription),
      'DateProchainVersement': TFormatters.formatDate(DateProchainVersement),
      'NbrVersement': NbrVersement,
      'NetAPayer': NetAPayer,
      'ResteAPayer': ResteAPayer,
      'Paiement': Paiement,
      'Regime': Regime,
      'IDEtudiant': IDEtudiant,
      'TypePaiement': TypePaiement,
      'IDUtilisateur': controlleUser.DataUserPrincipale.value.idUtilisateur,
      'RefVersement':TGenerationReference.H_GenererReference(ref:"Vers" ),
      
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
      DateProchainVersement: map['DateProchainVersement'] != null ? DateTime.parse(map['DateProchainVersement']) : null,
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
      IDUtilisateur: map['IDUtilisateur'] != null ? map['IDUtilisateur'] as int : null,
      Statut: map['Statut'] != null ? map['Statut'] as String : null,
      Regime: map['Regime'] != null ? map['Regime'] as String : null,
      Utilisateur: map['Utilisateur'] != null ? map['Utilisateur'] as String : null,
      DataClasse: map['DataClasse'] != null ? TClasseModel.fromMap(map['DataClasse']) : null,
      DataEleve: map['DataEtudiant'] != null ? TModelEleve.fromMap(map['DataEtudiant'])  : null,
    );
  }

 
  
  
} 
