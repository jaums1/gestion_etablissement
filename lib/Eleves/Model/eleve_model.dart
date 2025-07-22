

import '../../Configs/utils/formatters/formatters.dart';
import '../../Configs/utils/model_file/model_file.dart';

class TModelEleve {
  int? IDEtudiant;
  String? Matricule;
  String? Nom;
  String? Prenoms;
  String? NomComplet;
  String? Sexe;
  DateTime? DateNaissance;
  String? LieuNaissance;
  String? Adresse;
  String? Contact1;
  String? Contact2;
  String? Statut;
  String? Regime;
  String? Photo;
  String? NomParent;
  String? PrenomsParent;
  String? ContactParent1;
  String? ContactParent2;
  TUploadFileModel? filePhoto; 
   TModelEleve({
    this.IDEtudiant,
    this.Matricule,
    this.Nom,
    this.Prenoms,
    this.Sexe,
    this.DateNaissance,
    this.LieuNaissance,
    this.Adresse,
    this.Contact1,
    this.Contact2,
    this.Statut,
    this.Regime,
    this.Photo,
    this.NomParent,
    this.PrenomsParent,
    this.ContactParent1,
    this.ContactParent2,
    this.NomComplet
  });

   ///// RECUPERATION
  factory TModelEleve.fromMap(Map<String,dynamic> data){
    return TModelEleve(
      IDEtudiant: data.containsKey("IDEtudiant")?data["IDEtudiant"]:0,
      Matricule: data.containsKey("Matricule")?data["Matricule"]??'':'',
      Nom: data.containsKey("Nom")?data["Nom"]??'':'',
      Prenoms: data.containsKey("Prenoms")?data["Prenoms"]??'':'',
      NomComplet: data.containsKey("NomComplet")?data["NomComplet"]??'':'',
      Sexe: data.containsKey("Sexe")?data["Sexe"]??'':'',
      DateNaissance: data.containsKey("DateNaissance")?DateTime.parse(data["DateNaissance"]):DateTime.now(),
      LieuNaissance: data.containsKey("LieuNaissance")?data["LieuNaissance"]??'':'',
      Adresse: data.containsKey("Adresse")?data["Adresse"]??'':'',
      Contact1: data.containsKey("Contact1")?data["Contact1"]??'':'',
      Contact2: data.containsKey("Contact2")?data["Contact2"]??'':'',
      Statut: data.containsKey("Statut")?data["Statut"]??'':'',
      Regime: data.containsKey("Regime")?data["Regime"]??'':'',
      Photo: data.containsKey("Photo")?data["Photo"]??'':'',
      NomParent: data.containsKey("NomParent")?data["NomParent"]??'':'',
      PrenomsParent: data.containsKey("PrenomsParent")?data["PrenomsParent"]??'':'',
      ContactParent1: data.containsKey("ContactParent1")?data["ContactParent1"]??'':'',
      ContactParent2: data.containsKey("ContactParent2")?data["ContactParent2"]??'':'',
    );
  }


  
////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "IDEtudiant" : IDEtudiant,
    "Matricule" : Matricule,
    "Nom" : Nom,
    "Prenoms" : Prenoms,
    "Sexe" : Sexe,
    "LieuNaissance" : LieuNaissance,
    "Adresse" : Adresse,
    "Contact1" : Contact1,
    "Contact2" : Contact2,
    "Statut" : Statut,
    "Regime" : Regime,
    "Photo" : Photo,
    "DateNaissance" : TFormatters.formatDate(DateNaissance),
    "NomParent" : NomParent,
    "PrenomsParent" : PrenomsParent,
    "ContactParent1" : ContactParent1,
    "ContactParent2" : ContactParent2,
  };
}
}