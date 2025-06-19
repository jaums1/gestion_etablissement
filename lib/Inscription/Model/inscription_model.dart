
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

  factory TInscriptionModel.fromMap(Map<String, dynamic> json) {
    return TInscriptionModel(
      IDInscription: json['IDInscription'],
      IDClasse: json['IDClasse'],
      IDAnneeScolaire: json['IDAnneeScolaire'],
      IDEtablissement: json['IDEtablissement'],
      MontantVersement: json['MontantVersement']?.toDouble(),
      DroitInscription: json['DroitInscription']?.toDouble(),
      FraisAnnexe: json['FraisAnnexe']?.toDouble(),
      DateInscription: json['DateInscription'] != null ? DateTime.parse(json['DateInscription']) : null,
      NbrVersement: json['NbrVersement'],
      NetAPayer: json['NetAPayer']?.toDouble(),
      ResteAPayer: json['ResteAPayer']?.toDouble(),
      Paiement: json['Paiement']?.toDouble(),
      Annee: json['Annee'],
      MoisEnLettre: json['MoisEnLettre'],
      MoisAnnee: json['MoisAnnee'],
      DateCreation: json['DateCreation'] != null ? DateTime.parse(json['DateCreation']) : null,
      HeureCreation: json['HeureCreation'],
      IDEtudiant: json['IDEtudiant'],
      Statut: json['Statut'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'IDInscription': IDInscription,
      'IDClasse': IDClasse,
      'IDAnneeScolaire': IDAnneeScolaire,
      'IDEtablissement': IDEtablissement,
      'MontantVersement': MontantVersement,
      'DroitInscription': DroitInscription,
      'FraisAnnexe': FraisAnnexe,
      'DateInscription': DateInscription?.toIso8601String(),
      // 'NbrVersement': NbrVersement,
      'NetAPayer': NetAPayer,
      'ResteAPayer': ResteAPayer,
      'Paiement': Paiement,
      // 'Annee': Annee,
      // 'MoisEnLettre': MoisEnLettre,
      // 'MoisAnnee': MoisAnnee,
      // 'DateCreation': DateCreation?.toIso8601String(),
      // 'HeureCreation': HeureCreation,
      'IDEtudiant': IDEtudiant,
      'Statut': Statut,
    };
  }
} 