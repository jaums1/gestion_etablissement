import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Employe/Model/employe_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../Configs/cammon/widgets/Data_table/table_action_icon_button.dart';
import '../Configs/cammon/widgets/buttons/button.dart';
import '../Configs/utils/Constant/texte_string.dart';
import '../Employe/Controller/employe_controller.dart';
import '../Employe/Controller/employe_filtre.dart';
import '../Employe/Controller/employe_page.dart';
import '../Employe/Controller/employe_validation.dart';

class SearchEmployeDialog extends StatelessWidget {
  
  SearchEmployeDialog({super.key});

  final searchController = TextEditingController();
  final Controller = Get.find<TEmployeController>();
  final formulaire       = TFormulaire();
  final filtre        = TEmployeFiltre();
  @override
  Widget build(BuildContext context) {
    //  eleveController.DataTableFiltreEleve.value = eleveController.DataTableEleve;
    Controller.DataTableEmploye.isEmpty? Controller.H_RecupeData() : null;
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Text('Rechercher un Employe',maxLines: 1,overflow: TextOverflow.ellipsis,)),

          Expanded(child: SizedBox(width: 10,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    
                      TButton.iconButton(
                        text: "${TText.add} ${TText.Employe}",icon: Iconsax.add,
                        onPressed: () => TEmployePage().H_PageShowDialogNouveau(),
                      ),
        ])
                      )
                      )
        ],
      ),
      content: SizedBox(
        height: 370,
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           formulaire.textFormField(
            hintText:'Nom, Prénom ou Matricule',label:'Rechercher',iconPrefix:Iconsax.search_normal,
            onChanged:(value)=>filtre.H_FiltreElement(param:value ) ),
            const SizedBox(height: 20),
            Obx(() {
             
        
                if (Controller.isLoading.value==false) {
          return Center(child: TEtatChargement.H_ChargementCircle(onPressedChargement:() => Controller.H_RecupeData()));
        }
        
        // État quand les données sont vides
        if (Controller.DataTableEmploye.isEmpty && Controller.DataTableFiltreEmploye.isEmpty) {
          return Center(child: TEtatChargement.H_EtatDataVide(onPressedChargement: () => Controller.H_RecupeData(),));
        }
        
             final filtered = Controller.DataTableFiltreEmploye;
        
              return Flexible(
                
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final data = filtered[index];
                    return ListTile(
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        TTableActionIconButtons(iconSize: 20,
                        onEditPressed: ()=>TEmployePage().H_PageShowDialogModifier(id: data.IDEmploye),
                        onDeletePressed: ()=>TEmployeValidation().H_Supprimer(id: data.IDEmploye),
                        )
                        ],
                      ),
                      leading: const CircleAvatar(
                        child: Icon(Iconsax.briefcase),
                      ),
                      title: Text(data.NomComplet.toString()),
                      subtitle: Text('${data.Fonction}',maxLines: 1,overflow: TextOverflow.ellipsis,),
                      onTap: () {
                        
                        Controller.DataEmploye.value= data;
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
Future<TEmployeModel?> showSearchEmployeDialog() {
  return showDialog<TEmployeModel>(
    context: Get.context!,
    builder: (BuildContext context) => SearchEmployeDialog(),
  );
}