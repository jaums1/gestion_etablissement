import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Modèle pour une matière
class Matiere {
  final String nom;
  final String description;
  final double coefficient;

  Matiere({
    required this.nom,
    required this.description,
    required this.coefficient,
  });
}

// Modèle pour un niveau
class Niveau {
  final String nom;
  final List<Matiere> matieres;
  final RxBool isExpanded;

  Niveau({
    required this.nom,
    required this.matieres,
    bool expanded = false,
  }) : isExpanded = expanded.obs;
}

// Contrôleur GetX
class TableauController extends GetxController {
  final RxList<Niveau> niveaux = <Niveau>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    niveaux.addAll([
      Niveau(
        nom: "Licence 1",
        matieres: [
          Matiere(
            nom: "Mathématiques",
            description: "Analyse et algèbre de base",
            coefficient: 3.0,
          ),
          Matiere(
            nom: "Physique",
            description: "Mécanique et thermodynamique",
            coefficient: 2.5,
          ),
          Matiere(
            nom: "Informatique",
            description: "Programmation et algorithmes",
            coefficient: 2.0,
          ),
        ],
      ),
      Niveau(
        nom: "Licence 2",
        matieres: [
          Matiere(
            nom: "Mathématiques Avancées",
            description: "Analyse complexe et probabilités",
            coefficient: 3.5,
          ),
          Matiere(
            nom: "Physique Quantique",
            description: "Introduction à la mécanique quantique",
            coefficient: 3.0,
          ),
          Matiere(
            nom: "Base de Données",
            description: "Conception et gestion de BD",
            coefficient: 2.5,
          ),
        ],
      ),
      Niveau(
        nom: "Licence 3",
        matieres: [
          Matiere(
            nom: "Recherche Opérationnelle",
            description: "Optimisation et algorithmes",
            coefficient: 4.0,
          ),
          Matiere(
            nom: "Intelligence Artificielle",
            description: "Machine Learning et réseaux de neurones",
            coefficient: 3.5,
          ),
          Matiere(
            nom: "Génie Logiciel",
            description: "Développement d'applications",
            coefficient: 3.0,
          ),
        ],
      ),
    ]);
  }

  void toggleNiveau(int index) {
    niveaux[index].isExpanded.toggle();
  }

  void ajouterMatiere(int niveauIndex, Matiere matiere) {
    niveaux[niveauIndex].matieres.add(matiere);
    niveaux.refresh();
  }

  void supprimerMatiere(int niveauIndex, int matiereIndex) {
    niveaux[niveauIndex].matieres.removeAt(matiereIndex);
    niveaux.refresh();
  }
}

// Widget principal
class TableauMatieres extends StatelessWidget {
  final TableauController controller = Get.put(TableauController());

  TableauMatieres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Système de Matières'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // En-tête du tableau
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                border: Border.all(color: Colors.blue.shade300),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 40), // Espace pour l'icône
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Niveau / Matière',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Coefficient',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            
            // Contenu du tableau
            Expanded(
              child: Obx(() => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue.shade300),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                child: ListView.builder(
                  itemCount: controller.niveaux.length,
                  itemBuilder: (context, index) {
                    final niveau = controller.niveaux[index];
                    return Column(
                      children: [
                        // Ligne du niveau
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.blue.shade200,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: InkWell(
                            onTap: () => controller.toggleNiveau(index),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Obx(() => Icon(
                                    niveau.isExpanded.value
                                        ? Icons.remove
                                        : Icons.add,
                                    color: Colors.blue.shade700,
                                    size: 20,
                                  )),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      niveau.nom,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Matières du niveau (affichées si expanded)
                        Obx(() => niveau.isExpanded.value
                            ? Column(
                                children: niveau.matieres.map((matiere) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 40),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              matiere.nom,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              matiere.description,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade600,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 4,
                                                horizontal: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.blue.shade100,
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Text(
                                                matiere.coefficient.toString(),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue.shade700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            : const SizedBox.shrink()),
                      ],
                    );
                  },
                ),
              )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMatiereDialog(context),
        backgroundColor: Colors.blue.shade700,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddMatiereDialog(BuildContext context) {
    final TextEditingController nomController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController coefficientController = TextEditingController();
    int selectedNiveau = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ajouter une matière'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<int>(
                value: selectedNiveau,
                decoration: const InputDecoration(
                  labelText: 'Niveau',
                  border: OutlineInputBorder(),
                ),
                items: controller.niveaux.asMap().entries.map((entry) {
                  return DropdownMenuItem<int>(
                    value: entry.key,
                    child: Text(entry.value.nom),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedNiveau = value ?? 0;
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nomController,
                decoration: const InputDecoration(
                  labelText: 'Nom de la matière',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: coefficientController,
                decoration: const InputDecoration(
                  labelText: 'Coefficient',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nomController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    coefficientController.text.isNotEmpty) {
                  final matiere = Matiere(
                    nom: nomController.text,
                    description: descriptionController.text,
                    coefficient: double.tryParse(coefficientController.text) ?? 0.0,
                  );
                  controller.ajouterMatiere(selectedNiveau, matiere);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }
}

// Application principale
class MyAppExemple extends StatelessWidget {
  const MyAppExemple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Système de Matières',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TableauMatieres(),
      debugShowCheckedModeBanner: false,
    );
  }
}




void main() {
  runApp(const MyAppExemple());
}