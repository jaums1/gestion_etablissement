import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Modalite_Paiement/Model/modalite_paiement_model.dart';
import '../../Niveau_Scolaire/Model/niveauscolaire_model.dart';



class TScolariteVariable {
  
   final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Niveau Serie"),size: ColumnSize.L),
     DataColumn2(label: Text("Type Scolarite"),size: ColumnSize.S),
     DataColumn2(label: Text("Frais Inscription"),size: ColumnSize.S),
     DataColumn2(label: Text("Frais Annexe"),size: ColumnSize.S,),              
     DataColumn2(label: Text("Scolarite"),size: ColumnSize.S,),              
     DataColumn2(label: Text("Action"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];


final MontantScolarite= TextEditingController();
final FraisAnnexe= TextEditingController();
final TypeScolarite= TextEditingController();
final FraisInscription= TextEditingController();
final NiveauScolaire= TextEditingController();
final DataTableModalitePaiement =<TModalitePaiementModel>[].obs; 
var DataTableNiveauScolaire =<TNiveauModel>[];


 final GlobalKey<FormState> keyScolarite=GlobalKey<FormState>();


 H_Clear(){
  MontantScolarite.clear();
  TypeScolarite.clear();
 FraisAnnexe.clear();
 FraisInscription.clear();
 NiveauScolaire.clear();
 DataTableModalitePaiement.clear(); 
 DataTableNiveauScolaire.clear();
 
 }
 
  


}