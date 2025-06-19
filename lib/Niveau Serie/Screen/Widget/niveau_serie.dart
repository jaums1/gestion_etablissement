
import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Cycle/Controller/cycle_controller.dart';
import 'package:ecole/Niveau%20Serie/Controller/filtre_niveau_serie.dart';
import 'package:ecole/Niveau%20Serie/Controller/niveau_serie_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/Data_table/data_table.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../../Configs/utils/Popup/showdialogue.dart';
import '../../../Configuration/Screen/Widget/cadre_configuration.dart';
import 'cadreheader_niveauserie.dart';


class TNiveauSerieScreen extends StatelessWidget {
  const TNiveauSerieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TNiveauSerieController>();
    final controllerCycle = Get.find<TCycleController>();
    final controllerFiltre = TFiltreNiveauSerie();
    controller.H_RecupeData(param:controllerCycle.datacyleModel.cycleScolaire);
    return Scaffold(
      backgroundColor: TColors.lightgrey,
      body: TCadreConfiguration(titre: TText.niveauSerie,
       child: Obx(
        () {
           int i=0;
           return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///// BARRE HAUT BOUTTON NOUVEAU ET CHAMP DE RECHERCE
            SizedBox(child: TCadreHeaderNiveauSerie()),
            SizedBox(height: 5,),
            SizedBox(
               height: 275,
              child: TDataTable(
                showCheckboxColumn: false,
                 minWidth: 90,
                        dataRowHeight: 35, //56
                           onPageChanged: (value){},
                          sortAscending: true,
                columns: controller.columns.map((column)=> column).toList(),
              
                rows: controller.dataTableFiltreNiveauSerie.map((data)
                {
                 ++i;
                  return  DataRow2(
                    onTap: (){},
                  cells: [
                   DataCell(Text("${i}",textAlign: TextAlign.center,),),
                   DataCell(Text(data.niveauSerie!)),
                     DataCell(Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: ()=>controllerFiltre.H_RecupModif(Id:data.iDNiveauScolaire,
                        iDNiveauSerie: data.iDNiveauSerie
                        ), icon: Icon(Icons.edit,size: 20,color: TColors.primary,)),
                        // SizedBox(width: 2,),
                        IconButton(onPressed: ()=> TShowdialogue().showQuestion(
                        titre: "SUPPRIMER",message:"Voulez-vous vraiment supprimer ${data.niveauSerie}",
                        onPressedValide:()=> controller.H_Supprimer(id: data.iDNiveauSerie)
                        ), icon: Icon(Icons.delete,color: Colors.red,size: 20,)),
                      ],
                    )),
                  ]
                );
                }
                ).toList() ,
              ),
            ),
         
         
         
          ],
         ); 
         }
       )
       )  
    );
    
  }

}
