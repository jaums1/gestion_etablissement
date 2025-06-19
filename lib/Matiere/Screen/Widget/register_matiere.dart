
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Configs/cammon/widgets/buttons/button.dart';
import '../../../Configuration/Screen/Widget/cadre_configuration.dart';
import '../../Controller/matiere_controller.dart';
import '../../Controller/page_matiere_controller.dart';


class TRegisterMatiereScreen extends StatelessWidget {
  const TRegisterMatiereScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    final controller = Get.find<TMatiereController>();
    final controllerPage = Get.find<TPageMatiereController>();
    final formulaire = TFormulaire();
    // bool? result;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TCadreConfiguration(
        titre:controller.action.value==TraitementAction.nouveau.name?"Enregistrement Matière":"Modifier Matière" ,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.iconXl+20,vertical:TSizes.iconMd ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          formulaire.formulaireTextCheval(label: "Code Matière",textEditingController: controller.codeMatiere),
            SizedBox(height: TSizes.md,),
            formulaire.formulaireTextCheval(label: "Matière",textEditingController: controller.matiere),
              SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TButton.elevatedButton(text:"Valider",
                      onPressed:()async=> {
                      if(controller.action.value==TraitementAction.modifier.name){
                        //  result =  
                         await controller.H_Modifier(),
                        //  result ==true? TLoader.successSnack(title:"Modifier" ,message: "La matière a bien été modifier") :
                        //  TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion"),
                        //   result ==true?  controllerPage.previousPage() :"",
                      
                      }else if(controller.action.value==TraitementAction.nouveau.name){
                        await controller.H_Enregistrer(),
                      }
                        
                      } ),
                    SizedBox(width: 10,),
                    TButton.elevatedButton(text:"Fermer",isPrincipal: false,
                      onPressed:()=> controllerPage.previousPage() ),
                    ],
                  ),
            ),
          
            ],
          ),
        ),
      ),
    );
  }
}