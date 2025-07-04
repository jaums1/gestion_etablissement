import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/image_string.dart';
import 'package:ecole/Configs/utils/formatters/formatters.dart';
import 'package:ecole/Eleves/Model/eleve_model.dart';
import 'package:ecole/Versement/Controller/versement_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Classe/Controller/classe_controller.dart';
import '../../../../../Configs/Breadcrumbs/breadcrumb.dart';
import '../../../../../Configs/cammon/widgets/Bilan_Montant/bilan_montant.dart';
import '../../../../../Configs/cammon/widgets/Create_form/create_form.dart';
import '../../../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../../../Configs/cammon/widgets/images/image_uploader.dart';
import '../../../../../Configs/routes/route.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';

import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../../Configs/utils/Device/devices_utility.dart';
import '../../../../../Eleves/Controller/eleve_controller.dart';
import '../../../../../Versement/Controller/versement_controller.dart';
import '../../../../../Versement/Controller/versement_validation.dart';
import '../../../../../Versement/Model/versement_model.dart';
import '../../../../Controller/inscription_controller.dart';


class TDetailsInscriptionDesktopView extends StatelessWidget {

  final controllerClasse = Get.find<TClasseController>();
  final controllerEleve = Get.find<TEleveController>();
  final controllerVersement = Get.find<TVersementController>();
   TDetailsInscriptionDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
      final controller = Get.find<TInscriptionController>();

    final DataClasse = controller.DataInscription.value.DataClasse??controllerClasse.DataClasse.value;
    final DataInscription = controller.DataInscription.value;
    final DataEleve = controller.DataInscription.value.DataEleve??controllerEleve.DataEleve.value;

    final combo = TCombo();
    final formulaire = TFormulaire();
    final page = TVersementPage();
    controllerVersement.H_RecupeData(param: DataInscription.IDInscription.toString());
    
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child:  combo.comboTextChevale(
                     valeur: controller.variable.DateInscription.value.text,     
                    hintText: "Annee Scolaire",
                    sections:TText.Annees,
                    label: "Annee Scolaire",onChanged:(value){}),
                    ),
                    
                    SizedBox(width: 10,),
                    SizedBox(
                      child: Row(
                        spacing: TSizes.md,
                        children: [
                         TBilanMontant(montant: DataInscription.Paiement,titre: "Montant Versé",
                         color: TColors.paiementColor,
                         ),
                         TBilanMontant(montant: DataInscription.ResteAPayer,titre: "Reste à payer",
                         color: TColors.resteAPayerColor,),
                         TBilanMontant(montant: DataInscription.NetAPayer,titre: "Net à payer",
                         color: TColors.netAPayerColor,),
                        ],
                      ),
                    )
                    
                  ],
                ),
              ),
             
             SizedBox(height: TSizes.md,),
              //// INFORMATION ELEVE
              TRoundedContainerCreate(
                child: AffichageDataEleve(DataEleve: DataEleve,)
              ),

              SizedBox(height: TSizes.md,),
              
              //// INFORMATION INSCRIPTION ET VERSEMENT
             SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Column(
                    spacing: 10,
                    children: [
                     TRoundedContainerCreate(
                      child: Row(
                        children: [
                          ///// RECHERCHE
        Expanded(
          flex: TDeviceUtility.isDesktopScreen(context)?  2: 1,
          child:formulaire.textFormField(hintText:"Recherche...",iconPrefix: Iconsax.search_normal,
          isPadding: true,onChanged:(value){} 
           ) ), 
            /// BUTTON()
            
           Expanded(
          flex: TDeviceUtility.isDesktopScreen(context)? 1 : 1,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TButton.iconButton(text: "Ajouter",icon: Iconsax.add,size: TSizes.md,
           onPressed:()=>page.H_PageShowDialogNouveau(id: DataInscription.IDInscription) ),
            ],
          )),],),),
                  Obx(
                        (){

                          return Column(
                               spacing: 10,
                               children: controllerVersement.DataTableFiltreVersement.map(
                               (element) => CardreVersement(controller: element,) ,).toList(),
                               );
                        }
                      ),
                    ],
                  )),
                     SizedBox(width: TSizes.md,),
                  //// INFORMATION INSCRIPTION ET CLASSE
                 
                   Expanded(
                   
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     /////// INFORMATION STATUT PAIEMENT
                        SizedBox(
                         width: double.infinity,
                        child: TRoundedContainerCreate (
                          child: Wrap(
                             spacing: 20,
                            runSpacing: 10,
                            children: [
                                
                                 TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire: DataInscription.Statut.toString(),colorPrimaire: TColors.error,
                               textSecondaire: "Statut"),

                                 TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire: TFormatters.formatDateFr(DataInscription.DateProchainVersement),colorPrimaire: TColors.error,
                               textSecondaire: "Date de Prochaine Paiement"),
                            ],
                          ) ,)
                       ),
                       
                          SizedBox(height: TSizes.md,),

                      ///// INFORMATION DE CLASSE 
                       SizedBox(
                         width: double.infinity,
                         child: TRoundedContainerCreate(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             //// INFORMATION CLASSE
                             TexteRicheCustom.TexteRiches(
                              textPrimaire: DataClasse.LibClasse.toString(),colorPrimaire: TColors.primary,
                               textSecondaire: "Classe"),
                           
                         
                               SizedBox(height: TSizes.sm,),
                               
                               //// INFORMATION DETAILS INSCRIPTION
                               SizedBox(
                                child: Wrap(
                                  spacing: 20,
                                  runSpacing: 5,
                                  children: [
                                    TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire:DataClasse.DataNiveauSerie!.niveau.toString(),
                               textSecondaire: "Niveau"),
                               
                                TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire: TFormatters.formatDateFr(DataInscription.DateInscription),
                               textSecondaire: "Inscrit le"),
                             
                                TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire: "2024 - 2025",colorPrimaire: Colors.red,
                               textSecondaire: "Annee Scolaire"),
                         
                         
                                  ],
                                ),
                               ),
                              
                            ],
                          ),
                         ),
                       ),

                       SizedBox(height: TSizes.md,),
                      /////// INFORMATION INSCRIPTION
                      SizedBox(
                          width: double.infinity,
                        child: TRoundedContainerCreate(
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 10,
                            children: [
                               TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire: TFormatters.formatCurrency(DataInscription.FraisAnnexe),
                               textSecondaire: "Frais Annexe"),
                               
                               TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire: TFormatters.formatCurrency(DataInscription.DroitInscription),
                               textSecondaire: "Droit Inscription"),
                               
                                 TexteRicheCustom.TexteRicheLigne(
                                 textPrimaire: TFormatters.formatCurrency(
                                  DataInscription.NetAPayer!-DataInscription.DroitInscription!-DataInscription.FraisAnnexe!),
                               textSecondaire: "Scolarite"),



                            ],
                          )
                          ),
                      ),
                     ],
                                       )),
                ],
              ),
             )
          
          ],
        )

    );
  }
}

class CardreVersement extends StatelessWidget {
  const CardreVersement({
    super.key,  required this.controller,
  });
 final TVersementModel controller;
  @override
  
  Widget build(BuildContext context) {
    final validation = TVersementValidation();
    return TRoundedContainerCreate(
      padding: EdgeInsets.symmetric(horizontal:  TSizes.md,vertical: TSizes.xs) ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(child: TTableActionIconButtons(iconSize: 22,
            onDeletePressed: ()=>validation.H_Supprimer(id: controller.IDVersement),
            onEditPressed: ()=> TVersementPage().H_PageShowDialogModifier(),)),
          ],
        ),
       
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: TColors.primary.withValues(alpha: 0.2),
            foregroundColor:TColors.primary ,
            child: Icon(Iconsax.card_receive),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: TTextCustom.title(text: TFormatters.formatCurrency(controller.Montant),size: 16)),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   TexteRicheCustom.TexteRicheLigne(textPrimaire: controller.TypePaiement.toString(), textSecondaire: "Mode de Paiement")
                ],
              ))
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: TexteRicheCustom.TexteRicheLigne(textPrimaire: controller.Ref.toString(),textSecondaire: "Ref",colorPrimaire: TColors.primary),),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TexteRicheCustom.TexteRicheLigne(textPrimaire: TFormatters.formatDateFr(controller.DateVersement), textSecondaire: "Date"),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TexteRicheCustom.TexteRiches(
                    textPrimaire:
                        DataEleve!.NomComplet.toString().toUpperCase(),
                    textSecondaire: "Nom Prénoms"),
                SizedBox(
                  height: TSizes.sm,
                ),
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
                      DataEleve.LieuNaissance == ""
                          ? SizedBox()
                          : TexteRicheCustom.TexteRicheLigne(
                              textPrimaire: DataEleve.LieuNaissance.toString(),
                              textSecondaire: "Lieu de Naissance"),
                      TexteRicheCustom.TexteRicheLigne(
                          textPrimaire:
                              "${DataEleve.Contact1 ?? ''} ${DataEleve.Contact1 == null && DataEleve.Contact2 == null ? '' : '-'} ${DataEleve.Contact2 ?? ''}",
                          textSecondaire: "Contact"),
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
