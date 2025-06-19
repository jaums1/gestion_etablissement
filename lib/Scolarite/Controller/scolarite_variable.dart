import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Niveau%20Serie/Model/niveau_serie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Modalite_Paiement/Model/modalite_paiement_model.dart';



class TScolariteVariable {
  
   final List<DataColumn> columns = [
     DataColumn2(label: Text("N°"),fixedWidth: 50,headingRowAlignment: MainAxisAlignment.center),
     DataColumn2(label: Text("Niveau Serie"),size: ColumnSize.L),
     DataColumn2(label: Text("Frais Inscription"),size: ColumnSize.S),
     DataColumn2(label: Text("Frais Annexe"),size: ColumnSize.S,),              
     DataColumn2(label: Text("Scolarite"),size: ColumnSize.S,),              
     DataColumn2(label: Text("Action"),fixedWidth: 100,headingRowAlignment: MainAxisAlignment.center),         
  ];


final MontantScolarite= TextEditingController();
final FraisAnnexe= TextEditingController();
final FraisInscription= TextEditingController();
final IDNiveauSerie= TextEditingController();
final NiveauSerie= TextEditingController();
final DataTableModalitePaiement =<TModalitePaiementModel>[].obs; 
final DataTableNiveauSerie =<TNiveauSerieModel>[].obs; 
var DataNiveauSerie =TNiveauSerieModel().obs; 

 final GlobalKey<FormState> keyScolarite=GlobalKey<FormState>();
 
  


}