
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Configs/cammon/widgets/Recherche_Add/recherche_add_create.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Emplacement_Texte/text_affiche_enligne.dart';
import '../../../../../Configs/utils/Emplacement_Texte/texte_cheval.dart';
import '../../../../../Eleves/Controller/eleve_page.dart';
import '../../../../../Eleves/Screen/Widget/search_eleve_dialog.dart';
import '../../../../Controller/inscription_controller.dart';

class InfoEleveInscription extends StatelessWidget {
    final controllerEleve = Get.find<TEleveController>();
   InfoEleveInscription({super.key, this.controller});
  final TInscriptionController? controller;
  @override
  Widget build(BuildContext context) {
  
    return TRoundedContainerCreate(
      child: Obx(
        (){
        var DataEleve = controllerEleve.DataEleve.value;
       return SizedBox(
          width: TDeviceUtility.isDesktopScreen(context) ? 500 : 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///// RECHERHE ET AJOUT
              SizedBox(
                child: TRechercheAddCreate(
                  onPressedAdd:()=> TElevePage().H_PageShowDialogNouveau() ,
                  onPressedRecherche: () async{
                 final resul= await showSearchEleveDialog();
                 if(resul !=null){
                  controllerEleve.DataEleve.value = resul;
                  DataEleve = controllerEleve.DataEleve.value ;
                 }
                
                 },
                  // onPressedRecherche: ()=>showSearchEleveDialog(),
                ),
              ),
             DataEleve.IDEtudiant==null?SizedBox():  SizedBox(height: TSizes.spaceBtwSections,),
              // INFORMATION ELEVE
              SizedBox(
                child: Column(
                  children: [
                    /////// NOM ET PRENOMS
            DataEleve.IDEtudiant==null?SizedBox():
               SizedBox(
                 child: TAffichageTextEnChevel(
                  label: "Nom Prenoms",
                  color: TColors.primary,
                  valeur: "${DataEleve.Nom} ${DataEleve.Prenoms}",
                  onPressed:()=> TElevePage().H_PageShowDialogModifier(id: DataEleve.IDEtudiant) ,
                 ),
               ),
            
            DataEleve.IDEtudiant==null?SizedBox(): SizedBox(height: 4,),
                    /////// MATRICULE ET SEXE
                   DataEleve.IDEtudiant==null?SizedBox():
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TAffichageTextEnLigne(
                           label: "Matricule",
                            valeur: DataEleve.Matricule??"",
                            color:  Colors.deepOrange,
                          ),
                          TAffichageTextEnLigne(
                           label: "Sexe",
                            valeur: DataEleve.Sexe??"",
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                   
                  ],
                ),
              )
            ],
          ),
        );
   } ),
    );
  }
}



