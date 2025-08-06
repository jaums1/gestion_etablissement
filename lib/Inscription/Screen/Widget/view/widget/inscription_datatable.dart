import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';

import '../../../../Controller/inscription_controller.dart';
import '../../../../Data/inscription_data_sourcetable.dart';


class TInscriptionDataTable extends StatelessWidget {
   final controller = Get.find<TInscriptionController>();
   TInscriptionDataTable({super.key});
  @override
  Widget build(BuildContext context) {

    return  Obx(
      (){ 
        
        // État de chargement avec timeout
         if (controller.isLoading.value==false) {
        return Center(child: TEtatChargement.H_EtatChargement());
      }
      
      // État quand les données sont vides
      if (controller.DataTableInscription.isEmpty) {
        return Center(child: TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),));
      }
    
      if(controller.DataTableInscription.isEmpty || controller.DataTableFiltreInscription.isNotEmpty){}

         // Affichage des données
          return TPaginatedDataTable(
          minWidth: 1500,
           columns: controller.variable.columns,
           source: TInscriptionSourceData(),);
       
        
   } );
  }
}