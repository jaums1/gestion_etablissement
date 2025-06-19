import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Controller/employe_controller.dart';
import '../../../../Controller/employe_validation.dart';
import '../widget/info_academique_employe.dart';
import '../widget/info_coordonne_employe.dart';
import '../widget/info_perso_employe.dart';
import '../widget/info_prof_employe.dart';
import '../widget/info_salaire_employe.dart';

class TCreateEmployeDesktopScreen extends StatelessWidget {
  const TCreateEmployeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final validate = TEmployeValidation();
      final controller = Get.find<TEmployeController>();
      final argument = Get.arguments;

    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///// HEADER
            TRetourHeader(titre:
            argument== TraitementAction.nouveau.name?
             "Enregistrement Employe":"Modification Employe",route: TRoutes.employe,),
            SizedBox(height: TSizes.spaceBtwItems,),

            /////// BODY
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //// INFORMATION PERSONNELLES
                Expanded(child: Padding(
                      padding: const EdgeInsets.only(right: TSizes.md),
                      child: TRoundedContainerCreate(
                        child: TEmployeInformationPerso(),
                      ),
                    )),
                
                 //// INFORMATION ACADEMIQUE ET PROFESSIONNELELES
               Expanded(
             child: Padding(
            padding: const EdgeInsets.only(right:  TSizes.md),
            child: SizedBox(
              child: Column(
                children: [
                  // INFORMATION ACADEMIQUE 
                  Padding(
                    padding: const EdgeInsets.only(bottom:  TSizes.md),
                    child: TRoundedContainerCreate(child:TInfoAcademiqueEmploye(),),
                  ),  
                  // INFORMATION  PROFESSIONNELELES
                  TRoundedContainerCreate(child:TInformationProfessionnelleEmploye(),),   
                ],
              ),
            ),
          ),
        ),
                
                //// INFORMATION COORDONNEES ET SALAIRE
          Expanded(
            child: Column(
                      children: [
                        //// INFORMATION COORDONNEES
                          Padding(
                    padding: const EdgeInsets.only(bottom:  TSizes.md),
                    child: TRoundedContainerCreate(
                      child:TInformationCoordonneeEmploye(),
                    ),
                  ),
                       //// INFORMATION SALAIRE
                          TRoundedContainerCreate(child:TInformationSalaireEmploye(),),
                      ],
                    ))
                ],
              ),
            ),

            //// BUTTON DE VALIDATION
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: MediaQuery.of(context).size.width*0.1,
                child: ElevatedButton(onPressed: (){
               final keyInfoPerso  =  controller.variable.keyInfoPerso.currentState!.validate();
               final keyInfoProfessionnelle =  controller.variable.keyInfoProfessionnelle.currentState!.validate();
               if (keyInfoPerso && keyInfoProfessionnelle) {
                argument == TraitementAction.nouveau.name?
                 validate.H_Enregistrer():validate.H_Modifier()
                 ;
               }
                
                }, child: Text("Valider")) ,
               ),
            )
          ],
        ),
      ));
  }
}

