import 'package:flutter/material.dart';

import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../widget/info_perso_eleve.dart';
import '../widget/right_create_eleve.dart';

class TCreateEleveMobileScreen extends StatelessWidget {
  const TCreateEleveMobileScreen({super.key,this.argument=TRoutes.eleve, this.action});
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
           
             TRoundedContainer(
                showShadow: false,
                child: TRightCreatePhotoEleve(),
              ),
              SizedBox(height: 10,),
               TRoundedContainer(
                showShadow: false,
                child:TInformationPersoEleve(),
              ),
          ],
        ),
      )),
    );
  }
}