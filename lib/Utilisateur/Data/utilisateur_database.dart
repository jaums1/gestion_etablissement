import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';
import '../../Login/Controller/user_controller.dart';
import 'utilisateur_data_sourcetable.dart';

class TUtilisateurDataTable extends StatelessWidget {
  final controller = Get.find<TUserController>();
  TUtilisateurDataTable({super.key});
  @override
  Widget build(BuildContext context) {
    controller.DataTableUser.isEmpty ? controller.H_RecupeData() : null;
    controller.controller.DataTableEmploye.isEmpty ? controller.controller.H_RecupeData() : null;
    return Obx(() {
     
      // État de chargement avec timeout
      if (controller.isLoading.value == false) {
        return Center(
            child: TEtatChargement.H_EtatChargement(
                onPressedChargement: () => controller.H_RecupeData()));
      }

      // État quand les données sont vides
      if (controller.DataTableUser.isEmpty) {
        return Center(
            child: TEtatChargement.H_EtatDataVide(
          onPressedChargement: () => controller.H_RecupeData(),
        ));
      }
      
      if(controller.DataTableFiltreUser.isEmpty || controller.DataTableFiltreUser.isNotEmpty){
      }
      
         // Affichage des données
      return  TPaginatedDataTable(
            minWidth: 700,
            columns: controller.variable.columns,
            source: TUtilisateurSourceData(),
          );
    });
  }
}
