import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:ecole/Eleves/Controller/eleve_filtre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';
import '../../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../../Configs/cammon/widgets/View_Screen/view_screen.dart';
import '../../../Controller/eleve_page.dart';
import '../../../Data/data_sourcetable.dart';

class TEleveTabletScreen extends StatelessWidget {
  final controller = Get.find<TEleveController>();
   TEleveTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TViewScreen(
        child:Column(
         crossAxisAlignment: CrossAxisAlignment.start,
  
          spacing: TSizes.md,
          children: [
              //// HEADER TABLE ELEVE  Get.offNamed(route)
            TTableHeader(
              buttonText: "J'enregistre un(e) élève",
              onChanged: (value) {
                TFiltreEleve().H_FiltreElement(param: value);
              },
              onPressed: () => TElevePage().H_PageNouveau(),
            ),

             ///// DATA BASE ELEVE
            Obx(
            (){
            
         // État de chargement avec timeout
         if (controller.isLoading.value==false) {
            return TEtatChargement.H_EtatChargement(onPressedChargement:() => controller.H_RecupeData());
          }
            
           // État quand les données sont vides
        if (controller.DataTableEleve.isEmpty) {
        return TEtatChargement.H_EtatDataVide(onPressedChargement: () => controller.H_RecupeData(),);
        }  
         
         // Affichage des données
          return SizedBox(
             width: MediaQuery.of(context).size.height*0.70,
            child: TPaginatedDataTable(
            minWidth: 700,
             columns: controller.variable.columns,
             source: EleveSourceData(),),
          );
          })
             
          ],
        ),
        );
            
  }
}
