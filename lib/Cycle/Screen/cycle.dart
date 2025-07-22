
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Constant/sizes.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../Controller/cycle_controller.dart';

class TCycleScolaireScreen extends StatelessWidget {
  const TCycleScolaireScreen({super.key});

  @override
  
  Widget build(BuildContext context) {
    final controller = Get.put(TCycleController());
    
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TTitlePage(tilte:TText.cycle.tr ,),
          Expanded(
            child: SizedBox(
               width: double.infinity,
              child: Padding(padding:const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
                         child: SingleChildScrollView(
              child:   Column(
                children: [
                  TRoundedContainerCreate(
                    child: Column(
                           children:controller.DataTableCycle.map((tab){
                         return Obx( ()=>  RadioListTile<String>(
                          value: tab.cycleScolaire??"",
                         activeColor: TColors.primary,
                         title: Text(tab.cycleScolaire??""),
                         subtitle:Text(tab.sousTitre??"") ,
                         selected: controller.selectRadio.value==tab.cycleScolaire?true:false,
                         groupValue: controller.selectRadio.value,
                        onChanged: controller.onSelectRadio));
                       }).toList() ,
                         ),
                  ),
                ],
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


