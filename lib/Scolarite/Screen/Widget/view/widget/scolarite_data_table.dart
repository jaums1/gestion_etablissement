
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/cammon/widgets/Data_table/paginated_data_table.dart';
import '../../../../../Configs/utils/Constant/image_string.dart';
import '../../../../../Configs/utils/Popup/animation_loader.dart';

import '../../../../Controller/scolarite_controller.dart';
import '../../../../Data/scolarite_data_sourcetable.dart';

class TClasseDataTable extends StatelessWidget {
  const TClasseDataTable({super.key});
 
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TScolariteController>();
  
  
    controller.H_RecupeData();
    return  Obx(
      (){ 
        
        if(controller.isLoading.value==false && controller.DataTableFiltreScolarite.isEmpty){
          return Center(
            child:TAnimationLoaderWidget(text: "Chargement encours...",
           animation: TImages.docerAnimation,width: 250,)
          );
        }else{
          return TPaginatedDataTable(
          minWidth: 700,
           columns: controller.variable.columns,
           
           source: TScolariteSourceData(),
                );
        }
       
        
   } );
  }
}