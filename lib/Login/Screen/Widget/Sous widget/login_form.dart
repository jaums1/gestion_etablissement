import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Login/Controller/user_controller.dart';
import 'package:ecole/Login/Controller/user_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Configs/cammon/widgets/formulaire/form.dart';
import '../../../../Configs/routes/route.dart';
import '../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Configs/utils/Constant/texte_string.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerForm = TFormulaire();
    final validation   = TUserValidation();
    final controller = Get.find<TUserController>();
    //  String nb;
    return Form(
     
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ////User
            controllerForm.textFormField(
                iconPrefix: Iconsax.user_add,
                label: TText.userName,
                textEditingController: controller.variable.user,
                isVerification: true),

            SizedBox(
              height: TSizes.spaceBtwInputfields,
            ),
            ///// MOT DE PASSE

            Obx(
              () => controllerForm.textFormField(
                  iconPrefix: Iconsax.password_check,
                  label: TText.password,
                  isPassword: controller.variable.hidePassword.value,
                  isIconSuffix: true,
                  iconOff: Iconsax.eye_slash,
                  iconOpen: Iconsax.eye,
                  onPressedIcon: () {
                    controller.variable.hidePassword.value =
                        !controller.variable.hidePassword.value;
                  },
                  textEditingController: controller.variable.password,
                  isVerification: true),
            ),

            SizedBox(
              height: TSizes.spaceBtwInputfields / 2,
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
                        Obx(() => Checkbox(
                              value: controller.variable.rememberMe.value,
                              onChanged: (value) {
                                controller.variable.rememberMe.value = !controller.variable.rememberMe.value;
                              },
                            )),
                        // SizedBox(width:TSizes.xs ,),
                        Expanded(
                            child: Text( TText.seSouvenir,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: TextButton(
                        onPressed: (){
                          controller.variable.clear();
                           Get.toNamed(TRoutes.codeEtablissement);
                        },
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text( TText.votrecode,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ))))
              ],
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //// VALIDER  controller.connexionUser TConfigurationScreen().getDialog  TRoutes.configuration
            SizedBox(
              width: double.infinity,
              child: TButton.elevatedButton(
                padding: 17,
                text:TText.connexion .tr,
              onPressed: () async{
                // final key = controller.variable.loginFromKey.currentState!.validate();
                // if(key){
                 await validation.H_Connexion();
                // }
              },)
            ),
            SizedBox(height: TSizes.spaceBtwInputfields / 4),
          ],
        ),
      ),
    );
  }
}
