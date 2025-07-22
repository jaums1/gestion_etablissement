
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/user_controller.dart';


class TRegisterReponsiveFormPasswordColum extends StatelessWidget {
  const TRegisterReponsiveFormPasswordColum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final controllerForm = TFormulaire();
       final controller = Get.find<TUserController>();
    return Column(
     children: [
        ///// MOT DE PASSE
         
         Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.password,
            isPassword: controller.variable.hidePassword.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:(){
              controller.variable.hidePassword.value =!controller.variable.hidePassword.value;
            },textEditingController: controller.variable.password,isVerification: true
            )),

          SizedBox(height: TSizes.spaceBtwInputfields,),
          Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.confirpassword,
            isPassword: controller.variable.hidePasswordConfirm.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:(){
              controller.variable.hidePasswordConfirm.value = !controller.variable.hidePasswordConfirm.value;
            },textEditingController: controller.variable.passwordConfirm,isVerification: true
            )),
     ],
    );
  }
}