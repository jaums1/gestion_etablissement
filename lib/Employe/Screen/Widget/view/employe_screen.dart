import 'package:ecole/Employe/Controller/employe_page.dart';
import 'package:flutter/material.dart';
import '../../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../../Configs/cammon/widgets/containers/rounded_container.dart';
import '../../../../Configs/utils/Constant/sizes.dart';

import '../../../Controller/employe_filtre.dart';
import 'widget/employe_data_table.dart';

class TEmployeScreen extends StatelessWidget {
  const TEmployeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  SingleChildScrollView(
      
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            TRoundedContainer(
              child: Column(
                children: [
                
                  //// HEADER TABLE ELEVE  Get.offNamed(route)
                  TTableHeader(buttonText: "J'enregistre un employe",onChanged:(value){
                    TEmployeFiltre().H_FiltreElement(param: value);} ,onPressed: ()=>TEmployePage().H_PageNouveau(),),
                  SizedBox(height: TSizes.spaceBtwItems,),
                 
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.68,
                    child: EleveDataTable())
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
