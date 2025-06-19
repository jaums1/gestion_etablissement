import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../widget/left_create_eleve.dart';
import '../widget/right_create_eleve.dart';

class TCreateEleveTabletScreen extends StatelessWidget {
  const TCreateEleveTabletScreen({super.key,this.argument=TRoutes.eleve, this.action});
final String? argument;
 final String? action;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///// HEADER
            TRetourHeader(titre:
            action == TraitementAction.nouveau.name?
             "Enregistrement Elève":"Modification Elève",route: argument,),
            SizedBox(height: TSizes.spaceBtwItems,),
          
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //// GAUCHE DATA ELEVE
                  Expanded(
                    flex: 5,
                    // width: MediaQuery.of(context).size.width*0.55,
                    child: Padding(
                      padding: const EdgeInsets.only(right:  10.0),
                      child: TLeftCreateEleve(),
                    )),

                  //// DROITE PHOTO ELEVE
                  Expanded(
                    // width: MediaQuery.of(context).size.width*0.15,
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.15,
                          child: TRightCreatePhotoEleve()),
                      ],
                    )),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}