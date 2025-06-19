
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../Controller/etablissement_controller.dart';

class TInfoFondateur extends StatelessWidget {
  const TInfoFondateur({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerForm = TFormulaire();
     final controller     = Get.put(TEtablissementController());
    return Padding(padding: EdgeInsets.only(bottom: TSizes.md),
    child: Container(
       decoration: BoxDecoration(color: Colors.white,),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         ///// TITRE DU CARDER
            Padding(padding: EdgeInsets.only(left: TSizes.sm,top: TSizes.sm,bottom: TSizes.md),
            child:Text("Information Fondateur",style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TColors.darkerGrey),),
            ),
            Padding(
              padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.md ),
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: controllerForm.formulaireTextCheval(
                   iconPrefix:Iconsax.user,label:TText.directeur,
                  textEditingController: controller.directeur
                 )),
                 SizedBox(width: 6,),
                 Expanded(flex: 2,
                 child:controllerForm.formulaireTextCheval(
                iconPrefix:Icons.phone_outlined,label:TText.phoneDirecteur,
                 textEditingController: controller.phoneDirecteur
              ) ),
              ],),
            ),
        ],
       ),
    ),
    );
  }
}