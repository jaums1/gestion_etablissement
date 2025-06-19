
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/login_controller.dart';

class TRegisterReponsiveFormPasswordColum extends StatelessWidget {
  const TRegisterReponsiveFormPasswordColum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final controllerForm = TFormulaire();
     final controller     = Get.put(TLoginController());
    return Column(
     children: [
        ///// MOT DE PASSE
         
         Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.password,
            isPassword: controller.hidePassword.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:controller.ishidePassword,textEditingController: controller.password,isVerification: true
            )),

          SizedBox(height: TSizes.spaceBtwInputfields,),
          Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.confirpassword,
            isPassword: controller.hidePasswordConfirm.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:controller.ishidePasswordConfirm,textEditingController: controller.passwordConfirm,isVerification: true
            )),
     ],
    );
  }
}