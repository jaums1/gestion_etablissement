import 'package:ecole/Classe/Controller/classe_page.dart';
import 'package:ecole/Classe/Controller/classe_validation.dart';
import 'package:ecole/Classe/Model/classe_model.dart';
import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../Configs/cammon/widgets/Chargement/etat_chargement.dart';
import '../Configs/cammon/widgets/appbarSearch/appbar_search.dart';
import '../Configs/cammon/widgets/appbarSearch/training_search.dart';
import '../Inscription/Controller/inscription_function.dart';
import '../Scolarite/Controller/scolarite_controller.dart';
import '../Classe/Controller/classe_controller.dart';
import '../Classe/Controller/classe_filtre.dart';


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
  classeController.DataTableClasse.isEmpty?classeController.H_RecupeData():"";
  controllerScolrite.DataTableScolarite.isEmpty?controllerScolrite.H_RecupeData():"";

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title: TAppBarSearch(onPressed:  () => TClassePage().H_PageShowDialogNouveau(),
      add: TText.classe,titre: "Une ${TText.classe}",),
      
      content: SizedBox(
         height: 370,
        width: 400,
        child: Column(
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

                if (classeController.isLoading.value==false) {
          return Center(child: TEtatChargement.H_ChargementCircle(onPressedChargement:() => classeController.H_RecupeData()));
        }
        
        // État quand les données sont vides
        if (classeController.DataTableClasse.isEmpty && classeController.DataTableFiltreClasse.isEmpty) {
          return Center(child: TEtatChargement.H_EtatDataVide(onPressedChargement: () => classeController.H_RecupeData(),));
        }



           List<TClasseModel> filteredClasses= classeController.DataTableFiltreClasse;
        
              return Flexible(
                child: ListView.builder(
                  itemCount: filteredClasses.length,
                  itemBuilder: (context, index) {
                    final classe = filteredClasses[index];
                    return ListTile(
                      trailing: TTrainingSearch(
                        onDeletePressed: () =>TClasseValidation().H_Supprimer(id: classe.IDClasse),
                        onEditPressed: () => TClassePage().H_PageShowDialogModifier(id: classe.IDClasse) ,
                      ),
                      leading: const CircleAvatar(
                        child: Icon(Icons.class_),
                      ),
                      title: Text(classe.LibClasse.toString()),
                      subtitle: Text('Niveau étude: ${classe.DataNiveauSerie!.niveauSerie.toString()}'),
                      onTap: () {
                        //  if( classeController.DataClasse.value.IDClasse==classe.IDClasse ){
                        //   Get.back();
                        //   return;
                        // } 
                      /////// RECHERCHE
                    
                      if(TInscriptionFunction().H_onSelectScolarite(id:classe.DataNiveauSerie!.iDNiveauScolaire )==-1)return;
                      
                        // TClasseFiltre().H_SelectClasseNiveauSerieParID(param: classe.LibClasse);
          
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