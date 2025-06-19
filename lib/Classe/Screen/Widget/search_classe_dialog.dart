import 'package:ecole/Classe/Model/classe_model.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../Controller/classe_controller.dart';
import '../../Controller/classe_filtre.dart';


class SearchClasseDialog extends StatelessWidget {
  SearchClasseDialog({super.key});

  final searchController = TextEditingController();
  final classeController = Get.find<TClasseController>();
  final formulaire = TFormulaire();
  final filtre = TClasseFiltre();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title: const Text('Rechercher une classe'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          formulaire.textFormField(
            hintText: 'Nom ou Code de la classe',
            label: 'Rechercher',
            iconPrefix: Iconsax.search_normal,
            onChanged: (value) => filtre.H_FiltreElement(param: value),
          ),
          const SizedBox(height: 20),
          Obx(() {
            final filteredClasses = classeController.DataTableFiltreClasse;
            return SizedBox(
              height: 300,
              width: 400,
              child: ListView.builder(
                itemCount: filteredClasses.length,
                itemBuilder: (context, index) {
                  final classe = filteredClasses[index];
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.class_),
                    ),
                    title: Text(classe.LibClasse.toString()),
                    subtitle: Text('Code: ${classe.DataNiveauSerie!.niveauSerie.toString()}'),
                    onTap: () {
                      classeController.DataClasse = classe;
                      classeController.edite.value = !classeController.edite.value;
                      Get.back(result: classe);
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
Future<TClasseModel?> showSearchClasseDialog() {
  return showDialog<TClasseModel>(
    context: Get.context!,
    builder: (BuildContext context) => SearchClasseDialog(),
  );
} 