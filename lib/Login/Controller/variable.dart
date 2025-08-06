import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TUserVariable {

  final List<DataColumn> columns = [
    DataColumn2(label: Text("N°"), fixedWidth: 50, headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Nom Prénoms",softWrap: true,), size: ColumnSize.L),
    DataColumn2(label: Text("Utilisateur",softWrap: true), size: ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Mot de Passe",softWrap: true), size: ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Role",softWrap: true), size: ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),
    // DataColumn2(label: Text("Statut",softWrap: true,),fixedWidth: 150,headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Action",softWrap: true), fixedWidth: 100, headingRowAlignment: MainAxisAlignment.center),
  ];

   final user =TextEditingController();
  final password =TextEditingController();
  final passwordConfirm =TextEditingController();
  final role =TextEditingController();

   final hidePassword  = true.obs;
  final hidePasswordConfirm  = true.obs;
  final rememberMe    = false.obs;

  final loginFromKey = GlobalKey<FormState>();

  final registerFromKey = GlobalKey<FormState>();

  final registerKey = GlobalKey<FormState>();

  final codekey = GlobalKey<FormState>();

  void clear(){
    user.clear();
    password.clear();
    passwordConfirm.clear();
    role.clear();
  }
}