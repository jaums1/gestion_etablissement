import 'package:ecole/Configs/cammon/widgets/formulaire/form.dart';
import 'package:ecole/Niveau_Scolaire/Model/niveauscolaire_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Configs/cammon/widgets/Chargement/etat_chargement.dart';

import '../../../Configs/utils/Constant/texte_string.dart';
import '../Niveau_Scolaire/Controller/niveauscolaire_controller.dart';
import '../Niveau_Scolaire/Controller/niveauscolaire_filtre.dart';
import '../Scolarite/Controller/scolarite_controller.dart';

class SearchNiveauScolaireDialog extends StatelessWidget {
  SearchNiveauScolaireDialog({super.key, this.arg = ""});
  final String? arg;
  final searchController = TextEditingController();
  final Controller = Get.find<TNiveauScolaireController>();
  final formulaire = TFormulaire();
  final filtre = TNiveauScolaireFiltre();
  @override
  Widget build(BuildContext context) {
    final controllerScolarite = Get.find<TScolariteController>();
    
    Controller.DataTableNiveauEtude.isEmpty ? Controller.H_RecupeData() : null;
    
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 5,
              child: Text(
                TText.RechercheNiveauScolaire,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
        ],
      ),
      content: SizedBox(
        height: 370,
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            formulaire.textFormField(
                hintText: 'Nom, Prénom ou Matricule',
                label: 'Rechercher',
                iconPrefix: Iconsax.search_normal,
                onChanged: (value) => filtre.H_FiltreElement(param: value)),
            const SizedBox(height: 20),
            Obx(() {
              if (Controller.isLoading.value == false) {
                return Center(
                    child: SingleChildScrollView(
                      child: TEtatChargement.H_ChargementCircle(
                        
                          onPressedChargement: () => Controller.H_RecupeData()),
                    ));
              }
        
              // État quand les données sont vides
              if (Controller.DataTableNiveauEtude.isEmpty &&
                  Controller.DataTableNiveauEtude.isEmpty) {
                return Center(
                    child: SingleChildScrollView(
                      child: TEtatChargement.H_EtatDataVide(
                        height: 200,
                        onPressedChargement: () => Controller.H_RecupeData(),
                                      ),
                    ));
              }
              if(Controller.isreactive.value){}
              //  if(controllerScolarite.variable.DataTableNiveauScolaire.isEmpty || controllerScolarite.variable.DataTableNiveauScolaire.isNotEmpty){}
              final filtered = Controller.DataTableNiveauEtudeFiltre;
              final filtreScolarite =controllerScolarite.variable.DataTableNiveauScolaire;
                
              return Flexible(
                child:  ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final data = filtered[index];
                        bool select = filtreScolarite.indexWhere((e) => e.niveau == data.niveau) ==-1? false: true;
                        return ListTile(
                          trailing: arg == ""
                              ? null
                              : Checkbox(
                                  value: select,
                                  onChanged: (value) => controllerScolarite
                                      .onSelectNiveauScolaire(data: data)),
                          leading: const CircleAvatar(
                            child: Icon(Iconsax.activity),
                          ),
                          title: Text(
                            data.niveau.toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            if(arg==""){
                             Controller.DataNiveau.value = data;
                            Get.back(result: data);
                            }else{
                              controllerScolarite.onSelectNiveauScolaire(data: data);
                            }
                            
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
          onPressed: () {
             if(arg!=""){
              controllerScolarite.DataTableNiveauScolaire.value = controllerScolarite.variable.DataTableNiveauScolaire;
              controllerScolarite.DataTableNiveauScolaire.refresh();
              }
              Get.back();
          },
          child:  Text(arg==""?'Fermer':TText.validation),
        ),
      ],
    );
  }
}


// Fonction pour afficher le dialogue de recherche
Future<TNiveauModel?> showSearchNiveauScolaireDialog({String? arg}) {
  return showDialog<TNiveauModel>(
    context: Get.context!,
    // barrierDismissible: false,
    builder: (BuildContext context) => SearchNiveauScolaireDialog(
      arg: arg,
    ),
  );
}
