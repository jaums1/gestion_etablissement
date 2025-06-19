import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../Controller/eleve_controller.dart';
import '../../Controller/eleve_filtre.dart';
import '../../Model/eleve_model.dart';

class SearchEleveDialog extends StatelessWidget {
  
  SearchEleveDialog({super.key});

  final searchController = TextEditingController();
  final eleveController = Get.find<TEleveController>();
  final formulaire       = TFormulaire();
  final filtre        = TFiltreEleve();
  @override
  Widget build(BuildContext context) {
    //  eleveController.DataTableFiltreEleve.value = eleveController.DataTableEleve;
    
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title: const Text('Rechercher un élève'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         formulaire.textFormField(
          hintText:'Nom, Prénom ou Matricule',label:'Rechercher',iconPrefix:Iconsax.search_normal,
          onChanged:(value)=>filtre.H_FiltreElement(param:value ) ),
          const SizedBox(height: 20),
          Obx(() {
            final filteredEleves = eleveController.DataTableFiltreEleve;
            return SizedBox(
              height: 300,
              width: 400,
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
                      
                      eleveController.DataEleve= eleve;
                      eleveController.edite.value = !eleveController.edite.value;
                      Get.back(result: eleve);
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
Future<TModelEleve?> showSearchEleveDialog() {
  return showDialog<TModelEleve>(
    context: Get.context!,
    builder: (BuildContext context) => SearchEleveDialog(),
  );
}