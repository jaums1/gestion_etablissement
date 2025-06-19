import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../Controller/inscription_controller.dart';
import '../Controller/inscription_page.dart';
import '../Controller/inscription_validation.dart';

class TInscriptionSourceData extends DataTableSource {
  final controller = Get.find<TInscriptionController>();

  @override
  DataRow? getRow(int index) {
    final data = controller.DataTableFiltreInscription[index];
    return DataRow2(cells: [
      DataCell(Text("${index + 1}", style: Theme.of(Get.context!).textTheme.bodyMedium)),
      
      DataCell(Text(data.IDEtudiant.toString(),
          style: Theme.of(Get.context!).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 2)),
      
      DataCell(Text(data.IDClasse.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: Theme.of(Get.context!).textTheme.bodyMedium)),
      
      DataCell(Text(data.MontantVersement.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.bodyMedium)),
      
      DataCell(Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: data.Statut == 'En cours'
                  ? TColors.buttonPrimary.withOpacity(0.4)
                  : TColors.success.withOpacity(0.4)),
          child: Text(data.Statut.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
                  color: data.Statut == 'En cours'
                      ? TColors.buttonPrimary
                      : TColors.success),
              overflow: TextOverflow.ellipsis,
              maxLines: 1))),

      DataCell(TTableActionIconButtons(
        onDeletePressed: () => TInscriptionValidation().H_Supprimer(id: data.IDInscription),
        onEditPressed: () => TInscriptionPage().H_PageModifier(id: data.IDInscription),
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