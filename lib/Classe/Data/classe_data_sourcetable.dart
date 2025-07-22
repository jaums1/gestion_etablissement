import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../Controller/classe_controller.dart';
import '../Controller/classe_page.dart';
import '../Controller/classe_validation.dart';

class TClasseSourceData extends DataTableSource {
  final controller    = Get.find<TClasseController>();

  @override
  DataRow? getRow(int index) {
     final data = controller.DataTableFiltreClasse[index];
    return DataRow2(
      onTap: (){},
      cells: [
       
        DataCell(Text("${index+1}",style: Theme.of(Get.context!).textTheme.bodyMedium,)),
       
        DataCell(Text(data.DataNiveauSerie!.niveauSerie.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 2,)),
       
        DataCell(Text(data.LibClasse.toString(),
        overflow: TextOverflow.ellipsis,maxLines: 2,
        style: Theme.of(Get.context!).textTheme.bodyMedium,)),
       
        DataCell(
        data.Capacite.toString().isEmpty? Container(padding: EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),
            color: TColors.buttonPrimary.withValues(alpha: 0.4)
          ),
          child: Text("Non defini",textAlign: TextAlign.center,style: Theme.of(Get.context!).textTheme.bodyMedium!.copyWith(
            color: TColors.buttonPrimary),
          overflow: TextOverflow.ellipsis,maxLines: 1,),
        ): Text(data.Capacite.toString(),textAlign: TextAlign.center,) 
        ),

          DataCell(TTableActionIconButtons(
            // view: true,
            onDeletePressed: ()=> TClasseValidation().H_Supprimer(id: data.IDClasse),
            onEditPressed: ()=>   TClassePage().H_PageModifier(id: data.IDClasse),
          )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override

  int get rowCount => controller.DataTableFiltreClasse.length;

  @override
  
  int get selectedRowCount => 0;
  
}