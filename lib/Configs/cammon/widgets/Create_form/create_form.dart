import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Breadcrumbs/breadcrumb.dart';
import '../../../utils/Constant/enums.dart';
import '../../../utils/Constant/sizes.dart';

class TCreateForm extends StatelessWidget {
  const TCreateForm({super.key, required this.child, this.titre, this.route});
final Widget child;
final String? titre;
final String? route;
  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments;
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          spacing: TSizes.md,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ///// HEADER
          TRetourHeader(titre:
          argument == TraitementAction.nouveau.name?"Enregistrement $titre":
          argument == TraitementAction.modifier.name?"Modification $titre" : "Détails $titre",
          route: route,),
            SizedBox(
              child: child,
            )
          ],
        ),
        )
        ) ,
    );
    
  }
}