import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/cammon/widgets/combo/combo.dart';
import 'package:ecole/Configs/cammon/widgets/containers/rounded_container_create.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/cammon/widgets/texts/texte_riche.dart';
import 'package:ecole/Configs/utils/Constant/colors.dart';
import 'package:ecole/Configs/utils/Constant/enums.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Employe/Controller/employe_page.dart';
import 'package:ecole/Login/Controller/user_controller.dart';
import 'package:ecole/Login/Controller/user_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Configs/cammon/widgets/Recherche_Add/recherche_add_create.dart';
import '../../../../Configs/utils/Constant/sizes.dart';
import '../../../../Employe/Controller/employe_controller.dart';
import '../../../../Search_widget/search_employe_dialog.dart';

class FormUtilisateur extends StatelessWidget {
  const FormUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    final formulaire = TFormulaire();
    final combo = TCombo();
    final controller = Get.find<TUserController>();
    final controllerEmploye = Get.find<TEmployeController>();
    final argument = Get.arguments;
    return TRoundedContainerCreate(
      padding: EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.lg),
      child: Form(
        key: controller.variable.registerKey,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////// SELECTION EMPLOYE
            SizedBox(
              child: Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      TRechercheAddCreate(
                        onPressedAdd: () =>
                            TEmployePage().H_PageShowDialogNouveau(),
                        onPressedRecherche: () => showSearchEmployeDialog(),
                      ),
                      TexteRicheCustom.TexteRiches(
                          textPrimaire: controllerEmploye
                              .DataEmploye.value.NomComplet
                              .toString(),
                          textSecondaire: "Nom Prenoms",
                          colorPrimaire: TColors.primary)
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),

            /// FORMULAIRE
            formulaire.textFormField(
                label: TText.userName,
                iconPrefix: Iconsax.user,
                textEditingController: controller.variable.user,
                isVerification: true),

            SizedBox(
              child: Obx(() => Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: formulaire.textFormField(
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
                      Expanded(
                        child: formulaire.textFormField(
                            iconPrefix: Iconsax.password_check,
                            label: TText.confirpassword,
                            isPassword:
                                controller.variable.hidePasswordConfirm.value,
                            isIconSuffix: true,
                            iconOff: Iconsax.eye_slash,
                            iconOpen: Iconsax.eye,
                            onPressedIcon: () {
                              controller.variable.hidePasswordConfirm.value =
                                  !controller
                                      .variable.hidePasswordConfirm.value;
                            },
                            textEditingController:
                                controller.variable.passwordConfirm,
                            isVerification: true),
                      ),
                    ],
                  )),
            ),

            /////// TYPE ACCES
            combo.comboTextChevale(
                hintText: "Selectionner votre role",
                label: TText.roleaccess,
                sections: TText.role,
                valeur: controller.variable.role.text,
                onChanged: (value) {
                  controller.variable.role.text = value;
                }),

            //////// VALIDATION
            SizedBox(
              height: 40,
              width: double.infinity,
              child: TButton.elevatedButton(
                  text: TText.validation,
                  onPressed: () async {
                    bool result = controller.variable.registerKey.currentState!
                        .validate();

                    if (result == false) return;

                    argument == TraitementAction.nouveau.name
                        ? await TUserValidation().H_Enregistrer()
                        : await TUserValidation().H_Modifier();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
