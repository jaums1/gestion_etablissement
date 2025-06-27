import 'package:ecole/Classe/Model/classe_model.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Scolarite/Controller/scolarite_controller.dart';
import '../../Controller/classe_controller.dart';
import '../../Controller/classe_filtre.dart';


// ignore: must_be_immutable
class SearchClasseDialog extends StatelessWidget {
  SearchClasseDialog({super.key, this.isScolarite=false});
  bool? isScolarite;
  final searchController = TextEditingController();
  final classeController = Get.find<TClasseController>();
  final controllerScolrite = Get.find<TScolariteController>();
  final formulaire = TFormulaire();
  final filtre = TClasseFiltre();

  @override
  Widget build(BuildContext context) {
      bool? isRecherche=true;
    // var filteredClasses=<TClasseModel>[];
    var DataTableClasse=<TClasseModel>[];
        classeController.DataTableFiltreClasse.value=classeController.DataTableClasse;
    var listeScolarite=controllerScolrite.DataTableScolarite.map((e) =>e.IDNiveauSerie).toList();
      if (isScolarite==true) {
                  DataTableClasse =   classeController.DataTableFiltreClasse.map((e) => e)
                        .where((data) => listeScolarite.contains(data.IDNiveauSerie)).toList();      
            }
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
            onChanged: (value) => isScolarite==true ?filtre.H_FiltreElementParIDNiveauSerie(param: value,
            DataTableClasse: DataTableClasse,length:DataTableClasse.length)
              : filtre.H_FiltreElement(param: value),
          ),
          const SizedBox(height: 20),
          Obx(() {
         List<TClasseModel> filteredClasses= classeController.DataTableFiltreClasse;
           if(classeController.DataTableFiltreClasse.isEmpty) null;
            // filteredClasses = classeController.DataTableFiltreClasse;
            
             if (isScolarite == false) filteredClasses = classeController.DataTableFiltreClasse;
             if (isScolarite == true){
               isRecherche == true?filteredClasses =  DataTableClasse:null;
               isRecherche = false;
             }



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
                    subtitle: Text('Niveau étude: ${classe.DataNiveauSerie!.niveauSerie.toString()}'),
                    onTap: () {
                      TClasseFiltre().H_SelectClasseNiveauSerieParID(param: classe.LibClasse);
                      
                      classeController.DataClasse.value = classe;
                      classeController.isinit.value =false;
                      classeController.isinit.value =true;
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
Future<TClasseModel?> showSearchClasseDialog({bool? isScolarite}) {
  return showDialog<TClasseModel>(
    context: Get.context!,
    builder: (BuildContext context) => SearchClasseDialog(isScolarite: isScolarite,),
  );
} 