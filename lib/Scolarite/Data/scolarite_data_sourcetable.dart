import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../Controller/scolarite_controller.dart';
import '../Controller/scolarite_page.dart';
import '../Controller/scolarite_validation.dart';

class TScolariteSourceData extends DataTableSource {
  final controller    = Get.find<TScolariteController>();
  @override
  DataRow? getRow(int index) {
     final data = controller.DataTableFiltreScolarite[index];
    return DataRow2(
      onTap: (){},
      cells: [
       
        DataCell(Text("${index+1}",style: Theme.of(Get.context!).textTheme.bodyMedium,)),
       
        DataCell(Text("${data.DataNiveauSerie!.niveauSerie}",style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,)),
       
        DataCell(Text("${data.FraisInscription} Fcfa",
        overflow: TextOverflow.ellipsis,maxLines: 1,
        style: Theme.of(Get.context!).textTheme.bodyMedium,)),

        DataCell(Text("${data.FraisAnnexe} Fcfa",
        overflow: TextOverflow.ellipsis,maxLines: 1,
        style: Theme.of(Get.context!).textTheme.bodyMedium,)),

        DataCell(Text("${data.MontantScolarite} Fcfa",
        overflow: TextOverflow.ellipsis,maxLines: 1,
        style: Theme.of(Get.context!).textTheme.bodyMedium,)),

          DataCell(TTableActionIconButtons(
            // view: true,
            onDeletePressed: ()=> TScolariteValidation().H_Supprimer(id: data.IDScolarite),
            onEditPressed: ()=>   TScolaritePage().H_PageModifier(id: data.IDScolarite),
          )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override

  int get rowCount => controller.DataTableFiltreScolarite.length;

  @override
  
  int get selectedRowCount => 0;
  
}