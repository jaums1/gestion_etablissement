import 'package:flutter/material.dart';
import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../widget/info_eleve.dart';

class TCreateInscriptionDesktopForm extends StatelessWidget {
  
  const TCreateInscriptionDesktopForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TCreateForm(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ///// HEADER
              TRetourHeader(titre:"Je fais une inscription",route: TRoutes.inscription,),
              SizedBox(height: TSizes.spaceBtwItems,),
              //// ELEVE
             InfoEleveInscription()
          
          ],
        )
    );
  }
}