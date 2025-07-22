import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../Configs/cammon/widgets/Data_table/data_table.dart';
import '../../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configuration/Screen/Widget/cadre_configuration.dart';
import '../Controller/matiere_controller.dart';
import '../Controller/page_matiere.dart';
import '../Controller/validation_matiere.dart';
import 'Widget/cadreheader_matiere.dart';


class TMatiereScolaireScreen extends StatelessWidget {
   final controller = Get.find<TMatiereController>();
   TMatiereScolaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: TCadreConfiguration(titre: TText.matiere,
       child: Column(
        spacing: 10,
        children: [
           ///// BARRE HAUT BOUTTON NOUVEAU ET CHAMP DE RECHERCE 
            SizedBox(child: TCadreHeaderMatiere()),
            Obx(
        () {
           

            // État de chargement avec timeout
         if (controller.isLoading.value==false) {
            return TEtatChargement.H_EtatChargement(onPressedChargement:() => controller.H_RecupeData());
          }
            
            
           // État quand les données sont vides
        if (controller.DataTableMatiere.isEmpty && controller.isLoading.value==true ) {
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
                onSelectAll: (value)=>controller.selectAllCheckBox(value:value),
                showCheckboxColumn: true,
                 minWidth: 90,
                        dataRowHeight: 35, //56
                           onPageChanged: (value){},
                          ///// SORTING
                          sortColumnIndex: 0,
                          sortAscending: true,
                columns: controller.columns.map((column)=> column).toList(),
              
                rows: controller.DataTableFiltreMatiere.map((data)
                {
                 ++i;
                 final isSelect =  controller.isSelectMatiere.contains(data.matiere);
                  return  DataRow2(
                    onTap: (){},
                    selected: isSelect,
                    onSelectChanged:(_)=> controller.selectCheckBox(libMatiere:data.matiere ),
                    // onDoubleTap:() => controller.H_RecupeModif(id: data.iDMatiere),
                  cells: [
                   DataCell(Text("$i",textAlign: TextAlign.center,),),

                   DataCell(Text(data.matiere!)),

                     DataCell(Center(child: TTableActionIconButtons(
                          iconSize: 20,
                          onEditPressed: () =>TMatierePage().H_PageShowDialogModifier(id: data.iDMatiere) ,
                          onDeletePressed: () => TMatiereValidation().H_Supprimer(id: data.iDMatiere),
                          ),
                       )
                    
                    ),
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

        ],
       )
       
       
       
       
       
       )  
    );
    
  }

}
