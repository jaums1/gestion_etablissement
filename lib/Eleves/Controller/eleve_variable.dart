import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TVariableEleve {
  final params ="".obs;
   
   final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Matricule"),fixedWidth: 130),
     DataColumn2(label: Text("Nom Prénoms"),size: ColumnSize.L),
     DataColumn2(label: Text("Sexe"),size: ColumnSize.S,),
     DataColumn2(label: Text("Date Naissance",softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,),size: ColumnSize.S,
     headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Contact"),size: ColumnSize.S),
     DataColumn2(label: Text("Statut"),size: ColumnSize.S,),         
     DataColumn2(label: Text("Régime"),size: ColumnSize.S),        
     DataColumn2(label: Text("Action"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];

  final matricule = TextEditingController();
  final nom = TextEditingController();
  final prenoms = TextEditingController();
  final sexe = TextEditingController();
  final dateNaissance = TextEditingController().obs;
  final dateNaissanceValide = TextEditingController().obs;
  final lieuNaissance = TextEditingController();
  final phoneEleve1 = TextEditingController();
  final phoneEleve2 = TextEditingController();
  final statut = TextEditingController();
  final regime = TextEditingController();
  final adresse = TextEditingController();
  
   final nomParent = TextEditingController();
  final prenomsParent = TextEditingController();
  final phoneParent1 = TextEditingController();
  final phoneParent2 = TextEditingController();
  
 final GlobalKey<FormState> keyInfoEleve=GlobalKey<FormState>();
 final GlobalKey<FormState> keyInfoStatut=GlobalKey<FormState>();
 final keyInfoParent=GlobalKey<FormState>();
  
 void H_Initialise(){
 matricule.clear();
   nom.clear();
   prenoms.clear();
   sexe.clear();
   dateNaissance.value.clear();
   dateNaissanceValide.value.clear();
   lieuNaissance.clear();
   phoneEleve1.clear();
   phoneEleve2.clear();
   statut.clear();
   regime.clear();
   adresse.clear();
  nomParent.clear();
   prenomsParent.clear();
   phoneParent1.clear();
   phoneParent2.clear();
  
 }

}