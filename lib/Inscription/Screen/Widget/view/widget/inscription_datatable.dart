import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';
import '../../../../../Configs/utils/Constant/image_string.dart';
import '../../../../../Configs/utils/Popup/animation_loader.dart';
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
        return TEtatChargement.H_EtatChargement();
      }
      
      // État quand les données sont vides
      if (controller.DataTableInscription.isEmpty) {
        return TEtatChargement.H_EtatDataVide();
      }

         // Affichage des données
          return TPaginatedDataTable(
          minWidth: 700,
           columns: controller.variable.columns,
           source: TInscriptionSourceData(),
                );
       
        
   } );
  }
}