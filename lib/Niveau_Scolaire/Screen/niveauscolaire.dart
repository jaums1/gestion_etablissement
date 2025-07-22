
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../Configs/utils/Constant/sizes.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import '../../Configuration/Screen/Widget/cadre_configuration.dart';
import 'Widget/carder_niveauscolaire.dart';


class TNiveauScolaireScreen extends StatelessWidget {
  const TNiveauScolaireScreen({super.key});
  
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///// TITRE DU CARDER
           TTitlePage(tilte:TText.niveauScolaire.tr,),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                 padding:const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
                   child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          
                             TCarderNiveauScolaireScreen(),
                            
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

