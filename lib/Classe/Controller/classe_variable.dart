import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TClasseVariable {
  final params ="".obs;
 
   final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Niveau Serie"),size: ColumnSize.L),
     DataColumn2(label: Text("Classe"),size: ColumnSize.L),
     DataColumn2(label: Text("Capicite"),size: ColumnSize.S,),              
     DataColumn2(label: Text("Action"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];


  var ListeNiveauSerie =<String>[];  
  final LibClasse     = TextEditingController();
  final NiveauSerie     = TextEditingController().obs;
  final IDEtablissement = TextEditingController();
  final IDNiveauSerie = TextEditingController();
  final Capacite            = TextEditingController();

 final GlobalKey<FormState> keyClasse=GlobalKey<FormState>();
 
 H_Initialise(){
    LibClasse.clear();
    Capacite.clear();
    NiveauSerie.value.clear();
  }


}