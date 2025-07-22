import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/Data_table/data_table.dart';
import '../../Scolarite/Controller/scolarite_controller.dart';
import '../Controller/niveau_serie_controller.dart';
import '../Controller/niveauserie_function.dart';

class TDataTableNiveauSerie extends StatelessWidget {
  final controllerS =Get.find<TScolariteController>();
   TDataTableNiveauSerie({super.key, 
  required this.controller,
   this.showdialogue=false});

 final TNiveauSerieController controller;
 final bool? showdialogue;
  @override
  Widget build(BuildContext context) {
  final functions=TNiveauSerieFunction();
    return Obx(
      (){
        int i=0;
       return TDataTable(
            // onPageChanged: (value){},
            columns: controller.columns.map((column)=> column).toList(),
            rows: controller.DataTableFiltreNiveauSerie.map((data)
            {
              final verif = controller.DataTableSelectNiveauSerie.contains(data);
              final select = controllerS.DataTableScolarite.indexWhere(
                (e)=> e.DataNiveauSerie!.iDNiveauSerie==data.iDNiveauSerie
                );
                
             ++i;
            
              return  DataRow2(
                // selected: select==-1?false:true,
                onTap: (){},
                // onSelectChanged: (value){},
              cells: [
               DataCell(Text("$i",textAlign: TextAlign.center,),),

              //  DataCell(Align(
              //   child: IgnorePointer(ignoring: select==-1?false:true,
              //    child: Checkbox(value: verif, onChanged: (value){
              //     functions.H_SelectNiveauSerie(data);
              //    }))),),

               DataCell(Text(data.niveauSerie!,maxLines: 1,overflow: TextOverflow.ellipsis,)),

                 DataCell(Align(
                  child:TTableActionIconButtons(
                    iconSize: 20,
                    delete: true,edit: true,
                    onDeletePressed: (){},
                    onEditPressed: (){},
                    ) ,)),
              ]
            );
            }
            ).toList() ,
          );
  });
  }
}