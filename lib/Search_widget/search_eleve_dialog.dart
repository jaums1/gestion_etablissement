import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../Configs/cammon/widgets/buttons/button.dart';
import '../Configs/utils/Constant/texte_string.dart';
import '../Eleves/Controller/eleve_controller.dart';
import '../Eleves/Controller/eleve_filtre.dart';
import '../Eleves/Controller/eleve_page.dart';
import '../Eleves/Model/eleve_model.dart';
import '../Inscription/Controller/inscription_function.dart';

class SearchEleveDialog extends StatelessWidget {
  
  SearchEleveDialog({super.key, this.arg});
  final String? arg;
  final searchController = TextEditingController();
  final eleveController = Get.find<TEleveController>();
  final formulaire       = TFormulaire();
  final filtre        = TFiltreEleve();
  @override
  Widget build(BuildContext context) {
       eleveController.DataTableEleve.isEmpty? eleveController.H_RecupeData():"";
    
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title:  Row(
        children: [
          Expanded(
            flex: 5,
            child: Text('Rechercher un Elève',maxLines: 1,overflow: TextOverflow.ellipsis,)),

          Expanded(child: SizedBox(width: 10,
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TButton.iconButton(
                        text: "${TText.add} ${TText.Eleve}",icon: Iconsax.add,
                        onPressed: () => TElevePage().H_PageShowDialogNouveau(),
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
               
               if (eleveController.isLoading.value == false) {
                  return Center(
                      child: TEtatChargement.H_ChargementCircle(onPressedChargement: () => eleveController.H_RecupeData()));
                }
               
               if (eleveController.DataTableEleve.isEmpty && eleveController.DataTableEleve.isEmpty) {
                  return Center(
                      child: TEtatChargement.H_EtatDataVide(
                        height: 200, onPressedChargement: () => eleveController.H_RecupeData(),));
                }
        
        
        
              final filteredEleves = eleveController.DataTableFiltreEleve;
              return Flexible(
                child: ListView.builder(
                  itemCount: filteredEleves.length,
                  itemBuilder: (context, index) {
                    final eleve = filteredEleves[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text('${eleve.Nom} ${eleve.Prenoms}'),
                      subtitle: Text('Matricule: ${eleve.Matricule}'),
                      onTap: () {
                        if(arg=="Inscription"){
                          if(TInscriptionFunction().H_OnVerification(data: eleve) !=-1) return ;
                        }
                       
                        eleveController.DataEleve.value= eleve;
                        // eleveController.edite.value = !eleveController.edite.value;
                        
                        Get.back(result: eleve);
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
Future<TModelEleve?> showSearchEleveDialog({String? arg}) {
  return showDialog<TModelEleve>(
    context: Get.context!,
    builder: (BuildContext context) => SearchEleveDialog(arg:arg ,),
  );
}