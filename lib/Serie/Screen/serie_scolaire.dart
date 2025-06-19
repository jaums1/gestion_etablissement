
import 'package:flutter/material.dart';

import '../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../Configs/utils/Constant/sizes.dart';
import '../../Configs/utils/Constant/texte_string.dart';
import 'Widget/cardreheader_serie.dart';

class TSerieScolaireScreen extends StatelessWidget {
  const TSerieScolaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         ///// TITRE DU CARDER
         TTitlePage(tilte:TText.serieScolaire,),
         Expanded(
           child: Padding(padding: const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
            child: SingleChildScrollView(
              child:Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TCardreHeaderSerie(),
                ],
              )
              
             
            ),
           ),
         ),
      ],
    );
  }
}