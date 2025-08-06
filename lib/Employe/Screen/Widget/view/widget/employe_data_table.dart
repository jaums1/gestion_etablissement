import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';

import '../../../../Controller/employe_controller.dart';
import '../../../../Data/employe_data_sourcetable.dart';

class EmployeDataTable extends StatelessWidget {
  const EmployeDataTable({super.key});
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TEmployeController>();
    controller.DataTableEmploye.isEmpty?controller.H_RecupeData():"";
    return  Obx(
      (){ 
           // État de chargement avec timeout
         if (controller.isLoading.value==false) {
        return Center(child: TEtatChargement.H_EtatChargement(onPressedChargement:() => controller.H_RecupeData()));
      }
      
      // État quand les données sont vides
      if (controller.DataTableEmploye.isEmpty && controller.DataTableFiltreEmploye.isEmpty) {
        return Center(child: TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),));
      }
      
       if(controller.DataTableFiltreEmploye.isEmpty || controller.DataTableFiltreEmploye.isNotEmpty){}

          return TPaginatedDataTable(
          minWidth: 700,
           columns: controller.variable.columns,
           source: TEmployeSourceData(),);

       
        
   } );
  }
}