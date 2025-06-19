import 'package:data_table_2/data_table_2.dart';
import 'package:ecole/Matiere%20coef/Controller/matierecoef_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/Data_table/data_table.dart';
import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configs/utils/Popup/showdialogue.dart';
import '../../Configuration/Screen/Widget/cadre_configuration.dart';
import 'Widget/carderhead_matierecoef.dart';



class TMatiereCoefScreen extends StatelessWidget {
  const TMatiereCoefScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TCoefficientController>();
    
    return Scaffold(
      backgroundColor: TColors.lightgrey,
      body: TCadreConfiguration(titre: TText.matiereCoef,
       child:  Obx(
         (){
          int i=0;
          return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              ///// BARRE HAUT BOUTTON NOUVEAU ET CHAMP DE RECHERCE 
              // SizedBox(child: TCadreHeaderMatiere()), 56000F 28 05 2025 ANGRE CHATEAU NON LOIN DE LA PHARM DU CHATEAU 
        
              SizedBox(child: TCadreHeaderMatiereCoef()), 
              SizedBox(height: 5,),
            SizedBox(
               height: 275,
              child: TDataTable(
                        minWidth: 90,
                        dataRowHeight: 35, //56
                           onPageChanged: (value){},
                          ///// SORTING
                          // sortColumnIndex: 0,
                          sortAscending: false,
                columns: controller.columns.map((column)
                => column             
                ).toList(),
              
                rows: controller.dataTableFiltreCoefficient.map((data)
                {
                 ++i;
            
                  return  DataRow2(
                    onTap: (){},
                    onDoubleTap:() => controller.H_RecupeModif(id: data.iDMatiere),
                  cells: [
                   DataCell(Text("${i}",textAlign: TextAlign.center,),),
                   DataCell(Text(data.niveauSerie!,overflow: TextOverflow.ellipsis,)),
                  //  DataCell(Text(data.lisMatiere!.join(","))),
                   DataCell(SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                      children: data.lisMatiere!.map((e)=>Padding(
                        padding: const  EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                         
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(3))
                          ),
                          child: Text(e,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                          softWrap: true,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                        ),
                      )).toList() ,
                     ),
                   )),
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



              // SizedBox(height: 5,),
              // SizedBox(
              //    height: 275,
              //   child:Container()
              // ),
           
            ],);
  })
       )  
    );
    
    
    
  }


}
