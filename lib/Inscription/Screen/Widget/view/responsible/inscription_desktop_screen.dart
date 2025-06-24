import 'package:flutter/material.dart';

import '../../../../../Configs/cammon/widgets/Data_table/table_header.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/inscription_filtre.dart';
import '../../../../Controller/inscription_page.dart';
import '../widget/inscription_datatable.dart';

class TInscriptionDesktopScreen extends StatelessWidget {
  const TInscriptionDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  TTableHeader(buttonText: "Je fais une inscription",onChanged:(value){
                    TInscriptionFiltre().H_FiltreElement(param: value);} ,onPressed: ()=>TInscriptionPage().H_PageNouveau(),),
                  SizedBox(height: TSizes.spaceBtwItems,),
                 
                 
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.68,
                    child: TInscriptionDataTable())
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );;
  }
}