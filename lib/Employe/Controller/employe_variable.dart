import 'package:data_table_2/data_table_2.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TEmployeVariable {
  final params ="".obs;
 
   final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,headingRowAlignment: MainAxisAlignment.center),
    //  DataColumn2(label: Text("Matricule"),fixedWidth: 130),
     DataColumn2(label: Text("Nom Prénoms"),size: ColumnSize.L),
     DataColumn2(label: Text("Sexe"),size: ColumnSize.S,),
     DataColumn2(label: Text("Fonction"),size: ColumnSize.S),
     DataColumn2(label: Text("Contact"),size: ColumnSize.S),
     DataColumn2(label: Text("Type contrat",softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,),size: ColumnSize.S,
     headingRowAlignment: MainAxisAlignment.center
     ), 
    //  DataColumn2(label: Text("Date ambauche",
    //  softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,),size: ColumnSize.S,
    //  headingRowAlignment: MainAxisAlignment.center
    //  ), 
     DataColumn2(label: Text("Statut"),size: ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),                
     DataColumn2(label: Text("Action"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];
 
   final List<String> etatsCivil = [
  'Célibataire',
  'Marié(e)',
  'Divorcé(e)',
  'Veuf / Veuve',
  'Union libre',
  'Séparé(e)',
];
   
   final List<String> fonctionsScolaires = [
    'Directeur',
  'Directrice',
  'Sous-directeur',
  'Surveillant général',
  'Chef de département',
  'Secrétaire',
  'Comptable',
  'Caissier',
  'Caissière',
  'Intendant',
  'Censeur',
  'Proviseur',
  'Conseiller d’éducation',
  'Chargé de discipline',
  'Responsable pédagogique',
  'Professeur',
  'Educateur',
  'Educatrice',
  'Documentaliste',
  'Bibliothécaire',
  'Technicien informatique',
  'Agent administratif',
  'Agent d’entretien',
  'Gardien',
  'Infirmier',
   'Infirmière',
  'Psychologue scolaire',
  'Animateur',
  'Animatrice',
  'Conducteur de bus scolaire',
   ];
   final List<String> fonctionsScolairesPrimaire = ['Directeur',
  'Directrice',
  'Sous-directeur',
  'Surveillant général',
  'Chef de département',
  'Secrétaire',
  'Comptable',
  'Caissier',
   'Caissière',
  'Intendant',
  'Censeur',
  'Proviseur',
  'Conseiller d’éducation',
  'Chargé de discipline',
  'Responsable pédagogique',
  'Enseignant',
  'Enseignante',
  'Educateur',
  'Educatrice',
  'Documentaliste',
  'Bibliothécaire',
  'Technicien informatique',
  'Agent administratif',
  'Agent d’entretien',
  'Gardien',
  'Infirmier',
  'Infirmière',
  'Psychologue scolaire',
  'Animateur',
  ' Animatrice',
  'Conducteur de bus scolaire',];
   final List<String> fonctionsScolairesPrescolaire = [
  'Directeur',
  'Directrice',
  'Sous-directeur',
  'Surveillant général',
  'Chef de département',
  'Secrétaire',
  'Comptable',
  'Caissier',
  'Caissière',
  'Intendant',
  'Censeur',
  'Proviseur',
  'Conseiller d’éducation',
  'Chargé de discipline',
  'Responsable pédagogique',
  'Maître',
  'Maîtresse',
  'Educateur', 
  'Educatrice',
  'Documentaliste',
  'Bibliothécaire',
  'Technicien informatique',
  'Agent administratif',
  'Agent d’entretien',
  'Gardien',
  'Infirmier',
  ' Infirmière scolaire',
  'Psychologue scolaire',
  'Animateur',
  ' Animatrice',
  'Conducteur de bus scolaire',
];
   final List<String> departements = [
  'Direction',
  'Administration',
  'Pédagogie',
  'Comptabilité',
  'Informatique',
  'Vie scolaire',
  'Discipline',
  'Infirmerie',
  'Bibliothèque',
  'Communication',
  'Transport',
  'Sécurité',
  'Entretien',
  'Ressources humaines',
];
   final List<String> typesContrat = [
  'CDI',    
  'CDD',                
  'Vacataire',
];
   final List<String> statuts = [
  'Actif',
  'Suspendu',
  'En congé',
  'Démissionnaire',
  'Licencié',
  'Retraité',
  'Décédé',
];
   final List<String> typesSalaire = [
  'Mensuel',
  'Hebdomadaire',
  'Journalier',
  'Par heure',
];
   
  final Fonction     = TextEditingController();
  final IDEtablissement = TextEditingController();
  final MatriculeEmploye = TextEditingController();
  final Nom            = TextEditingController();
  final Prenoms        = TextEditingController();
  var   DateNaissance  = TextEditingController().obs;
  final Sexe           = TextEditingController();
  final Adresse        = TextEditingController();
  final Telephone      = TextEditingController();
  final Telephone2     = TextEditingController();
  final Email          = TextEditingController();
  final Photo          = TextEditingController();
  final TypeContrat    = TextEditingController();
  var   DateEmbauche   = TextEditingController().obs;
  final Salaire        = TextEditingController();
  final TypeSalaire    = TextEditingController();
  final Bancaire       = TextEditingController();
  final NumeroCompte   = TextEditingController();
  final Statut         = TextEditingController();
  final Nationnalite   = TextEditingController();
  final EtatCivil      = TextEditingController();
  final Departement    = TextEditingController();
  var   DateFinContrat = TextEditingController().obs;
  final NiveauEtude    = TextEditingController();
  final Specialite     = TextEditingController();
  final Experience     = TextEditingController();
  final Observation    = TextEditingController();
  final LieuNaissance  = TextEditingController();





 final GlobalKey<FormState> keyInfoPerso=GlobalKey<FormState>();
 final GlobalKey<FormState> keyInfoProfessionnelle=GlobalKey<FormState>();
 final keyInfoParent=GlobalKey<FormState>();
  
 H_Clear(){
   Fonction    .clear();
   IDEtablissement.clear();
   MatriculeEmploye.clear();
   Nom           .clear();
   Prenoms       .clear();
   DateNaissance.value.clear();
   Sexe          .clear();
   Adresse       .clear();
   Telephone     .clear();
   Telephone2    .clear();
   Email         .clear();
   Photo         .clear();
   TypeContrat   .clear();
   DateEmbauche.value.clear();
   Salaire       .clear();
   TypeSalaire   .clear();
   Bancaire      .clear();
   NumeroCompte  .clear();
   Statut        .clear();
   Nationnalite  .clear();
   EtatCivil     .clear();
   Departement.clear();
   DateFinContrat.value.clear();
   NiveauEtude   .clear();
   Specialite    .clear();
   Experience    .clear();
   Observation   .clear();
   LieuNaissance .clear();
 }

}