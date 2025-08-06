import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TInscriptionVariable {
  final params = "".obs;
 
  final List<DataColumn> columns = [
    DataColumn2(label: Text("N°"), fixedWidth: 50, headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Date Inscription",softWrap: true,), size: ColumnSize.S, headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Matricule",softWrap: true), size: ColumnSize.S),
    DataColumn2(label: Text("Étudiant",softWrap: true), size: ColumnSize.L),
    DataColumn2(label: Text("Classe",softWrap: true), size: ColumnSize.S),
    DataColumn2(label: Text("Statut",softWrap: true,), size: ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("D.Pro.. Versement",softWrap: true,maxLines: 1, overflow: TextOverflow.ellipsis), size: ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Paiement Effectué",softWrap: true,maxLines: 1, overflow: TextOverflow.ellipsis,), size: ColumnSize.S),
    DataColumn2(label: Text("Reste à payer",softWrap: true), size: ColumnSize.S),
    DataColumn2(label: Text("Net à payer",softWrap: true), size: ColumnSize.S),
    DataColumn2(label: Text("Etat",softWrap: true), size: ColumnSize.S,headingRowAlignment: MainAxisAlignment.center),
    DataColumn2(label: Text("Action",softWrap: true), fixedWidth: 100, headingRowAlignment: MainAxisAlignment.center),
  ];

  final IDInscription = TextEditingController();
  final IDClasse = TextEditingController();
  final IDAnneeScolaire = TextEditingController();
  final IDEtablissement = TextEditingController();
  final MontantVersement = TextEditingController();
  final DroitInscription = TextEditingController();
  final FraisAnnexe = TextEditingController();
  final DateInscription = TextEditingController().obs;
  final DateProchainVersement = TextEditingController();
  final Date = TextEditingController();
  final NbrVersement = TextEditingController();
  final NetAPayer = TextEditingController();
  final ResteAPayer = TextEditingController();
  final Paiement = TextEditingController();
  final IDEtudiant = TextEditingController();
  final Statut = TextEditingController();
  final Scolarite = TextEditingController();

  final GlobalKey<FormState> keyInscription = GlobalKey<FormState>();

  H_Initialise(){
  MontantVersement.clear();
  DroitInscription.clear();
  FraisAnnexe.clear();
  DateInscription.value.clear();
  NbrVersement.clear();
  NetAPayer.clear();
  ResteAPayer.clear();
  Paiement.clear();
  IDEtudiant.clear();
  Statut.clear();
  Scolarite.clear();
  }
} 