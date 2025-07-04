import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Statut/statut.dart';
import 'package:ecole/Inscription/Controller/inscription_page.dart';
import 'package:ecole/Versement/Controller/versement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Classe/Controller/classe_controller.dart';
import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../../Eleves/Controller/eleve_controller.dart';
import '../Controller/inscription_controller.dart';
import '../Controller/inscription_validation.dart';

class TInscriptionSourceData extends DataTableSource {
  final controller = Get.find<TInscriptionController>();
  final controllerEleve = Get.find<TEleveController>();
  final controllerClasse = Get.find<TClasseController>();

  @override
  DataRow? getRow(int index) {
    //  TModelEleve dataEleve;
    final data = controller.DataTableFiltreInscription[index];
    

    return DataRow2(cells: [
      DataCell(Text("${index + 1}", style: Theme.of(Get.context!).textTheme.bodyMedium)),
      
      DataCell(Text(data.DataEleve!.Matricule??"",
          style: Theme.of(Get.context!).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1)),
      
      DataCell(Text(data.DataEleve!.NomComplet??"",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(Get.context!).textTheme.bodyMedium)),
      
      DataCell(Text(data.DataClasse!.LibClasse.toString(),
          // textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.bodyMedium)),

        DataCell(Text("${data.Paiement} Fcfa",
          textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.bodyMedium)),

        DataCell(Text("${data.ResteAPayer} Fcfa",
          textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.bodyMedium)),

        DataCell(Text("${data.NetAPayer} Fcfa",
          textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.bodyMedium)),
    
      DataCell(Center(child: TStatutCustom().H_OnChangeCouleur(titre: data.Statut))),

      DataCell(TTableActionIconButtons(
        view: true,
       delete: false,
        onDeletePressed: () => TInscriptionValidation().H_Supprimer(id: data.IDInscription),
        onEditPressed: () => TVersementPage().H_PageNouveau(id: data.IDInscription),
        onViewPressed: () {
           TInscriptionPage().H_PageDetail(id:data.IDInscription );
           },
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.DataTableFiltreInscription.length;

  @override
  int get selectedRowCount => 0;
} 