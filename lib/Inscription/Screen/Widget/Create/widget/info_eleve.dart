import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Device/devices_utility.dart';
import 'package:ecole/Eleves/Controller/eleve_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/enums.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Eleves/Screen/Widget/Create/create_eleve_principal.dart';
import '../../../../../Eleves/Screen/Widget/search_eleve_dialog.dart';
import '../../../../Controller/inscription_controller.dart';
import 'recherche_add_inscription.dart';

class InfoEleveInscription extends StatelessWidget {
  
  const InfoEleveInscription({super.key, this.controller});
  final TInscriptionController? controller;
  @override
  Widget build(BuildContext context) {
    final controllerEleve = Get.find<TEleveController>();
    print(controllerEleve.DataEleve.Nom);
    return TRoundedContainerCreate(
      child: Obx(
        (){
          if(controllerEleve.edite.value) null;
        final DataEleve = controllerEleve.DataEleve;
       return SizedBox(
          width: TDeviceUtility.isDesktopScreen(context) ? 500 : 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///// RECHERHE ET AJOUT
              SizedBox(
                child: RechercheAddInscription(
                  onPressedAdd:()=> Get.to(TCreateElevePrincipaleScreen(argument: TRoutes.registerinscription,),
                                      arguments: TraitementAction.nouveau.name) ,
                  onPressedRecherche: ()=>showSearchEleveDialog(),
                ),
              ),
             DataEleve.IDEtudiant==null?SizedBox():  SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // INFORMATION ELEVE
              SizedBox(
                child: Column(
                  children: [
                    /////// NOM ET PRENOMS
            DataEleve.IDEtudiant==null?SizedBox():InfoNomPreomsInscription(controller: controllerEleve,),
                   DataEleve.IDEtudiant==null?SizedBox(): SizedBox(
                      height: 4,
                    ),
                    /////// MATRICULE
                   DataEleve.IDEtudiant==null?SizedBox(): MatriculeSexeInscription(controller: controllerEleve,)
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

class MatriculeSexeInscription extends StatelessWidget {
  const MatriculeSexeInscription({
    super.key, required this.controller,
  });
final TEleveController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      (){ 
        if(controller.edite.value) null;
         final DataEleve = controller.DataEleve;
        
        return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
          child: TexteRicheCustom.TexteRicheLigne(
            textPrimaire:DataEleve.Matricule.toString() ,
           textSecondaire:"Matricule",colorPrimaire: Colors.deepOrange ),
        ),
         SizedBox(width: 20,),
         Expanded(
           child: TexteRicheCustom.TexteRicheLigne(textPrimaire:DataEleve.Sexe.toString() ,
           textSecondaire:"Sexe " ),
         ),
          
          
      
        ],
      ),
                        );}
    );
  }
}

class InfoNomPreomsInscription extends StatelessWidget {
  const InfoNomPreomsInscription({
    super.key, required this.controller,
  });
final TEleveController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
        if(controller.edite.value) null;
        final DataEleve = controller.DataEleve;
      return  SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child:  TexteRicheCustom.TexteRiches(textSecondaire: "Nom Prénoms",
      textPrimaire:"${DataEleve.Nom} ${DataEleve.Prenoms}",colorPrimaire: TColors.primary),),
      Expanded(child: TTableActionIconButtons(
        delete: false,
        onEditPressed: ()=> Get.to(TCreateElevePrincipaleScreen(argument: TRoutes.registerinscription,),
        arguments: TraitementAction.modifier.name
        ),
        iconSize: 24,
      ))
        ],
      ),
    );
      }
    );
  }
}


