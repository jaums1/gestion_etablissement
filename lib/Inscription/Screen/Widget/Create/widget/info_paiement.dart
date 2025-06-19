import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Device/devices_utility.dart';
import '../../../../../Scolarite/Controller/scolarite_controller.dart';
import '../../../../Controller/inscription_controller.dart';
import '../../../../Controller/inscription_function.dart';

class InfoPaiementInscription extends StatelessWidget {
  final combo = TCombo();
  final formulaire =TFormulaire();
  final controllerScolarite = Get.find<TScolariteController>();
   InfoPaiementInscription({super.key,required this.controller});
  final TInscriptionController controller;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainerCreate(
      child: SizedBox(
        width: TDeviceUtility.isDesktopScreen(context)? 500:200,
        child: Obx(
          (){ 
            if(controllerScolarite.edite.value) null;
           int Paiement = controller.variable.MontantVersement.text==""||  controller.variable.MontantVersement.text=="null"
           ?0:int.parse(controller.variable.MontantVersement.text); 
            int FraisAnnexe =0;
            int FraisInscription =0;
            int TotalAnnexeInscription =0;
            int TotalScolarite =0;
             if (controller.isFraisAnnexe.value==true && controller.isFraisInscription.value==true) {
            FraisAnnexe = int.parse(controller.variable.FraisAnnexe.text);
            FraisInscription = int.parse(controller.variable.DroitInscription.text);
            TotalAnnexeInscription = FraisInscription+FraisAnnexe;
            }
        
            TotalScolarite = TotalAnnexeInscription+Paiement;
            controller.variable.Paiement.text= TotalScolarite.toString();
           return Column(
            children: [
              // INFORMATION SUR FRAIS INSCRIPTION, FRAIS ANNEXE ET SCOLARITE
              SizedBox(
                child: Column(
                  children: [
                    /////// CLASSE
                    InfoAffichageInscription(titre: "Inscription + Frais Annexe",montant: "$TotalAnnexeInscription",),
                    
                    ///// DATE 
                    InfoScolariteInscription(
                      onChanged: () => TInscriptionFunction().H_OnChangedDate(),
                    readOnly: true,
                    controller: controllerScolarite,
                    formulaire: formulaire,text: "Date Inscription",
                    textEditingController: controller.variable.DateInscription,
                    ), 

                    //// SCOLARITE
                    InfoScolariteInscription(
                    controller: controllerScolarite,
                    formulaire: formulaire,text: "Scolarite",
                    textEditingController: controller.variable.MontantVersement,
                    ),
                     Divider(thickness: 0.5,height: 0.1),

                     //// AFFICHIER TOTAL
                     InfoAffichageInscription(titre: "Total",montant: "$TotalScolarite",color: Colors.redAccent,top: 20,
                     bottom: 0,),
                  ],
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
 final String? montant;
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
           TTextCustom.subtitle(text: "$montant Fcfa",color: color,fontWeight: FontWeight.bold),
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
     this.onChanged, this.readOnly=false,
  });
  final TScolariteController controller;
  final VoidCallback?  onChanged;
  final TFormulaire formulaire;
  final bool? readOnly;
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
                child:formulaire.textFormField(
                  onPressedIcon: onChanged,
                  iconOpen:readOnly ==true?Iconsax.calendar:null,
                  readOnly:readOnly ,
                  isIconSuffix:readOnly,
                  vertical: 12,
                  horizontal: 12,
                isPadding: true,
                isVerification: true,
                textInputType: TextInputType.number,
                textEditingController: textEditingController,
                onChanged: (value){
                    controller.edite.value=false;
                    controller.edite.value=true;
                    }   
                          ) ,
              ),
            
               
            ],
           )) 
          ],
        ),
      ),
    );
  }
}
