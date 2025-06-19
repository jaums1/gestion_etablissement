import '../../Configs/utils/formatters/formatters.dart';

class TEmployeModel {

  
int? IDEmploye;
String? Fonction;
int? IDEtablissement;
String? MatriculeEmploye;
String? Nom;
String? Prenoms;
DateTime? DateNaissance;
String? Sexe;
String? Adresse;
String? Telephone;
String? Telephone2;
String? Email;
String? Photo;
String? TypeContrat;
DateTime? DateEmbauche;
int? Salaire;
String? TypeSalaire;
String? Bancaire;
String? NumeroCompte;
String? Statut;
String? Nationnalite;
String? EtatCivil;
String? Departement;
DateTime? DateFinContrat;
String? NiveauEtude;
String? Specialite;
String? Experience;
String? Observation;
String? LieuNaissance;
String? NomComplet;

  TEmployeModel({
    this.IDEmploye,
    this.Fonction,
    this.IDEtablissement,
    this.MatriculeEmploye,
    this.NomComplet,
    this.Nom,
    this.Prenoms,
    this.DateNaissance,
    this.Sexe,
    this.Adresse,
    this.Telephone,
    this.Telephone2,
    this.Email,
    this.Photo,
    this.TypeContrat,
    this.DateEmbauche,
    this.Salaire,
    this.TypeSalaire,
    this.Bancaire,
    this.NumeroCompte,
    this.Statut,
    this.Nationnalite,
    this.EtatCivil,
    this.Departement,
    this.DateFinContrat,
    this.NiveauEtude,
    this.Specialite,
    this.Experience,
    this.Observation,
    this.LieuNaissance,
  });



  Map<String, dynamic> toJson() {
    
    return <String, dynamic>{
      'IDEmploye': IDEmploye,
      'Fonction': Fonction,
      'IDEtablissement': IDEtablissement,
      'MatriculeEmploye': MatriculeEmploye,
      'Nom': Nom,
      'Prenoms': Prenoms,
      'DateNaissance':TFormatters.formatDate(DateNaissance),
      'Sexe': Sexe,
      'Adresse': Adresse,
      'Telephone': Telephone,
      'Telephone2': Telephone2,
      'Email': Email,
      'Photo': Photo,
      'TypeContrat': TypeContrat,
      'DateEmbauche':TFormatters.formatDate(DateEmbauche),
      'Salaire': Salaire,
      'TypeSalaire': TypeSalaire,
      'Bancaire': Bancaire,
      'NumeroCompte': NumeroCompte,
      'Statut': Statut,
      'Nationnalite': Nationnalite,
      'EtatCivil': EtatCivil,
      'Departement': Departement,
      'DateFinContrat':TFormatters.formatDate(DateFinContrat),
      'NiveauEtude': NiveauEtude,
      'Specialite': Specialite,
      'Experience': Experience,
      'Observation': Observation,
      'LieuNaissance': LieuNaissance,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'IDEmploye': IDEmploye,
      'Fonction': Fonction,
      'IDEtablissement': IDEtablissement,
      'MatriculeEmploye': MatriculeEmploye,
      'Nom': Nom,
      'Prenoms': Prenoms,
      'DateNaissance': TFormatters.formatDate(DateNaissance),
      'Sexe': Sexe,
      'Adresse': Adresse,
      'Telephone': Telephone,
      'Telephone2': Telephone2,
      'Email': Email,
      'Photo': Photo,
      'TypeContrat': TypeContrat,
      'DateEmbauche': TFormatters.formatDate(DateEmbauche),
      'Salaire': Salaire,
      'TypeSalaire': TypeSalaire,
      'Bancaire': Bancaire,
      'NumeroCompte': NumeroCompte,
      'Statut': Statut,
      'Nationnalite': Nationnalite,
      'EtatCivil': EtatCivil,
      'Departement': Departement,
      'DateFinContrat': TFormatters.formatDate(DateFinContrat),
      'NiveauEtude': NiveauEtude,
      'Specialite': Specialite,
      'Experience': Experience,
      'Observation': Observation,
      'LieuNaissance': LieuNaissance,
      'NomComplet': NomComplet,
    };
  }

  factory TEmployeModel.fromMap(Map<String, dynamic> map) {
    return TEmployeModel(
      IDEmploye: map['IDEmploye'] != null ? map['IDEmploye'] as int : null,
      Fonction: map['Fonction'] != null ? map['Fonction'] as String : null,
      IDEtablissement: map['IDEtablissement'] != null ? map['IDEtablissement'] as int : null,
      MatriculeEmploye: map['MatriculeEmploye'] != null ? map['MatriculeEmploye'] as String : null,
      Nom: map['Nom'] != null ? map['Nom'] as String : null,
      Prenoms: map['Prenoms'] != null ? map['Prenoms'] as String : null,
      DateNaissance: map['DateNaissance'] != null ? DateTime.parse(map['DateNaissance']) : null,
      Sexe: map['Sexe'] != null ? map['Sexe'] as String : null,
      Adresse: map['Adresse'] != null ? map['Adresse'] as String : null,
      Telephone: map['Telephone'] != null ? map['Telephone'] as String : null,
      Telephone2: map['Telephone2'] != null ? map['Telephone2'] as String : null,
      Email: map['Email'] != null ? map['Email'] as String : null,
      Photo: map['Photo'] != null ? map['Photo'] as String : null,
      TypeContrat: map['TypeContrat'] != null ? map['TypeContrat'] as String : null,
      DateEmbauche: map['DateEmbauche'] != null ? DateTime.parse(map['DateEmbauche']) : null,
      Salaire: map['Salaire'] != null ? map['Salaire'] as int : null,
      TypeSalaire: map['TypeSalaire'] != null ? map['TypeSalaire'] as String : null,
      Bancaire: map['Bancaire'] != null ? map['Bancaire'] as String : null,
      NumeroCompte: map['NumeroCompte'] != null ? map['NumeroCompte'] as String : null,
      Statut: map['Statut'] != null ? map['Statut'] as String : null,
      Nationnalite: map['Nationnalite'] != null ? map['Nationnalite'] as String : null,
      EtatCivil: map['EtatCivil'] != null ? map['EtatCivil'] as String : null,
      Departement: map['Departement'] != null ? map['Departement'] as String : null,
      DateFinContrat: map['DateFinContrat'] != null ? DateTime.parse(map['DateFinContrat']) : null,
      NiveauEtude: map['NiveauEtude'] != null ? map['NiveauEtude'] as String : null,
      Specialite: map['Specialite'] != null ? map['Specialite'] as String : null,
      Experience: map['Experience'] != null ? map['Experience'] as String : null,
      Observation: map['Observation'] != null ? map['Observation'] as String : null,
      LieuNaissance: map['LieuNaissance'] != null ? map['LieuNaissance'] as String : null,
      NomComplet: map['NomComplet'] != null ? map['NomComplet'] as String : null,
    );
  }

}
