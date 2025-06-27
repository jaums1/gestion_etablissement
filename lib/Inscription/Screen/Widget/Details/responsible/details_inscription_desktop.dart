import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Classe/Controller/classe_controller.dart';
import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';

import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../../Eleves/Controller/eleve_controller.dart';
import '../../../../Controller/inscription_controller.dart';


class TDetailsInscriptionDesktopView extends StatelessWidget {
  final controller = Get.find<TInscriptionController>();
  final controllerClasse = Get.find<TClasseController>();
  final controllerEleve = Get.find<TEleveController>();
   TDetailsInscriptionDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final combo = TCombo();
    return TCreateForm(
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ///// HEADER
              TRetourHeader(titre:"Details d'inscription",route: TRoutes.inscription,),
              SizedBox(height: TSizes.spaceBtwItems,),
              //// Combo Selection Annee Scolaire
              TRoundedContainerCreate(
                padding: EdgeInsets.symmetric(horizontal: TSizes.md,vertical:TSizes.xs ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child:  combo.comboTextChevale(
                     valeur: controller.variable.DateInscription.text,     
                    hintText: "Annee Scolaire",
                    sections:TText.Annees,
                                   label: "Annee Scolaire",onChanged:(value){}),
                    ),
                  ],
                ),
              ),
             
             SizedBox(height: TSizes.md,),
              //// INFORMATION ELEVE
              TRoundedContainerCreate(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     //// INFORMATION ELEVE
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TexteRicheCustom.TexteRiches(
                            textPrimaire: "SETIN MAHYL ALBAN ULRICH JUNIOR",
                             textSecondaire: "Nom Prénoms"),
                             SizedBox(height: TSizes.sm,),
                             SizedBox(
                              child: Wrap(
                                runSpacing: 10,
                                spacing: 20,
                                children: [
                                TexteRicheCustom.TexteRicheLigne(
                                  textPrimaire: "1139251U",colorPrimaire: TColors.buttonPrimary,
                                 textSecondaire: "Matricule"),

                                TexteRicheCustom.TexteRicheLigne(
                                  textPrimaire: "Masculin",
                                 textSecondaire: "Sexe"),
                                 
                                 TexteRicheCustom.TexteRicheLigne(
                                  textPrimaire: "30/10/2002",
                                 textSecondaire: "Date Naissance"),

                                 TexteRicheCustom.TexteRicheLigne(
                                  textPrimaire: "Zouan-Hounien",
                                 textSecondaire: "Lieu de Naissance"), 
                                 
                                  TexteRicheCustom.TexteRicheLigne(
                                  textPrimaire: "0767373056 - 0566863709",
                                                                   textSecondaire: "Contact"),
                                 
                                  TexteRicheCustom.TexteRicheLigne(
                                  textPrimaire: "Non Affecte(é)",colorPrimaire:TColors.error ,
                                                                   textSecondaire: "Statut"), 
                                 
                                  TexteRicheCustom.TexteRicheLigne(
                                  textPrimaire: "Non Boursier",colorPrimaire:TColors.error,
                                                                   textSecondaire: "Regime"),
                                ],
                              ),
                             )
                        ],
                      )),



                    SizedBox(width: TSizes.md,),

                    //// PHOTO ELEVE
                    Expanded(child: Container(color: Colors.red,height: 100,)),
                  ],
                ),
              )




              
              
              //// INFORMATION INSCRIPTION ET VERSEMENT
           
          
          ],
        )

    );
  }
}

