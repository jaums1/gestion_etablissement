
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Constant/sizes.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Type_Decoupage_Scolaire/Controller/typedecoupage_controller.dart';


class TDecoupageScolaireScreen extends StatelessWidget {
  const TDecoupageScolaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
     final controller     = Get.put(TTypeDecoupageController());
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///// TITRE DU CARDER
           TTitlePage(tilte:TText.decoupageScolaire,),
          Expanded(
           child: Padding(
             padding:const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
             child: SingleChildScrollView(
               child: Container(
                 decoration: BoxDecoration(color: Colors.white,),
                 child: Column(
                   children:[
                    Column(
                      children: controller.dataTableTypeDecoupage.map((tab){
                     return Obx( ()=>  RadioListTile<String>(value: tab.libTypeDecoupage!,  
                            activeColor: TColors.primary,
                            title: Text(tab.libTypeDecoupage!),
                            subtitle:Text(tab.sousTitre!) ,
                        groupValue: controller.selectRadio.value,
                         onChanged: controller.onSelectRadio));
                                     }).toList() ,
                    ),
                   
                   ]
                 ),
               ),
             ),
           ),
         ),
      
            
               
        ],
      ),
    );
  }
}