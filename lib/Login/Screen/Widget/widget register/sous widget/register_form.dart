
import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/user_controller.dart';
import '../../../../Controller/user_validation.dart';


class TRegisterForm extends StatelessWidget {
  const TRegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final validation   = TUserValidation();
     final controllerForm = TFormulaire();
        final controller = Get.find<TUserController>();
    return Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections/2),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /////AFFICHER CODE ETABLISSEMENT
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Expanded(
            child: RichText(text: TextSpan(
              text: "${TText.codeEtatblissement} : ",
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(text: "COD-09563456",
                style: Theme.of(context).textTheme.bodyMedium!.apply(color:TColors.warning )
                )
                  
              ]
              ),
              
            ),
          )
         
          ],
        ),
        SizedBox(height: TSizes.spaceBtwInputfields/2,),
      Form(
        key: controller.variable.registerFromKey,
        child:Column(
          children: [
          
              ///// USER
              controllerForm.textFormField(iconPrefix:Iconsax.user_add,label:TText.userName,
              textEditingController: controller.variable.user,
              isVerification: true
              ),
            SizedBox(height: TSizes.spaceBtwInputfields,),
            Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.password,
            isPassword: controller.variable.hidePassword.value ,isIconSuffix: true,
            iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:() {
                    controller.variable.hidePassword.value =!controller.variable.hidePassword.value;
                  },textEditingController: controller.variable.password,isVerification: true
            )),

          SizedBox(height: TSizes.spaceBtwInputfields,),
          Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.confirpassword,
            isPassword: controller.variable.hidePasswordConfirm.value ,
            isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:() {
                    controller.variable.hidePasswordConfirm.value =
                        !controller.variable.hidePasswordConfirm.value;
                  },textEditingController: controller.variable.passwordConfirm,isVerification: true,
            )),
         
          
            SizedBox(height: TSizes.spaceBtwSections/2+2,),
            //// VALIDER
           SizedBox(
               width: double.infinity,
                child:TButton.elevatedButton(text:"Créez votre compte".tr,
                padding: 17,
                onPressed: (){
                 final key = controller.variable.registerFromKey.currentState!.validate();
                if(key){
                  validation.H_CreationCompte();
                }
                }
                 ),
             ),
          ],
        ))
      ],
     ),
    );
  }
}

