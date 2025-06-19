import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Eleves/Screen/Widget/Create/widget/left_create_eleve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/eleve_controller.dart';
import '../widget/right_create_eleve.dart';

class TCreateEleveDesktopScreen extends StatelessWidget {
  const TCreateEleveDesktopScreen({super.key, this.argument=TRoutes.eleve, this.action});
  final String argument;
  final String? action;
  @override
  Widget build(BuildContext context) {
      final controller = Get.find<TEleveController>();
    return  SingleChildScrollView(
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
                    flex: 2,
                    // width: MediaQuery.of(context).size.width*0.55,
                    child: Padding(
                      padding: const EdgeInsets.only(right:  10.0),
                      child: TLeftCreateEleve(),
                    )),
                  
                // SizedBox(width: 10,),

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
      ));
  }
}