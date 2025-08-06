import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';


import '../Controller/eleve_controller.dart';
import 'data_sourcetable.dart';

class EleveDataTable extends StatelessWidget {
  const EleveDataTable({super.key});
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TEleveController>();
    controller.DataTableEleve.isEmpty?controller.H_RecupeData():"";
    return  Obx(
      (){ 
           // État de chargement avec timeout
         if (controller.isLoading.value==false) {
        return Center(child: TEtatChargement.H_EtatChargement(onPressedChargement:() => controller.H_RecupeData()));
      }
      
      // État quand les données sont vides
      if (controller.DataTableEleve.isEmpty && controller.DataTableFiltreEleve.isEmpty) {
        return Center(child: TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),));
      }
      
       if(controller.DataTableFiltreEleve.isEmpty || controller.DataTableFiltreEleve.isNotEmpty){}

          return TPaginatedDataTable(
          minWidth: 700,
           columns: controller.variable.columns,
           source: EleveSourceData(),);   
   } );
  }
}