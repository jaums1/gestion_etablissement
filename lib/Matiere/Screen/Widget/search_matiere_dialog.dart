import 'package:ecole/Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import 'package:ecole/Configs/cammon/widgets/buttons/button.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Matiere/Controller/filtre_matiere.dart';
import 'package:ecole/Matiere/Controller/page_matiere.dart';
import 'package:ecole/Matiere/Controller/validation_matiere.dart';
import 'package:ecole/Matiere/Model/matiere_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../Controller/matiere_controller.dart';


class SearchMatiereDialog extends StatelessWidget {
  
  SearchMatiereDialog({super.key});

  final controller = Get.find<TMatiereController>();
  final formulaire       = TFormulaire();
  final filtre        = TFiltreMatiere();
  @override
  Widget build(BuildContext context) {
  
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title:  Text(TText.rechcercheMatiere),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: Row(
              spacing: 10,
              children: [
                Expanded(
                  flex: 5,
                  child: formulaire.textFormField(
          hintText:TText.libMatiere,label:TText.recherche,iconPrefix:Iconsax.search_normal,
          onChanged:(value)=>filtre.H_FiltreElement(param:value ) ),),

                Expanded(child: SizedBox(
                  width: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TButton.iconButton(
                        text: "${TText.add} ${TText.libMatiere}",icon: Iconsax.add,
                        onPressed: () => TMatierePage().H_PageShowDialogNouveau(),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
         
          const SizedBox(height: 20),
          Obx(() {
            final filtered = controller.DataTableFiltreMatiere;
            return SizedBox(
              height: 300,
              width: 400,
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final data = filtered[index];
                  return ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      TTableActionIconButtons(iconSize: 20,
                      onEditPressed: ()=>TMatierePage().H_PageShowDialogModifier(id: data.iDMatiere),
                      onDeletePressed: ()=>TMatiereValidation().H_Supprimer(id: data.iDMatiere),
                      )
                      ],
                    ),
                    leading: const CircleAvatar(
                      child: Icon(Iconsax.note),
                    ),
                    title: Text(data.matiere.toString()),
                    subtitle: data.codeMatiere==null? null:Text(data.codeMatiere!),
                    onTap: () {
                      controller.DataMatiere.value= data;
                      // eleveController.edite.value = !eleveController.edite.value;
                      
                      Get.back(result: data);
                    },
                  );
                },
              ),
            );
          }),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}

// Fonction pour afficher le dialogue de recherche
Future<TMatiereModel?> showSearchMatiereDialog() {
  return showDialog<TMatiereModel>(
    context: Get.context!,
    builder: (BuildContext context) => SearchMatiereDialog(),
  );
}