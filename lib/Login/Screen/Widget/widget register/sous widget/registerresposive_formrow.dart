
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
import '../../../../../Configs/utils/Constant/texte_string.dart';
import '../../../../Controller/login_controller.dart';

class TRegisterReponsiveFormPassword extends StatelessWidget {
  const TRegisterReponsiveFormPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final controllerForm = TFormulaire();
     final controller     = Get.put(TLoginController());
    return Row(
     children: [
      

          // SizedBox(height: TSizes.spaceBtwInputfields,),
          
       Expanded(
        child: Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.password,
            isPassword: controller.hidePassword.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:controller.ishidePassword,textEditingController: controller.password
            )), 
        //  child: TextFormField(
        //       decoration: InputDecoration(
        //   suffixIcon:IconButton(onPressed: (){}, icon: Icon(Iconsax.eye)),
        //  prefixIcon: Icon(Iconsax.password_check),
        //  border: OutlineInputBorder(),
        //  label: Text(TText.password)
        //       ),
        //           ),
       ),
    SizedBox(width: TSizes.spaceBtwInputfields/2,),
    Expanded(
      child: Obx(
           ()=> controllerForm.textFormField(iconPrefix:Iconsax.password_check,label:TText.password,
            isPassword: controller.hidePasswordConfirm.value ,isIconSuffix: true,iconOff: Iconsax.eye_slash,iconOpen: Iconsax.eye,
            onPressedIcon:controller.ishidePasswordConfirm,textEditingController: controller.passwordConfirm
            )),
    ),
     ],
    );
  }
}