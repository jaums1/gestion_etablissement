import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:ecole/Eleves/Controller/eleve_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../Controller/eleve_page.dart';

class EleveSourceData extends DataTableSource {
  final controller    = Get.find<TEleveController>();

  @override
  DataRow? getRow(int index) {
     final dataEleve = controller.DataTableFiltreEleve[index];
    return DataRow2(
      onTap: (){},
      cells: [
        DataCell(Text("${index+1}",style: Theme.of(Get.context!).textTheme.bodyMedium,)),

        DataCell(Text(dataEleve.Matricule.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,)),

        DataCell(Tooltip(
          message:"${dataEleve.Nom} ${dataEleve.Prenoms}" ,
          child: Text("${dataEleve.Nom} ${dataEleve.Prenoms}",
          overflow: TextOverflow.ellipsis,maxLines: 1,
          style: Theme.of(Get.context!).textTheme.bodyMedium,),
        )),

        DataCell(Text(dataEleve.Sexe.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,),),

        DataCell(Text(TFormatters.formatDateFr(dataEleve.DateNaissance),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,)),

        DataCell(Text(dataEleve.Contact1.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,)),

        DataCell(Text(dataEleve.Statut.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,)),

        DataCell(Text(dataEleve.Regime.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,)),

          DataCell(TTableActionIconButtons(
            // view: true,
            onDeletePressed: ()=> TValidationEleve().H_Supprimer(id: dataEleve.IDEtudiant),
            onEditPressed: ()=>TElevePage().H_PageModifier(id: dataEleve.IDEtudiant),
          )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override

  int get rowCount => controller.DataTableFiltreEleve.length;

  @override
  
  int get selectedRowCount => 0;
  
}