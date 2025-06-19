import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/inscription_controller.dart';
import '../../../../Controller/inscription_validation.dart';
import '../widget/info_classe.dart';
import '../widget/info_eleve.dart';
import '../widget/info_paiement.dart';

class TCreateInscriptionDesktopForm extends StatelessWidget {
  final controller = Get.find<TInscriptionController>();
   TCreateInscriptionDesktopForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TCreateForm(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ///// HEADER
            TRetourHeader(titre:"Incription",route: TRoutes.inscription,),
            SizedBox(height: TSizes.spaceBtwItems,),
            //// ELEVE
           InfoEleveInscription(controller: controller,),
          SizedBox(height: TSizes.md,),
          SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //// CLASSE
                InfoClasseInscription(controller: controller,),
                SizedBox(width: TSizes.md,),
                /// SCOLARITE
                InfoPaiementInscription(controller: controller,),
              ],
            ),
          ),
           ///// BUTTON VALIDER
           SizedBox(height: TSizes.md,),
           Padding(
             padding: const EdgeInsets.only(right:  42.0),
             child: TButton.ValidateButton(titre: "Valider",onPressed: ()=> TInscriptionValidation().H_Enregistrer()),
           )

         
  
        ],
      ),
    );
  }
}