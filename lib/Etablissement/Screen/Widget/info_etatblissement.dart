
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../Controller/etablissement_controller.dart';

class TInforEtablissement extends StatelessWidget {
  const TInforEtablissement({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerForm = TFormulaire();
    //  final TEtablissementController controller     = Get.find();
    final controller     = Get.put(TEtablissementController());
    return Form(
      key: controller.keyForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///// TITRE DU CARDER
          Padding(padding: EdgeInsets.only(left: TSizes.sm,top: TSizes.sm,bottom: TSizes.md),
          child:Text("Information",style: Theme.of(context).textTheme.bodyMedium!.apply(
            color: TColors.darkerGrey),),
          ),
          ///// FORMULAIRE
          Padding(padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.sm ),
          child:controllerForm.formulaireTextCheval(
            isVerification: true,
            iconPrefix:Iconsax.password_check,label:TText.etatblissement,
             textEditingController: controller.etablissement
          ) ,
          ),
             Padding(padding: EdgeInsets.only(left: TSizes.md,right: TSizes.md,bottom:TSizes.md ),
          child:controllerForm.formulaireTextCheval(
             isVerification: true,
            iconPrefix:Iconsax.password_check,label:TText.codeEtatblissement,
             textEditingController: controller.codeEtablissemnt
          ) ,
          
          ),
          
        
        ],
      ),
    );
  }
}