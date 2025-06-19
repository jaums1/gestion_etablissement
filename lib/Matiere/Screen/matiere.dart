import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/Data_table/data_table.dart';
import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configuration/Screen/Widget/cadre_configuration.dart';
import '../Controller/matiere_controller.dart';
import 'Widget/cadreheader_matiere.dart';


class TMatiereScolaireScreen extends StatelessWidget {
  const TMatiereScolaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TMatiereController>();
    
    return Scaffold(
      backgroundColor: TColors.lightgrey,
      body: TCadreConfiguration(titre: TText.matiere,
       child: Obx(
        () {
           int i=0;
           return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///// BARRE HAUT BOUTTON NOUVEAU ET CHAMP DE RECHERCE 
            SizedBox(child: TCadreHeaderMatiere()),
            SizedBox(height: 5,),
            SizedBox(
               height: 275,
              child: TDataTable(
                onSelectAll: (_)=>controller.selectAllCheckBox(value: _),
                showCheckboxColumn: true,
                 minWidth: 90,
                        dataRowHeight: 35, //56
                           onPageChanged: (value){},
                          ///// SORTING
                          sortColumnIndex: 0,
                          sortAscending: true,
                columns: controller.columns.map((column)
                => column             
                ).toList(),
              
                rows: controller.dataTableFiltreMatiere.map((data)
                {
                 ++i;
                 final isSelect = controller.isSelectMatiere.contains(data.matiere);
                  return  DataRow2(
                    onTap: (){},
                    selected: isSelect,
                    onSelectChanged:(_)=> controller.selectCheckBox(libMatiere:data.matiere ),
                    onDoubleTap:() => controller.H_RecupeModif(id: data.iDMatiere),
                  cells: [
                   DataCell(Text("${i}",textAlign: TextAlign.center,),),
                   DataCell(Text(data.matiere!),placeholder: true),
                     DataCell(Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: ()=>controller.H_RecupeModif(id:data.iDMatiere), icon: Icon(Icons.edit,size: 20,color: TColors.primary,)),
                        // SizedBox(width: 2,),
                        IconButton(onPressed: ()=> TShowdialogue().showQuestion(
                        titre: "SUPPRIMER",message:"Voulez-vous vraiment supprimer ${data.matiere}",
                        onPressedValide:()=> controller.H_Supprimer(id: data.iDMatiere)
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
