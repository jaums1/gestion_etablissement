
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/login_controller.dart';


class TRegisterForm extends StatelessWidget {
  const TRegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final controllerForm = TFormulaire();
     final controller     = Get.put(TLoginController());
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
        key: controller.registerFromKey,
        child:Column(
          children: [
          
              ///// USER
              controllerForm.textFormField(iconPrefix:Iconsax.user_add,label:TText.userName,textEditingController: controller.user,
              isVerification: true
              ),
            SizedBox(height: TSizes.spaceBtwInputfields,),
            Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.password,
            isPassword: controller.hidePassword.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:controller.ishidePassword,textEditingController: controller.password,isVerification: true
            )),

          SizedBox(height: TSizes.spaceBtwInputfields,),
          Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.confirpassword,
            isPassword: controller.hidePasswordConfirm.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:controller.ishidePasswordConfirm,textEditingController: controller.passwordConfirm,isVerification: true,
            )),
          // TDeviceUtility.isMobileScreen(context)?
          // TRegisterReponsiveFormPasswordColum(),
          // : TRegisterReponsiveFormPassword(),
          
            SizedBox(height: TSizes.spaceBtwSections/2+2,),
            //// VALIDER
           SizedBox(
               width: double.infinity,
                child:ElevatedButton(onPressed: controller.registerUser, child:  Text("Créez votre compte",style:const TextStyle(
                color: TColors.white,fontFamily: TText.fontFamilyPrimary,
               ) ),
              
             ) ,
             ),
          ],
        ))
      ],
     ),
    );
  }
}

