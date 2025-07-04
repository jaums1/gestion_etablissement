import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../../Configs/utils/formatters/formatters.dart';
import '../../../../../Scolarite/Controller/scolarite_controller.dart';
import '../../../../Controller/inscription_controller.dart';
import '../../../../Controller/inscription_function.dart';

class InfoPaiementInscription extends StatelessWidget {
 
  final controllerScolarite = Get.find<TScolariteController>();
  
   InfoPaiementInscription({super.key, required this.controller});
  final TInscriptionController  controller;
  @override
  Widget build(BuildContext context) {
    controller.variable.DateInscription.value.text = TFormatters.formatDateFr(DateTime.now()).toString() ;
    controller.DataInscription.value.DateInscription =DateTime.now();
    controller.DataInscription.value.TypePaiement = TText.MethodePaiement[0];
  final combo = TCombo();
  final formulaire =TFormulaire();
  final function = TInscriptionFunction();
  // final controller = Get.find<TInscriptionController>();
    return TRoundedContainerCreate(
      padding: EdgeInsets.all(TSizes.xs),
      child: SizedBox(
        // width: TDeviceUtility.isDesktopScreen(context)? 500:200,
        child: 
        Obx(
          (){ 
           if(controllerScolarite.edite.value)null;
           int Paiement = controller.variable.MontantVersement.text==""||  controller.variable.MontantVersement.text=="null"
           ?0:int.parse(controller.variable.MontantVersement.text); 
            int FraisAnnexe =0;
            int FraisInscription =0;
            int TotalAnnexeInscription =0;
            int TotalScolarite =0;
             if (controller.isFraisAnnexe.value==true && controller.isFraisInscription.value==true) {
            FraisAnnexe =controller.variable.FraisAnnexe.text ==""?0: int.parse(controller.variable.FraisAnnexe.text);
            FraisInscription =controller.variable.DroitInscription.text ==""?0: int.parse(controller.variable.DroitInscription.text);
           
            TotalAnnexeInscription = FraisInscription+FraisAnnexe;
            }
        
            TotalScolarite = TotalAnnexeInscription+Paiement;
            controller.variable.Paiement.text= TotalScolarite.toString();
         
           return Column(
            children: [
              // INFORMATION SUR FRAIS INSCRIPTION, FRAIS ANNEXE ET SCOLARITE
               
              SizedBox(
                child: Form(
                  key: controller.variable.keyInscription,
                  child: Column(
                    children: [
                      /////// CLASSE
                      InfoAffichageInscription(titre: "Inscription + Frais Annexe",montant: TotalAnnexeInscription,),
                      
                       ///// MODALITE DE PAIEMENT
                       combo.comboTextChevale(
                valeur: controller.DataInscription.value.TypePaiement,     
                hintText: "Méthode de Paiement",
                sections:TText.MethodePaiement,
               label: "Méthode de Paiement",onChanged:TInscriptionFunction().H_OnChangedMethodePaiement ) ,
                       
                       
                       ///// DATE 
                       SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          // runAlignment: WrapAlignment.spaceBetween,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child:formulaire.formulaireTextCheval(
                label: "Date Inscription",
                isIconSuffix: true,
                readOnly: true,
                textEditingController: controller.variable.DateInscription.value,
                iconOpen:Iconsax.calendar ,
                onPressedIcon: () => function.H_OnChangedDate()
                 )),
                SizedBox(
                  width: 200,
                  child: formulaire.formulaireTextCheval(
                label: "Date Prochain versement",
                isIconSuffix: true,
                readOnly: true,
                textEditingController: controller.variable.DateProchainVersement,
                iconOpen:Iconsax.calendar ,
                onPressedIcon: () => function.H_OnChangedDateProchainVersement()
                // TInscriptionFunction().H_OnChangedDate()
               ) ,
                )

               
                          ],
                        ),
                       ),
               
                 
                      //// SCOLARITE
                      InfoScolariteInscription( 
                        isVerification: false,
                      controller: controllerScolarite,
                      formulaire: formulaire,text: "Paiement",
                      textEditingController: controller.variable.MontantVersement,
                      ),
                       Divider(thickness: 0.5,height: 0.1),
                           
                       //// AFFICHIER TOTAL
                       InfoAffichageInscription(titre: "Total",montant:TotalScolarite,color: Colors.redAccent,top: 20,
                       bottom: 0,),
                    ],
                  ),
                ),
              )
            ],
          );}
        ),
      ),
    );
  }
}



class InfoAffichageInscription extends StatelessWidget {
  const InfoAffichageInscription({
    super.key, this.titre, this.montant, this.color= Colors.blueAccent, this.bottom=8.0, this.top=0,
  });
 final String? titre;
 final int? montant;
 final Color? color;
 final double? bottom;
 final double? top;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     child: Padding(
       padding:  EdgeInsets.only(bottom:  bottom!,top: top!),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           TTextCustom.subtitle(text: "$titre"),
           TTextCustom.subtitle(text: TFormatters.formatCurrency(montant),color: color,fontWeight: FontWeight.bold),
         ],
       ),
     ),
                      );
  }
}

class InfoScolariteInscription extends StatelessWidget {
  const InfoScolariteInscription({
    super.key,
    required this.formulaire, this.text, this.textEditingController, required this.controller,
     this.onChanged, this.readOnly=false,this.isVerification=true
  });
  final TScolariteController controller;
  final VoidCallback?  onChanged;
  final TFormulaire formulaire;
  final bool? readOnly;
  final bool? isVerification;
  final String? text;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:  10.0),
        child: Row(
          children: [
           Expanded(child: TTextCustom.subtitle(text: text.toString())),
           Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 200,
                child: formulaire.textFormField(
                    onPressedIcon: onChanged,
                    iconOpen:readOnly ==true?Iconsax.calendar:null,
                    readOnly:readOnly ,
                    isIconSuffix:readOnly,
                    vertical: 12,
                    horizontal: 12,
                  isPadding: true,
                  isVerification: isVerification,
                  textInputType: TextInputType.number,
                  textEditingController: textEditingController,
                  onChanged:(value) =>controller.edite.value= !controller.edite.value
                      
                        
                            ),
                ) ,
             
            
               
            ],
           )) 
          ],
        ),
      ),
    );
  }
}
