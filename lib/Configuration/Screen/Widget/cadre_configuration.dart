

import 'package:flutter/material.dart';

import '../../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../../Configs/utils/Constant/sizes.dart';

class TCadreConfiguration extends StatelessWidget {
  const TCadreConfiguration({
    super.key, required this.titre, required this.child, this.childRight,
  });
 final String titre;
 final Widget child;
 final Widget? childRight;
  @override
  Widget build(BuildContext context) {
    return Column(
   crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///// TITRE DU CARDER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TTitlePage(tilte:titre,),
            Padding(
              padding: const EdgeInsets.only(right:TSizes.md ),
              child: childRight??null,
            )
          ],
        ),
         
         Expanded(
           child: Padding(padding: const EdgeInsets.only(left: TSizes.sm,right: TSizes.sm),
            child: SingleChildScrollView(
              child:Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: child,
              )),
           ),
         ),
      
      ],
    );
  }
}