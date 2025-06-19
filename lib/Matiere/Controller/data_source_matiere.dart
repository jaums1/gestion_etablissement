
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'matiere_controller.dart';

class TDataSourceMatiere extends DataTableSource {
  final controller = Get.find<TMatiereController>();
  @override
  DataRow? getRow(int index) {
  final data =controller.dataTableMatiere[index];
    return DataRow2(
      onTap: (){},
      selected: true,
      onSelectChanged: (value){},
      cells: [
        // DataCell(Text(data.etat==false??"")),
        // DataCell(Text(data.codeMatiere??"")),
        DataCell(Text(data.matiere??"")),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>controller.dataTableMatiere.length;

  @override
  
  int get selectedRowCount => 0;
  
}