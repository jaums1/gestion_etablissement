import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../Configs/utils/Constant/enums.dart';
import '../../Configs/utils/Constant/sizes.dart';

class HearderUtilisateur extends StatelessWidget {
  const HearderUtilisateur({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
     final argument = Get.arguments;
     
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             TRetourHeader(titre:
                argument== TraitementAction.nouveau.name?
                 "Enregistrement Utilisateur":"Modification Utilisateur",route:TRoutes.utilisateur,),
                SizedBox(height: TSizes.spaceBtwItems,),
                child??SizedBox(),
            ],
          ),
        )
        
        ,
      ),
    );
  }
}