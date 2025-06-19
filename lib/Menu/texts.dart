import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogController extends GetxController {
  var currentPage = 0.obs;

  void next() => currentPage.value++;
  void previous() => currentPage.value--;
}

class CustomDialog extends StatelessWidget {
  final DialogController controller = Get.put(DialogController());

  final List<Widget> pages = [
    Center(child: Text("Page 1")),
    Center(child: Text("Page 2")),
    Center(child: Text("Page 3")),
  ];

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: SizedBox(
        width: 300,
        height: 200,
        child: Obx(() => Column(
          children: [
            Expanded(child: pages[controller.currentPage.value]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (controller.currentPage.value > 0)
                  TextButton(onPressed: controller.previous, child: Text("Précédent")),
                if (controller.currentPage.value < pages.length - 1)
                  TextButton(onPressed: controller.next, child: Text("Suivant")),
                if (controller.currentPage.value == pages.length - 1)
                  TextButton(
                    onPressed: () => Get.back(),
                    child: Text("Fermer"),
                  ),
              ],
            ),
          ],
        )),
      ),
    );
  }
  showDialog(){
  return Get.dialog(CustomDialog());
}
}


// ignore_for_file: use_key_in_widget_constructors

// import 'package:get/get.dart';
// import 'package:flutter/material.dart';


// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // // import '../controllers/setup_controller.dart';
// class SetupController extends GetxController {
//   var currentStep = 0.obs;
//   var completedSteps = <int>[].obs;

//   // Exemple d’étape avec champ
//   var nameController = TextEditingController();
//   var nameError = ''.obs;

//   bool validateStep(int step) {
//     if (step == 0) {
//       if (nameController.text.trim().isEmpty) {
//         nameError.value = "Le nom est obligatoire";
//         return false;
//       } else {
//         nameError.value = "";
//         return true;
//       }
//     }
//     return true;
//   }

//   void nextStep() {
//     if (validateStep(currentStep.value)) {
//       if (!completedSteps.contains(currentStep.value)) {
//         completedSteps.add(currentStep.value);
//       }
//       currentStep.value++;
//     }
//   }

//   void goToStep(int step) {
//     if (step == 0 || completedSteps.contains(step - 1)) {
//       currentStep.value = step;
//     }
//   }
// }


// class SetupDialog extends StatelessWidget {
//   final SetupController controller = Get.put(SetupController());

//   final List<String> stepsTitles = [
//     "1. Infos",
//     "2. Cycle",
//     "3. Confirmation"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Configuration")),
//       body: Obx(() => Row(
//         children: [
//           // 🧭 Menu des étapes
//           Container(
//             width: 180,
//             color: Colors.grey[100],
//             child: ListView.builder(
//               itemCount: stepsTitles.length,
//               itemBuilder: (context, index) {
//                 bool isCompleted = controller.completedSteps.contains(index);
//                 bool isCurrent = controller.currentStep.value == index;

//                 return ListTile(
//                   title: Text(stepsTitles[index]),
//                   leading: Icon(
//                     isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
//                     color: isCompleted
//                         ? Colors.blue
//                         : (isCurrent ? Colors.orange : Colors.grey),
//                   ),
//                   onTap: () => controller.goToStep(index),
//                   tileColor: isCurrent
//                       ? Colors.orange[100]
//                       : isCompleted
//                           ? Colors.blue[50]
//                           : null,
//                 );
//               },
//             ),
//           ),

//           // 📄 Contenu de l’étape
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: IndexedStack(
//                 index: controller.currentStep.value,
//                 children: [
//                   // Étape 1
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Étape 1 : Informations", style: Theme.of(context).textTheme.headlineMedium),
//                       TextField(
//                         controller: controller.nameController,
//                         decoration: InputDecoration(
//                           labelText: "Nom",
//                           errorText: controller.nameError.value.isEmpty
//                               ? null
//                               : controller.nameError.value,
//                         ),
//                       ),
//                     ],
//                   ),

//                   // Étape 2
//                   Center(child: Text("Étape 2 : Choix du cycle")),

//                   // Étape 3
//                   Center(child: Text("Étape 3 : Confirmation")),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       )),

//       // 🔘 Boutons navigation
//       bottomNavigationBar: Obx(() => Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             if (controller.currentStep.value > 0)
//               TextButton(
//                 onPressed: () => controller.currentStep.value--,
//                 child: Text("Précédent"),
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 if (controller.currentStep.value == stepsTitles.length - 1) {
//                   Get.snackbar("Terminé", "Configuration enregistrée !");
//                 } else {
//                   controller.nextStep();
//                 }
//               },
//               child: Text(
//                 controller.currentStep.value == stepsTitles.length - 1
//                     ? "Terminer"
//                     : "Suivant",
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
//     showDialog(){
//   return Get.dialog(SetupDialog());
// }
// }

