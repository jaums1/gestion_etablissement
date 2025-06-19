

import 'package:flutter/material.dart';
import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../Configs/cammon/widgets/cardre_images/cardre_images.dart';
import '../../Configs/utils/Constant/colors.dart';
import '../../Configs/utils/Constant/sizes.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import 'Widget/info_complementaireetab.dart';
import 'Widget/info_etatblissement.dart';
import 'Widget/info_fondateur.dart';
import 'Widget/situtgeo_etablissement.dart';


class TEtablissementScolaireScreen extends StatelessWidget {
  const TEtablissementScolaireScreen({super.key,this.isPass=true});
  final bool? isPass;
  @override
  Widget build(BuildContext context) {
    // final controller     = Get.put(TEtablissementController());
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         TTitlePage(tilte: TText.etatblissement,),
         Expanded(
           child: Padding(
              padding: const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
             child: SingleChildScrollView(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          // height: 100,
                          decoration: BoxDecoration(color: Colors.white,),
                          child: TInforEtablissement(),
                        ),
                      ), 
                      SizedBox(width: TSizes.sm,),
                       Expanded(
                        flex: 2,
                        child: Container(
                          height: 190,
                          decoration: BoxDecoration(color: Colors.white,),
                          child: Center(child: TCardreImage()),
                        ),
                      ),
                    ],
                   ),
                   TSituationGeographiqueEtablissement(),
                   TInfoFondateur(),
                   TInfoComplementaireEtab(),
                 ////// BOUTON
             isPass == true? Padding(
                   padding: const EdgeInsets.only(bottom: TSizes.md),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 140,
                        child: ElevatedButton(onPressed: (){},
                         child: Text("Valider")),
                      ),
                      SizedBox(width: 10,), 
                      SizedBox(
                        width: 140,
                        child: ElevatedButton(onPressed: (){},
                         style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: TColors.buttonPrimary
                         ) ,
                         child: Text("Ferme",style: TextStyle(color: TColors.buttonPrimary),),),
                      ),
                      
                      
                    ],
                   ),
                 ):SizedBox(),
                
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


