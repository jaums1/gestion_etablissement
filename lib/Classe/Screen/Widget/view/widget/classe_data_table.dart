import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';
import '../../../../Controller/classe_controller.dart';
import '../../../../Data/classe_data_sourcetable.dart';

class TClasseDataTable extends StatelessWidget {
  
  const TClasseDataTable({super.key});
   
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TClasseController>();
    
    controller.DataTableClasse.isEmpty?controller.H_RecupeData():null;
    return  Obx(
      (){ 
         if (controller.isLoading.value==false) {
        return Center(child: TEtatChargement.H_EtatChargement(onPressedChargement:() => controller.H_RecupeData()));
      }
      
      // État quand les données sont vides
      if (controller.DataTableClasse.isEmpty && controller.DataTableFiltreClasse.isEmpty) {
        return Center(child: TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),));
      }
      
       if(controller.DataTableFiltreClasse.isEmpty || controller.DataTableFiltreClasse.isNotEmpty){}


    
      return TPaginatedDataTable(
          minWidth: 700,
           columns: controller.variable.columns,
           source: TClasseSourceData(),
            );

              
   } );
  }
}