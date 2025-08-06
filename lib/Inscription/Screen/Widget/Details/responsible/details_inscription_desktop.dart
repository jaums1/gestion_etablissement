import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:ecole/Eleves/Model/eleve_model.dart';
import 'package:ecole/Inscription/Screen/Widget/Details/Widget/info_classe_inscription.dart';
import 'package:ecole/Versement/Controller/versement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Classe/Controller/classe_controller.dart';
import '../../../../../Configs/cammon/widgets/Bilan/bilan_montant_fbanc.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../../Configs/cammon/widgets/images/image_uploader.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';

import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../../Eleves/Controller/eleve_controller.dart';
import '../../../../../Versement/Controller/versement_controller.dart';
import '../../../../../Versement/Controller/versement_validation.dart';
import '../../../../../Versement/Model/versement_model.dart';
import '../../../../Controller/inscription_controller.dart';
import '../Widget/info_details_inscription.dart';
import '../Widget/info_eleve_inscription.dart';
import '../Widget/info_frais_inscription.dart';
import '../Widget/info_utilisateur.dart';

class TDetailsInscriptionDesktopView extends StatelessWidget {
  final controllerClasse = Get.find<TClasseController>();
  final controllerEleve = Get.find<TEleveController>();
  final controllerVersement = Get.find<TVersementController>();
  final controller = Get.find<TInscriptionController>();
  TDetailsInscriptionDesktopView({super.key});

  @override
  Widget build(BuildContext context) { 

    final page = TVersementPage();
    final formulaire =TFormulaire();

    controllerVersement.DataTableVersement.clear();
    controllerVersement.H_RecupeData(
        param: controller.DataInscription.value.IDInscription.toString());

    return  TCreateForm(
        titre: "Inscription",
        route: TRoutes.inscription,
        child: Column(
          spacing: TSizes.md,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ///// BILAN
            SizedBox(
               height: 65,
              child: Obx((){ 
                if (controllerVersement.DataTableVersement.isEmpty){}
              return Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: TBilanMontantFondBlanc(
                          montant: controller.DataInscription.value.Paiement,
                          sousTitre: TText.bilanPaiement,
                          color: TColors.paiementColor,
                        ),
                      ),

                      TBilanMontantFondBlanc(
                        montant: controller.DataInscription.value.ResteAPayer,
                        sousTitre: TText.bilanSolde,
                        color: TColors.resteAPayerColor,
                      ),

                      TBilanMontantFondBlanc(
                        montant: controller.DataInscription.value.NetAPayer,
                        sousTitre: TText.bilanNetApayer,
                        color: TColors.netAPayerColor,
                      ),

                      
                    ],
                  );}),
            ),


            //// INFORMATION ELEVE
            InfoAffichageEleveInscription(),
           
            //// INFORMATION INSCRIPTION ET VERSEMENT
            SizedBox(
              child: IntrinsicHeight(
                child: Row(
                  spacing: TSizes.md,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Column(
                              spacing: 10,
                              children: [
                        TRoundedContainerCreate(
                          child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [

                                     Expanded(child: Row(
                                      spacing: 15,
                                       children: [
                                         SizedBox(width: 150,
                                           child: formulaire.textFormField(
                                            isPadding: true,
                                            label: "Date Debut"),
                                         ),

                                          SizedBox(width: 150,
                                           child: formulaire.textFormField(
                                            isPadding: true,
                                            label: "Date Fin"),
                                         ),


                                       ],
                                     )),
                                       

                                      TButton.iconButton(text: "Ajouter",icon: Iconsax.add,size: TSizes.md,
                                          onPressed: () =>page.H_PageShowDialogNouveau(id: controller.DataInscription.value.IDInscription)),
                                    ],
                                  )
                                  
                              
                        ),
                        Obx(() {
                          controllerVersement.H_MiseAjour();
                          return controllerVersement.DataTableVersement.isEmpty
                              ? Shimmer.fromColors(
                                  baseColor: TColors.buttonPrimary,
                                  highlightColor: TColors.darkGrey,
                                  child: Column(
                                    spacing: 10,
                                    children: controllerVersement
                                        .DataTableFiltreVersement.map(
                                      (element) => CardreVersement(
                                        controller: element,
                                      ),
                                    ).toList(),
                                  ),
                                )
                              : Column(
                                  spacing: 10,
                                  children: controllerVersement
                                      .DataTableFiltreVersement.map(
                                    (element) => CardreVersement(
                                      controller: element,
                                    ),
                                  ).toList(),
                                );
                        }),
                                            ],
                                          )),
                   
                    //// INFORMATION INSCRIPTION ET CLASSE
                
                    Expanded(
                        child: Column(
                          spacing: TSizes.md,
                          crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                        /////// INFORMATION STATUT PAIEMENT
                        SizedBox(
                            width: double.infinity,
                            child: TRoundedContainerCreate(
                              child: InfoDetailsInscription(),
                            )),
                        
                                            
                        
                        ///// INFORMATION DE CLASSE
                        SizedBox(
                          width: double.infinity,
                          child: TRoundedContainerCreate(
                            child: InfoClasseInscription()
                          ),
                        ),
                                                       
                        /////// INFORMATION INSCRIPTION
                        SizedBox(
                          width: double.infinity,
                          child: TRoundedContainerCreate(
                              child: InfoFraisInscription()),
                        ),
                        
                        ///// UTILISATEUR
                        SizedBox(
                          width: double.infinity,
                          child: TRoundedContainerCreate(
                            padding:EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.md) ,
                            child: InfoUtilisateurInscription()),
                        ),
                                            ],
                                          )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class CardreVersement extends StatelessWidget {
  const CardreVersement({
    super.key,
    required this.controller,
  });
  final TVersementModel controller;
  @override
  Widget build(BuildContext context) {
    final validation = TVersementValidation();
    final page = TVersementPage();
    return TRoundedContainerCreate(
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  child: TTableActionIconButtons(
                iconSize: 22,
                onDeletePressed: () =>
                    validation.H_Supprimer(id: controller.IDVersement),
                onEditPressed: () {
                  page.H_PageShowDialogModifier(id: controller.IDVersement);
                },
              )),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: TColors.primary.withValues(alpha: 0.2),
              foregroundColor: TColors.primary,
              child: Icon(Iconsax.card_receive),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TTextCustom.title(
                        text: TFormatters.formatCurrency(controller.Montant),
                        size: 16)),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TexteRicheCustom.TexteRicheLigne(
                        textPrimaire: controller.TypePaiement.toString(),
                        textSecondaire: "Mode de Paiement")
                  ],
                ))
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TexteRicheCustom.TexteRicheLigne(
                      textPrimaire: controller.Ref.toString(),
                      textSecondaire: "Ref",
                      colorPrimaire: TColors.primary),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TexteRicheCustom.TexteRicheLigne(
                        textPrimaire:
                            TFormatters.formatDateFr(controller.DateVersement),
                        textSecondaire: "Date"),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AffichageDataEleve extends StatelessWidget {
  const AffichageDataEleve({super.key, required this.DataEleve});
  final TModelEleve DataEleve;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //// INFORMATION ELEVE
        Expanded(
            flex: 5,
            child: Column(
              spacing:TSizes.sm ,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TexteRicheCustom.TexteRiches(
                    textPrimaire: DataEleve.NomComplet.toString().toUpperCase(),
                    textSecondaire: "Nom Prénoms"),
               
                SizedBox(
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 20,
                    children: [
                      TexteRicheCustom.TexteRicheLigne(
                          textPrimaire: DataEleve.Matricule.toString(),
                          colorPrimaire: TColors.buttonPrimary,
                          textSecondaire: "Matricule"),

                      TexteRicheCustom.TexteRicheLigne(
                          textPrimaire: DataEleve.Sexe.toString(),
                          textSecondaire: "Sexe"),

                      TexteRicheCustom.TexteRicheLigne(
                          textPrimaire:
                              TFormatters.formatDateFr(DataEleve.DateNaissance),
                          textSecondaire: "Date Naissance"),

                      DataEleve.LieuNaissance == ""? SizedBox()
                          : TexteRicheCustom.TexteRicheLigne(
                              textPrimaire: DataEleve.LieuNaissance.toString(),
                              textSecondaire: "Lieu de Naissance"),

               DataEleve.Contact1 == null && DataEleve.Contact2 == null ?       TexteRicheCustom.TexteRicheLigne(
                          textPrimaire:
                              "${DataEleve.Contact1 ?? ''} ${DataEleve.Contact1 == null && DataEleve.Contact2 == null ? '' : '-'} ${DataEleve.Contact2 ?? ''}",
                          textSecondaire: "Contact"):SizedBox(),

                      TexteRicheCustom.TexteRicheLigne(
                          textPrimaire: DataEleve.Statut.toString(),
                          colorPrimaire: TColors.error,
                          textSecondaire: "Statut"),
                      TexteRicheCustom.TexteRicheLigne(
                          textPrimaire: DataEleve.Regime.toString(),
                          colorPrimaire: TColors.error,
                          textSecondaire: "Regime"),
                    ],
                  ),
                )
              ],
            )),

        SizedBox(
          width: TSizes.md,
        ),

        //// PHOTO ELEVE
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TImageUploader(
              height: 120,
              width: 120,
              imageType: ImageType.asset,
              circular: true,
              image: TImages.appLogo,
              editePhoto: false,
            ),
          ],
        )),
      ],
    );
  }
}
