import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/employe_controller.dart';
import '../../../../Controller/employe_validation.dart';
import '../widget/info_academique_employe.dart';
import '../widget/info_coordonne_employe.dart';
import '../widget/info_perso_employe.dart';
import '../widget/info_prof_employe.dart';
import '../widget/info_salaire_employe.dart';

class TCreateEmployeMobileScreen extends StatelessWidget {
  const TCreateEmployeMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final validate = TEmployeValidation();
      final controller = Get.find<TEmployeController>();
    final argument = Get.arguments;
    return  Scaffold(
      backgroundColor: TColors.softGrey,
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///// HEADER
            TRetourHeader(titre: argument== TraitementAction.nouveau.name?
             "Enregistrement Employe":"Modification Employe",route: TRoutes.eleve,),
            SizedBox(height: TSizes.spaceBtwItems,),
            //// INFORMATION PERSONNELLES
           Padding(
             padding: const EdgeInsets.only(bottom:  TSizes.md),
             child: TRoundedContainerCreate(child: TEmployeInformationPerso(),),
           ),
           //// INFORMATION PERSONNELLES
           Padding(
              padding: const EdgeInsets.only(bottom:  TSizes.md),
              child: TRoundedContainerCreate(child:TInfoAcademiqueEmploye(),),
                  ),
            //// INFORMATION COORDONNEES
             Padding(
              padding: const EdgeInsets.only(bottom:  TSizes.md),
              child: TRoundedContainerCreate(child:TInformationCoordonneeEmploye(),)
              ),
            // INFORMATION  PROFESSIONNELELES
                  Padding(
                    padding: const EdgeInsets.only(bottom:  TSizes.md),
                    child: TRoundedContainerCreate(child:TInformationProfessionnelleEmploye(),),
                  ),
            //// INFORMATION SALAIRE
                TRoundedContainerCreate(child:TInformationSalaireEmploye(),),
              SizedBox(height: TSizes.spaceBtwItems,),
            //// BUTTON DE VALIDATION
                Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.5,
                child: ElevatedButton(onPressed: (){
                ////VERIFICATION DES CHAMPS  
               final keyInfoPerso  =  controller.variable.keyInfoPerso.currentState!.validate();
               final keyInfoProfessionnelle =  controller.variable.keyInfoProfessionnelle.currentState!.validate();
               if (keyInfoPerso && keyInfoProfessionnelle) {
                ////VALIDATION
                argument == TraitementAction.nouveau.name? validate.H_Enregistrer():validate.H_Modifier();
               }}, child: Text("Valider")))) ,
                SizedBox(height: TSizes.spaceBtwItems,),
          ],
        ),
      )),
    );
  }
}