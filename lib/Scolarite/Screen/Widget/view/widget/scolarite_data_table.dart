
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';

import '../../../../Controller/scolarite_controller.dart';
import '../../../../Data/scolarite_data_sourcetable.dart';

class TClasseDataTable extends StatelessWidget {
  const TClasseDataTable({super.key});
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TScolariteController>();
  
  
   controller.DataTableScolarite.isEmpty?controller.H_RecupeData():"";
    return  Obx(
      (){ 
        
            // État de chargement avec timeout
         if (controller.isLoading.value==false) {
        return Center(child: TEtatChargement.H_EtatChargement(onPressedChargement:() => controller.H_RecupeData()));
      }
      
      // État quand les données sont vides
      if (controller.DataTableScolarite.isEmpty && controller.DataTableFiltreScolarite.isEmpty) {
        return Center(child: TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),));
      }

       if(controller.DataTableFiltreScolarite.isEmpty || controller.DataTableFiltreScolarite.isNotEmpty){}

          return TPaginatedDataTable(
          minWidth: 700,
           columns: controller.variable.columns,
           source: TScolariteSourceData(),);





        // if(controller.isLoading.value==false && controller.DataTableFiltreScolarite.isEmpty){
        //   return Center(
        //     child:TAnimationLoaderWidget(text: "Chargement encours...",
        //    animation: TImages.docerAnimation,width: 250,)
        //   );
        // }else{
        //   return TPaginatedDataTable(
        //   minWidth: 700,
        //    columns: controller.variable.columns,
           
        //    source: TScolariteSourceData(),
        //         );
        // }
       
        
   } );
  }
}