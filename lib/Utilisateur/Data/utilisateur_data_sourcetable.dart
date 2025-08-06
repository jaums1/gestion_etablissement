import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/utils/Statut/statut.dart';
import 'package:ecole/Login/Controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../../Login/Controller/user_page.dart';
import '../../Login/Controller/user_validation.dart';


class TUtilisateurSourceData extends DataTableSource {
  final controller = Get.find<TUserController>();
  

  @override
  DataRow? getRow(int index) {
    //  TModelEleve dataEleve;
    final data = controller.DataTableFiltreUser[index];
    

    return DataRow2(
      onTap: (){},
      cells: [
      DataCell(Align(child: Text("${index + 1}", textAlign: TextAlign.center, style: Theme.of(Get.context!).textTheme.bodyMedium))),  
          
      DataCell(Text(data.dataEmploye!.NomComplet??"",
          style: Theme.of(Get.context!).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis,
          maxLines: 1)),
      
      DataCell(Align(
        child: Text(data.user??"",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(Get.context!).textTheme.bodyMedium),
      )),
      
      DataCell(Align(child: Text(data.motDePasse.toString(),style: Theme.of(Get.context!).textTheme.bodyMedium))),

       DataCell(Align(child: TStatutCustom().H_OnChangeCouleur(titre: data.role))),

      DataCell(Align(
        child: TTableActionIconButtons(
          iconSize: 22,
          onDeletePressed: () => TUserValidation().H_Supprimer(id: data.idUtilisateur),
          onEditPressed: () =>TUtilisateurPage().H_PageModifier(id : data.idUtilisateur)
        ),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.DataTableFiltreUser.length;

  @override
  int get selectedRowCount => 0;
} 