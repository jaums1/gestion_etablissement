import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Employe/Controller/employe_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../Controller/employe_page.dart';
import '../Controller/employe_statut.dart';
import '../Controller/employe_validation.dart';

class TEmployeSourceData extends DataTableSource {
  final controller    = Get.find<TEmployeController>();

  @override
  DataRow? getRow(int index) {
     final data = controller.DataTableFiltreEmploye[index];
    return DataRow2(onTap: (){},cells: [
       
        DataCell(Align(child: Text("${index+1}",style: Theme.of(Get.context!).textTheme.bodyMedium,))),
       
        // DataCell(Text(data.MatriculeEmploye.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        // overflow: TextOverflow.ellipsis,maxLines: 2,)),
       
        DataCell(Text(data.NomComplet.toString(),
        overflow: TextOverflow.ellipsis,maxLines: 1,
        style: Theme.of(Get.context!).textTheme.bodyMedium,)),
       
        DataCell(Text(data.Sexe.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,),),
        
         DataCell(Text(data.Fonction.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,),),
        
        DataCell(Text(data.Telephone.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,),),
        
        DataCell(Text(data.TypeContrat.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium,
        overflow: TextOverflow.ellipsis,maxLines: 1,),),
        
        // DataCell(Text(TFormatters.formatDateFr(data.DateEmbauche),style: Theme.of(Get.context!).textTheme.bodyMedium,
        // overflow: TextOverflow.ellipsis,maxLines: 1,)),

        DataCell(Center(child: TEmployeStatut().H_OnChangeCouleur(titre: data.Statut))),

          DataCell(TTableActionIconButtons(
            // view: true,
            onDeletePressed: ()=> TEmployeValidation().H_Supprimer(id: data.IDEmploye),
            onEditPressed: ()=>   TEmployePage().H_PageModifier(id: data.IDEmploye),
          )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override

  int get rowCount => controller.DataTableFiltreEmploye.length;

  @override
  
  int get selectedRowCount => 0;
  
}