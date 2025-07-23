import 'package:flutter/material.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';



class TClasseDesktopScreen extends StatelessWidget {
  const TClasseDesktopScreen({super.key});

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
                  // TTableHeader(buttonText: "J'enregistre une classe",onChanged:(value){
                  //   TClasseFiltre().H_FiltreElement(param: value);} ,onPressed: ()=>TClassePage().H_PageNouveau(),),
                  // SizedBox(height: TSizes.spaceBtwItems,),
                 
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height*0.68,
                  //   child: TClasseDataTable())
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
