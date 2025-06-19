import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TInscriptionVariable {
  final params = "".obs;
 
  final List<DataColumn> columns = [
    DataColumn2(label: Text("N°"), fixedWidth: 50, headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Étudiant"), size: ColumnSize.L),
    DataColumn2(label: Text("Classe"), size: ColumnSize.L),
    DataColumn2(label: Text("Montant"), size: ColumnSize.S),
    DataColumn2(label: Text("Statut"), size: ColumnSize.S),
    DataColumn2(label: Text("Action"), fixedWidth: 100, headingRowAlignment: MainAxisAlignment.center),
  ];

  final IDInscription = TextEditingController();
  final IDClasse = TextEditingController();
  final IDAnneeScolaire = TextEditingController();
  final IDEtablissement = TextEditingController();
  final MontantVersement = TextEditingController();
  final DroitInscription = TextEditingController();
  final FraisAnnexe = TextEditingController();
  final DateInscription = TextEditingController();
  final NbrVersement = TextEditingController();
  final NetAPayer = TextEditingController();
  final ResteAPayer = TextEditingController();
  final Paiement = TextEditingController();
  final IDEtudiant = TextEditingController();
  final Statut = TextEditingController();
  final Scolarite = TextEditingController();

  final GlobalKey<FormState> keyInscription = GlobalKey<FormState>();
} 