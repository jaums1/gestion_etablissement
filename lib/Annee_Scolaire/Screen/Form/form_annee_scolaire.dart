import 'package:ecole/Annee_Scolaire/Controller/annee_scolaire_controller.dart';
import 'package:ecole/Annee_Scolaire/Controller/annee_scolaire_validation.dart';
import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Configs/cammon/widgets/TitrePage/titlepage.dart';
import '../../../Configs/utils/Constant/colors.dart';
import '../../../Configs/utils/Constant/sizes.dart';
import '../../../Configs/utils/Constant/texte_string.dart';
import '../../Controller/annee_scolaire_function.dart';

class FormAnneeScolaire extends StatelessWidget {
  const FormAnneeScolaire({super.key, this.onPressed});
 final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TAnneeScolaireController>();
    final formulaire = TFormulaire();
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
    appBar:AppBar(
        title:  TTitlePage(padding:false ,tilte:  TText.saveAnneeScolaire),
      ),
     body: Center(
      child: SizedBox(
        width: 350,
        child: SingleChildScrollView(
          child: TRoundedContainerCreate(
            padding : const EdgeInsets.symmetric(horizontal: TSizes.lg, vertical: TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
               formulaire.textFormField(
                isPadding: true,textEditingController: controller.variable.AnneeScolaire,
                label: TText.libAnneeScolaire,iconPrefix: Iconsax.refresh_circle
               ),
               SizedBox(
                child: Row(
                  spacing: 10,
                  children: [
                    //// DATE DEBUT
                     Expanded(child: formulaire.textFormField(
                          isPadding: true,textEditingController: controller.variable.DateDebut,
                          readOnly: true,label: TText.dateDebut,isIconSuffix: true,iconOpen: Iconsax.calendar_1,
                          onPressedIcon: () => TAnneeScolaireFunction().H_OnChangedDateDebut(),
                          ),
                     ),

                    //// DATE FIN
                   Expanded(child: formulaire.textFormField(
                        isPadding: true,textEditingController: controller.variable.DateFin,
                         readOnly: true, label: TText.dateFin,
                         isIconSuffix: true,iconOpen: Iconsax.calendar_1,
                         onPressedIcon: () => TAnneeScolaireFunction().H_OnChangedDateFin(),
                        ),
                   ),
                  ],
                ),
               ),

               ////// VALIDATION
               
            // SizedBox(),
               SizedBox(
                width: double.infinity,
                child: TButton.elevatedButton(text: TText.validation,onPressed:onPressed??
                ()=> TAnneeScolaireValidation().H_Enregistrer() ),
               ),
             
              ],
            ),
          ),
        ),
      ),
    ) ,
    );
  }
}