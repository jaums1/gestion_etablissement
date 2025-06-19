
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
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
          TTitlePage(tilte:TText.cycle ,),
          Expanded(child: Padding(padding:const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
           child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: Colors.white,),
              child: Column(
                     children:controller.dataTableCycle.map((tab){
                       
                   return Obx( ()=>  RadioListTile<String>(value: tab.cycleScolaire!,
                   // contentPadding: EdgeInsets.all(0),
                   activeColor: TColors.primary,
                   title: Text(tab.cycleScolaire!),
                   subtitle:Text(tab.sousTitre!) ,
                        groupValue: controller.selectRadio.value,
                         onChanged: controller.onSelectRadio));
                 }).toList() ,
                   ),
              ),
            ),
           ),
          ),
        //  Text(TText.cycle,style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
    );
  }
}

// Obx(
//                           ()=>

