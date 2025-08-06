import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/Coupe Ssection/coupe_section.dart';
import '../../../../../Configs/cammon/widgets/combo/combo.dart';
import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../Controller/employe_controller.dart';
import '../../../../Controller/employe_function.dart';

class TInformationProfessionnelleEmploye extends StatelessWidget {
  const TInformationProfessionnelleEmploye({super.key});

  @override
  Widget build(BuildContext context) {
     final combo = TCombo();
      //  final formulaire = TFormulaire();
       final controller = Get.find<TEmployeController>();
    return   Form(
      key: controller.variable.keyInfoProfessionnelle,
      child: FocusTraversalGroup(
        child: Column(
          children: [
            TCoupeSectionTitre(titre: "Information professionnelles",),
                SizedBox(height: TSizes.spaceBtwItems,),
            ////MATRICULE
            //  formulaire.formulaireTextCheval(label: "Matricule",iconPrefix: Iconsax.code,
            //  textEditingController: controller.variable.MatriculeEmploye,isVerification: true),
              combo.comboTextChevale(
                   valeur: controller.variable.Fonction.text,     
                  hintText: "Fonction",
                  sections:controller.variable.fonctionsScolaires,
                 label: "Fonction",onChanged:TEmployeFunction().H_OnChangedFonction ),
        
           ////DEPARTEMENT
          //  combo.comboTextChevale(
          //         valeur: controller.variable.Departement.text, 
          //         hintText: "Département",
          //         sections:controller.variable.departements,
          //         label: "Département",onChanged:TEmployeFunction().H_OnChangedDepartement ), 
        
                  ///// DATE EMBAUCHE ET DATE DE FIN DE CONTRAT
                  // SizedBox(child: TDateProfessionnelleEmploye(formulaire: formulaire, controller: controller),),
                  
                  ////// STATUT ET TYPE CONTRAT
                  TStatutTypeContrat(combo: combo, controller: controller),
             
          ],
        ),
      ),
    );
  }
}

class TDateProfessionnelleEmploye extends StatelessWidget {
  const TDateProfessionnelleEmploye({
    super.key,
    required this.formulaire,
    required this.controller,
  });

  final TFormulaire formulaire;
  final TEmployeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
                     Expanded(child: formulaire.formulaireTextCheval(
                    isIconSuffix:true,readOnly: true,isVerification: true,
                    textInputType: TextInputType.datetime,
                    textEditingController:controller.variable.DateEmbauche.value,
                    onPressedIcon:TEmployeFunction().H_OnChangedDateEmbauce,
                    label: "Date Embauche",iconOpen:Iconsax.calendar)),
                     SizedBox(width: TSizes.spaceBtwItems,),
                    Expanded(
    child: formulaire.formulaireTextCheval(
    isIconSuffix:true,readOnly: true,
    textInputType: TextInputType.datetime,
    textEditingController:controller.variable.DateFinContrat.value,
    onPressedIcon:TEmployeFunction().H_OnChangedDateFinContat,
    label: "Date Fin contrat",iconOpen:Iconsax.calendar),
                    ),
      ],
    );
  }
}

class TStatutTypeContrat extends StatelessWidget {
  const TStatutTypeContrat({
    super.key,
    required this.combo,
    required this.controller,
  });

  final TCombo combo;
  final TEmployeController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
          combo.comboTextChevale(
           valeur: controller.variable.Statut.text, 
          hintText: "Statut",
          sections:controller.variable.statuts,
          label: "Statut",onChanged:TEmployeFunction().H_OnChangedStatut ), 
        SizedBox(height: TSizes.spaceBtwItems,),
          combo.comboTextChevale(
            valeur: controller.variable.TypeContrat.text,
          hintText: "Type Contrat",
          sections:controller.variable.typesContrat,
          label: "Type Contrat",onChanged:TEmployeFunction().H_OnChangedTypeContrat), 
      ],
    );
  }
}

