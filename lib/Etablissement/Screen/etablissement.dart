

import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../Configs/utils/Constant/sizes.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import 'Widget/info_etatblissement.dart';
import 'Widget/info_cordonnee.dart';
import 'Widget/situtgeo_etablissement.dart';


class TEtablissementScolaireScreen extends StatelessWidget {
  const TEtablissementScolaireScreen({super.key,this.isPass=true});
  final bool? isPass;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         TTitlePage(tilte: TText.etatblissement.tr,),
        

         Expanded(
           child: Padding(
              padding: const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
             child: SingleChildScrollView(
               child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   
                   TRoundedContainerCreate(
                      // padding : const EdgeInsets.symmetric(horizontal: TSizes.lg, vertical: TSizes.sm),
                    child: TInforEtablissement(),
                   ),
                 
                  TRoundedContainerCreate(
                      // padding : const EdgeInsets.symmetric(horizontal: TSizes.lg, vertical: TSizes.sm),
                    child: TInfoCordonnee(),
                   ),  
                   
                   TRoundedContainerCreate(
                      // padding : const EdgeInsets.symmetric(horizontal: TSizes.lg, vertical: TSizes.sm),
                    child: TSituationGeographiqueEtablissement(),
                   ),

                   SizedBox()

                
                 ],
               ),
             ),
           ),
         )
      
        ],
      ),
    );
  }
}


