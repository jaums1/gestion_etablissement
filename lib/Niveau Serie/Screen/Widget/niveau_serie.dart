
import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../Configs/cammon/widgets/Data_table/data_table.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../../Configuration/Screen/Widget/cadre_configuration.dart';
import 'cadreheader_niveauserie.dart';


class TNiveauSerieScreen extends StatelessWidget {
  const TNiveauSerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TNiveauSerieController>();
    controller.H_RecupeData();
    return Scaffold(
      backgroundColor: TColors.lightgrey,
      body: TCadreConfiguration(titre: TText.niveauSerie.tr,
       child:Column(
        spacing: 10,
        children: [
            ///// BARRE HAUT BOUTTON NOUVEAU ET CHAMP DE RECHERCE
            SizedBox(child: TCadreHeaderNiveauSerie()),
            SizedBox(
              child: Obx(
               () {
          // État de chargement avec timeout
         if (controller.isLoading.value==false) {
            return TEtatChargement.H_EtatChargement(onPressedChargement:() => controller.H_RecupeData());
          }
            
           // État quand les données sont vides
        if (controller.DataTableNiveauSerie.isEmpty && controller.isLoading.value==true ) {
        return TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),
        height: 220);
        } 
       
           int i=0;
           return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            SizedBox(
               height: 275,
              child: TDataTable(
                onSelectAll: controller.onSelectCheckBoxAll,
                showCheckboxColumn: true,
                 minWidth: 90,
                        dataRowHeight: 35, //56
                           onPageChanged: (value){},
                          sortAscending: true,
                columns: controller.columns.map((column)=> column).toList(),
              
                rows: controller.DataTableFiltreNiveauSerie.map((data)
                {
                  final isSelect =  controller.isSelectNiveauSerieTable.contains(data.niveauSerie);
                 ++i;
                  return  DataRow2(
                    selected: isSelect,
                    onSelectChanged:(_)=> controller.onSelectCheckBoxTable(niveauSerie:data.niveauSerie),
                    onTap: (){},
                  cells: [
                   DataCell(Align(child: Text("$i")),),
       
                   DataCell(Text(data.niveauSerie!)),
       
                    //  DataCell(
                    //    Align(
                    //      child: TTableActionIconButtons(
                    //       iconSize: 20,
                    //       onEditPressed: () =>TNiveauSeriePage().H_PageShowDialogModifier(id: data.iDNiveauSerie) ,
                    //       onDeletePressed: () => TNiveauSerieValidation().H_Supprimer(id: data.iDNiveauSerie),),
                    //    )
                    
                    // ),
                  ]
                );
                }
                ).toList() ,
              ),
            ),
          ],
         ); 
         }
       ) ,
            )
        ],
       )
       
       
       
       
       )  
    );
    
  }

}
