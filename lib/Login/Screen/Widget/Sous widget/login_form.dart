
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../Configs/routes/route.dart';
import '../../../../Configs/utils/Constant/colors.dart';
import '../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Configs/utils/Constant/texte_string.dart';
// import '../../../../Configuration/Screen/configuration.dart';
import '../../../Controller/login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override

  Widget build(BuildContext context) {
    
     final controllerForm = TFormulaire();
     final controller     = Get.put(TLoginController());
      //  String nb;
    return Form(
      key: controller.loginFromKey,
      child: Padding(padding: EdgeInsets.symmetric(vertical:  TSizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ////User
     controllerForm.textFormField(iconPrefix:Iconsax.user_add,label:TText.userName,textEditingController: controller.user,isVerification: true),

        SizedBox(height: TSizes.spaceBtwInputfields,),
         ///// MOT DE PASSE
         
         Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.password,
            isPassword: controller.hidePassword.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:controller.ishidePassword,textEditingController: controller.password,isVerification: true
            ),
         ),
      
       
         SizedBox(height: TSizes.spaceBtwInputfields/2,
         ),
         ///// SE SOUVENIR DE MOI ET  CODE D'ACTIVATION
   Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged:(value) => value,),
                    // SizedBox(width:TSizes.xs ,),
                    Expanded(child: Text("Se souvenir de moi",style: Theme.of(context).textTheme.bodyMedium,)),
                  ],
                ),
              ),
            ),
           Expanded(child: TextButton(onPressed: ()=>Get.toNamed(TRoutes.codeEtablissement), child: Align(alignment: Alignment.centerRight,child: Text("Avez vous votre code?",style: Theme.of(context).textTheme.bodyMedium,))))
          ],
         ),
         SizedBox(height: TSizes.spaceBtwSections,),
         //// VALIDER  controller.connexionUser TConfigurationScreen().getDialog  TRoutes.configuration
         SizedBox(
          width: double.infinity,
          child:ElevatedButton(onPressed:()=>Get.offAllNamed(TRoutes.menu) , child:  Text("Connexion",style:const TextStyle(
            color: TColors.white,fontFamily: TText.fontFamilyPrimary,
          ) ),
          
          ) ,
         ),
           SizedBox(height: TSizes.spaceBtwInputfields/4),
          
         
        ],
      ),
      ),
    );
  }
}